#!/usr/bin/env luajit

-- LÖVE Wiki Tutorial Converter
-- Converts downloaded HTML wiki pages to clean markdown tutorials

-- ============================================================================
-- CONFIGURATION
-- ============================================================================

local TUTORIALS = {
    {
        html_file = "to_process/Config Files - LOVE.html",
        output_file = "docs/tutorials/config-files.md",
        title = "Config Files",
        wiki_page = "Config_Files"
    },
    {
        html_file = "to_process/Tutorial_Animation - LOVE.html",
        output_file = "docs/tutorials/animation.md",
        title = "Animation Tutorial",
        wiki_page = "Tutorial:Animation"
    },
    {
        html_file = "to_process/Tutorial_Callback Functions - LOVE.html",
        output_file = "docs/tutorials/callback-functions.md",
        title = "Callback Functions Tutorial",
        wiki_page = "Tutorial:Callback_Functions"
    },
    {
        html_file = "to_process/Tutorial_Using Input - LOVE.html",
        output_file = "docs/tutorials/using-input.md",
        title = "Using Input Tutorial",
        wiki_page = "Tutorial:Using_Input"
    },
}

-- ============================================================================
-- HELPER FUNCTIONS
-- ============================================================================

local function run_command(cmd)
    local handle = io.popen(cmd)
    local result = handle:read("*a")
    local success = handle:close()
    return result, success
end

local function file_exists(path)
    local f = io.open(path, "r")
    if f then
        f:close()
        return true
    end
    return false
end

local function write_file(filepath, content)
    local file, err = io.open(filepath, "w")
    if not file then
        error("Failed to open file " .. filepath .. ": " .. tostring(err))
    end
    file:write(content)
    file:close()
end

-- Clean up markdown content
local function clean_markdown(md)
    -- Remove the navigation/header section up to the actual title
    md = md:gsub('^.-(<div id="content".-\n# )', '# ')

    -- Remove navigation elements
    md = md:gsub('<div id="p%-cactions".-</div>\n\n', '')
    md = md:gsub('<span id="top"></span>\n\n', '')
    md = md:gsub('##### Views\n\n<div>.-</div>\n\n', '')

    -- Remove the entire TOC section (including Contents header)
    md = md:gsub('<div id="toc" class="toc">.-</div>\n\n', '')
    md = md:gsub('<div class="toctitle".-</div>', '')

    -- Remove TOC entries that look like: "- [1 Introduction](#Introduction)"
    md = md:gsub('\n%-   %[%d+[%.%d]*%s+(.-)%]%(#.-%)', '')
    md = md:gsub('\n%-   %[%d+%.%d+%s+(.-)%]%(#.-%)', '')

    -- Remove bodyContent wrapper divs
    md = md:gsub('<div id="bodyContent">', '')
    md = md:gsub('<div id="mw%-content%-text".->', '')
    md = md:gsub('<div class="mw%-parser%-output">', '')
    md = md:gsub('</div>\n\n</div>\n\n</div>', '')

    -- Remove category links at the bottom
    md = md:gsub('\n*%-   %[Category:.-', '')
    md = md:gsub('\n*Retrieved from.*', '')

    -- Clean up excessive divs and spans
    md = md:gsub('</?div[^>]*>', '')
    md = md:gsub('</?span[^>]*>', '')

    -- Fix code blocks - add lua language to bare code blocks with LÖVE code
    md = md:gsub('``` lua', '```lua')
    -- Add lua to code blocks that contain function, love., or other lua keywords
    md = md:gsub('```\n%s*(function[%s%(])', '```lua\n%1')
    md = md:gsub('```\n%s*(love%.)', '```lua\n%1')
    md = md:gsub('```\n%s*(local%s)', '```lua\n%1')
    md = md:gsub('```\n%s*(t%.)', '```lua\n%1')

    -- Remove empty links and clean up TOC-style links
    md = md:gsub('%[<span class="tocnumber">.-</span>%s*<span class="toctext">(.-)%-</span>%]%(#.-%)', '')

    -- Clean up wiki-style internal links - convert to plain text or code
    -- [love.function](/wiki/love.function) -> `love.function`
    md = md:gsub('%[love%.([%w%.]+)%]%(/wiki/love%.%1%)', '`love.%1`')
    md = md:gsub('%[love%.([%w%.]+)%]%([^%)]*"[^"]*"%)', '`love.%1`')

    -- Clean up any remaining wiki links
    md = md:gsub('%]%(/wiki/([^%)]+)%)', '](%1)')

    -- Remove access key attributes from links
    md = md:gsub(' accesskey=".-"', '')
    md = md:gsub(' title=".-"', '')
    md = md:gsub(' rel=".-"', '')

    -- Clean up excessive newlines
    md = md:gsub('\n\n\n+', '\n\n')

    -- Remove leading/trailing whitespace
    md = md:gsub('^%s+', ''):gsub('%s+$', '')

    return md
end

-- ============================================================================
-- CONVERSION FUNCTIONS
-- ============================================================================

local function convert_html_to_markdown(html_file)
    -- Use pandoc to convert HTML to GitHub-flavored markdown
    local cmd = string.format('pandoc -f html -t gfm "%s"', html_file)
    local markdown, success = run_command(cmd)

    if not success or not markdown or markdown == "" then
        error("Pandoc conversion failed for " .. html_file)
    end

    return markdown
end

local function process_tutorial(config)
    print("\n" .. string.rep("=", 70))
    print("Processing: " .. config.title)
    print(string.rep("=", 70))

    -- Check if source file exists
    if not file_exists(config.html_file) then
        print("ERROR: Source file not found: " .. config.html_file)
        return false
    end

    print("Converting HTML to Markdown...")
    local markdown = convert_html_to_markdown(config.html_file)

    print("Cleaning up markdown...")
    markdown = clean_markdown(markdown)

    -- Build final output with header
    local output = "# " .. config.title .. "\n\n"
    output = output .. "> This tutorial was imported from the [LÖVE Wiki](https://love2d.org/wiki/" .. config.wiki_page .. ").\n\n"
    output = output .. "---\n\n"
    output = output .. markdown .. "\n"

    -- Write to file
    print("Writing to: " .. config.output_file)
    write_file(config.output_file, output)

    print("✓ Success!")
    return true
end

-- ============================================================================
-- MAIN
-- ============================================================================

local function main()
    print("LÖVE Wiki Tutorial Converter")
    print("=============================\n")
    print("Converting " .. #TUTORIALS .. " tutorials from HTML to Markdown...\n")

    local success_count = 0
    local fail_count = 0

    for _, tutorial in ipairs(TUTORIALS) do
        if process_tutorial(tutorial) then
            success_count = success_count + 1
        else
            fail_count = fail_count + 1
        end
    end

    -- Summary
    print("\n" .. string.rep("=", 70))
    print("SUMMARY")
    print(string.rep("=", 70))
    print("✓ Successfully converted: " .. success_count .. " tutorials")
    if fail_count > 0 then
        print("✗ Failed: " .. fail_count .. " tutorials")
    end
    print("\nOutput directory: docs/tutorials/")
    print(string.rep("=", 70))
end

-- Run the converter
main()
