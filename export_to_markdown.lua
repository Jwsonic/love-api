#!/usr/bin/env luajit

-- LÖVE API to Markdown Exporter
-- Exports LÖVE 11.5 API documentation to multi-file markdown format

local api = require('love_api')

-- ============================================================================
-- MARKDOWN GENERATION HELPERS
-- ============================================================================

-- Escape markdown special characters
local function escape_md(text)
    if not text then return "" end
    text = tostring(text)
    -- Escape markdown special chars but preserve intended formatting
    text = text:gsub("([\\`*_{}%[%]()#+.!|])", "\\%1")
    return text
end

-- Generate heading
local function heading(level, text)
    return string.rep("#", level) .. " " .. text .. "\n\n"
end

-- Generate code block
local function code_block(code, lang)
    lang = lang or ""
    return "```" .. lang .. "\n" .. code .. "\n```\n\n"
end

-- Generate table row
local function table_row(cells)
    return "| " .. table.concat(cells, " | ") .. " |\n"
end

-- Generate table separator
local function table_separator(num_cols)
    local sep = {}
    for i = 1, num_cols do
        sep[i] = "---"
    end
    return table_row(sep)
end

-- Generate anchor link (lowercase, replace spaces with hyphens)
local function make_anchor(text)
    return text:lower():gsub("[^%w%s-]", ""):gsub("%s+", "-")
end

-- ============================================================================
-- RELATIVE LINK HELPERS
-- ============================================================================

-- Create link from index.md to module
local function link_to_module(module_name)
    return "./modules/" .. module_name .. ".md"
end

-- Create link to type within same module
local function link_to_type_local(type_name)
    return "#" .. make_anchor(type_name)
end

-- Create link to enum within same module
local function link_to_enum_local(enum_name)
    return "#" .. make_anchor(enum_name)
end

-- Create link to function within same module
local function link_to_function_local(function_name)
    return "#" .. make_anchor(function_name)
end

-- Try to create a smart link based on type name
-- Returns markdown link if type is known, otherwise just the text
local function smart_type_link(type_name, current_module)
    -- Basic types don't need links
    local basic_types = {
        ["number"] = true, ["string"] = true, ["boolean"] = true,
        ["table"] = true, ["function"] = true, ["userdata"] = true,
        ["thread"] = true, ["nil"] = true, ["any"] = true,
        ["value"] = true, ["Variant"] = true, ["light userdata"] = true
    }

    if basic_types[type_name] then
        return type_name
    end

    -- Check if it's a type in the current module
    if current_module and current_module.types then
        for _, type_def in ipairs(current_module.types) do
            if type_def.name == type_name then
                return "[" .. type_name .. "](" .. link_to_type_local(type_name) .. ")"
            end
        end
    end

    -- Check if it's an enum in the current module
    if current_module and current_module.enums then
        for _, enum_def in ipairs(current_module.enums) do
            if enum_def.name == type_name then
                return "[" .. type_name .. "](" .. link_to_enum_local(type_name) .. ")"
            end
        end
    end

    -- Otherwise, just return the type name without link
    return type_name
end

-- ============================================================================
-- FUNCTION VARIANT FORMATTER
-- ============================================================================

local function format_arguments_table(args, current_module)
    if not args or #args == 0 then
        return "*No arguments*\n\n"
    end

    local output = table_row({"Name", "Type", "Default", "Description"})
    output = output .. table_separator(4)

    for _, arg in ipairs(args) do
        local name = arg.name or "?"
        local type_str = smart_type_link(arg.type or "any", current_module)
        local default = arg.default or ""
        local desc = arg.description or ""

        -- Handle table types with sub-fields
        if arg.type == "table" and arg.table then
            desc = desc .. " (see table fields below)"
        end

        output = output .. table_row({name, type_str, default, desc})
    end

    output = output .. "\n"

    -- Add table field details if present
    for _, arg in ipairs(args) do
        if arg.type == "table" and arg.table then
            output = output .. "**" .. arg.name .. " table fields:**\n\n"
            output = output .. table_row({"Name", "Type", "Default", "Description"})
            output = output .. table_separator(4)
            for _, field in ipairs(arg.table) do
                local fname = field.name or "?"
                local ftype = smart_type_link(field.type or "any", current_module)
                local fdefault = field.default or ""
                local fdesc = field.description or ""
                output = output .. table_row({fname, ftype, fdefault, fdesc})
            end
            output = output .. "\n"
        end
    end

    return output
end

local function format_returns_table(returns, current_module)
    if not returns or #returns == 0 then
        return "*No return values*\n\n"
    end

    local output = table_row({"Name", "Type", "Description"})
    output = output .. table_separator(3)

    for _, ret in ipairs(returns) do
        local name = ret.name or "?"
        local type_str = smart_type_link(ret.type or "any", current_module)
        local desc = ret.description or ""

        -- Handle table returns with sub-fields
        if ret.type == "table" and ret.table then
            desc = desc .. " (see table fields below)"
        end

        output = output .. table_row({name, type_str, desc})
    end

    output = output .. "\n"

    -- Add table field details if present
    for _, ret in ipairs(returns) do
        if ret.type == "table" and ret.table then
            output = output .. "**" .. ret.name .. " table fields:**\n\n"
            output = output .. table_row({"Name", "Type", "Description"})
            output = output .. table_separator(3)
            for _, field in ipairs(ret.table) do
                local fname = field.name or "?"
                local ftype = smart_type_link(field.type or "any", current_module)
                local fdesc = field.description or ""
                output = output .. table_row({fname, ftype, fdesc})
            end
            output = output .. "\n"
        end
    end

    return output
end

local function format_function_variants(func, current_module)
    local output = ""

    if not func.variants or #func.variants == 0 then
        return "*No variants defined*\n\n"
    end

    for i, variant in ipairs(func.variants) do
        if #func.variants > 1 then
            output = output .. heading(3, "Variant " .. i)
        end

        if variant.description and variant.description ~= "" then
            output = output .. variant.description .. "\n\n"
        end

        output = output .. "**Arguments:**\n\n"
        output = output .. format_arguments_table(variant.arguments, current_module)

        output = output .. "**Returns:**\n\n"
        output = output .. format_returns_table(variant.returns, current_module)
    end

    return output
end

-- ============================================================================
-- ENUM EXPORTER
-- ============================================================================

local function export_enum(enum)
    local output = ""

    output = output .. heading(2, enum.name)

    if enum.description then
        output = output .. enum.description .. "\n\n"
    end

    if enum.constants and #enum.constants > 0 then
        output = output .. "**Constants:**\n\n"
        output = output .. table_row({"Name", "Description"})
        output = output .. table_separator(2)

        for _, const in ipairs(enum.constants) do
            local name = const.name or "?"
            local desc = const.description or ""
            output = output .. table_row({"`" .. name .. "`", desc})
        end

        output = output .. "\n"
    end

    return output
end

-- ============================================================================
-- TYPE EXPORTER
-- ============================================================================

local function export_type(type_def, current_module)
    local output = ""

    output = output .. heading(2, type_def.name)

    if type_def.description then
        output = output .. type_def.description .. "\n\n"
    end

    -- Show constructors
    if type_def.constructors and #type_def.constructors > 0 then
        output = output .. "**Constructors:** "
        local constructor_links = {}
        for _, constructor in ipairs(type_def.constructors) do
            -- Constructors need to link to the full module.function name
            local full_name = "love." .. current_module.name .. "." .. constructor
            table.insert(constructor_links, "[" .. constructor .. "](" .. link_to_function_local(full_name) .. ")")
        end
        output = output .. table.concat(constructor_links, ", ") .. "\n\n"
    end

    -- Show supertypes
    if type_def.supertypes and #type_def.supertypes > 0 then
        output = output .. "**Supertypes:** " .. table.concat(type_def.supertypes, ", ") .. "\n\n"
    end

    -- Show parent type if present
    if type_def.parenttype then
        output = output .. "**Parent type:** " .. type_def.parenttype .. "\n\n"
    end

    -- Export methods
    if type_def.functions and #type_def.functions > 0 then
        output = output .. heading(3, "Methods")

        for _, func in ipairs(type_def.functions) do
            output = output .. heading(4, type_def.name .. ":" .. func.name)

            if func.description then
                output = output .. func.description .. "\n\n"
            end

            output = output .. format_function_variants(func, current_module)
        end
    end

    return output
end

-- ============================================================================
-- MODULE FUNCTION EXPORTER
-- ============================================================================

local function export_functions(functions, module_prefix, current_module)
    local output = ""

    if not functions or #functions == 0 then
        return output
    end

    for _, func in ipairs(functions) do
        output = output .. heading(2, module_prefix .. func.name)

        if func.description then
            output = output .. func.description .. "\n\n"
        end

        output = output .. format_function_variants(func, current_module)
    end

    return output
end

-- ============================================================================
-- MODULE EXPORTER
-- ============================================================================

local function export_module(module)
    local output = ""

    -- Module header
    output = output .. heading(1, "love." .. module.name)

    if module.description then
        output = output .. module.description .. "\n\n"
    end

    -- Table of contents
    output = output .. heading(2, "Contents")

    local has_content = false

    if module.functions and #module.functions > 0 then
        output = output .. "**Functions:**\n\n"
        for _, func in ipairs(module.functions) do
            output = output .. "- [" .. func.name .. "](" .. link_to_function_local("love." .. module.name .. "." .. func.name) .. ")\n"
        end
        output = output .. "\n"
        has_content = true
    end

    if module.types and #module.types > 0 then
        output = output .. "**Types:**\n\n"
        for _, type_def in ipairs(module.types) do
            output = output .. "- [" .. type_def.name .. "](" .. link_to_type_local(type_def.name) .. ")\n"
        end
        output = output .. "\n"
        has_content = true
    end

    if module.enums and #module.enums > 0 then
        output = output .. "**Enums:**\n\n"
        for _, enum in ipairs(module.enums) do
            output = output .. "- [" .. enum.name .. "](" .. link_to_enum_local(enum.name) .. ")\n"
        end
        output = output .. "\n"
        has_content = true
    end

    if not has_content then
        output = output .. "*This module has no documented content.*\n\n"
    end

    output = output .. "---\n\n"

    -- Functions
    if module.functions and #module.functions > 0 then
        output = output .. heading(2, "Functions")
        output = output .. export_functions(module.functions, "love." .. module.name .. ".", module)
    end

    -- Types
    if module.types and #module.types > 0 then
        output = output .. heading(2, "Types")
        for _, type_def in ipairs(module.types) do
            output = output .. export_type(type_def, module)
        end
    end

    -- Enums
    if module.enums and #module.enums > 0 then
        output = output .. heading(2, "Enums")
        for _, enum in ipairs(module.enums) do
            output = output .. export_enum(enum)
        end
    end

    return output
end

-- ============================================================================
-- CALLBACKS EXPORTER
-- ============================================================================

local function export_callbacks(callbacks)
    local output = ""

    output = output .. heading(1, "Callbacks")
    output = output .. "LÖVE callbacks are functions that you define in your game which LÖVE calls at specific times.\n\n"

    -- Table of contents
    output = output .. heading(2, "Available Callbacks")
    for _, callback in ipairs(callbacks) do
        output = output .. "- [" .. callback.name .. "](" .. link_to_function_local(callback.name) .. ")\n"
    end
    output = output .. "\n---\n\n"

    -- Export each callback
    output = output .. export_functions(callbacks, "", nil)

    return output
end

-- ============================================================================
-- INDEX EXPORTER
-- ============================================================================

local function export_index(api_data)
    local output = ""

    output = output .. heading(1, "LÖVE " .. api_data.version .. " API Documentation")
    output = output .. "Complete API documentation for LÖVE (Love2D) version " .. api_data.version .. ".\n\n"
    output = output .. "This documentation was automatically generated from the [love-api](https://github.com/love2d-community/love-api) project.\n\n"

    -- Top-level functions
    if api_data.functions and #api_data.functions > 0 then
        output = output .. heading(2, "Top-level Functions")
        for _, func in ipairs(api_data.functions) do
            output = output .. "- **" .. func.name .. "**: " .. (func.description or ""):gsub("\n.*", "") .. "\n"
        end
        output = output .. "\n"
    end

    -- Callbacks
    if api_data.callbacks and #api_data.callbacks > 0 then
        output = output .. heading(2, "Callbacks")
        output = output .. "See [Callbacks](./callbacks.md) for the complete list of " .. #api_data.callbacks .. " callbacks.\n\n"
    end

    -- Modules
    output = output .. heading(2, "Modules")

    if api_data.modules and #api_data.modules > 0 then
        output = output .. table_row({"Module", "Description"})
        output = output .. table_separator(2)

        for _, module in ipairs(api_data.modules) do
            local module_link = "[love." .. module.name .. "](" .. link_to_module(module.name) .. ")"
            local short_desc = (module.description or ""):gsub("\n.*", "")
            if #short_desc > 100 then
                short_desc = short_desc:sub(1, 97) .. "..."
            end
            output = output .. table_row({module_link, short_desc})
        end

        output = output .. "\n"
    end

    return output
end

-- ============================================================================
-- FILE WRITER
-- ============================================================================

local function write_file(filepath, content)
    local file, err = io.open(filepath, "w")
    if not file then
        error("Failed to open file " .. filepath .. ": " .. tostring(err))
    end
    file:write(content)
    file:close()
    print("✓ Written: " .. filepath)
end

-- ============================================================================
-- MAIN ORCHESTRATOR
-- ============================================================================

local function main()
    print("LÖVE API to Markdown Exporter")
    print("API Version: " .. api.version)
    print("Modules: " .. #api.modules)
    print("Callbacks: " .. #api.callbacks)
    print("")

    -- Export index
    print("Exporting index...")
    local index_content = export_index(api)
    write_file("docs/index.md", index_content)

    -- Export callbacks
    print("Exporting callbacks...")
    local callbacks_content = export_callbacks(api.callbacks)
    write_file("docs/callbacks.md", callbacks_content)

    -- Export modules
    print("Exporting modules...")
    for _, module in ipairs(api.modules) do
        print("  - love." .. module.name)
        local module_content = export_module(module)
        write_file("docs/modules/" .. module.name .. ".md", module_content)
    end

    print("")
    print("✓ Export complete!")
    print("  Files created: " .. (2 + #api.modules))
    print("  Output directory: docs/")
end

-- Run the exporter
main()
