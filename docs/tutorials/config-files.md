# Config Files

> This tutorial was imported from the [LÖVE Wiki](https://love2d.org/wiki/Config_Files).

---

# Config Files

- [1
  Introduction](#Introduction)
- [2
  love.conf](#love.conf)
- [3 Current
  Configuration File](#Current_Configuration_File)
- [4
  Flags](#Flags)
  - [4.1
    identity](#identity)
  - [4.2
    appendidentity](#appendidentity)
  - [4.3
    version](#version)
  - [4.4
    console](#console)
  - [4.5
    accelerometerjoystick](#accelerometerjoystick)
  - [4.6
    externalstorage](#externalstorage)
  - [4.7
    gammacorrect](#gammacorrect)
  - [4.8
    audio.mic](#audio.mic)
  - [4.9
    audio.mixwithsystem](#audio.mixwithsystem)
  - [4.10
    window](#window)
  - [4.11
    window.title](#window.title)
  - [4.12
    window.icon](#window.icon)
  - [4.13
    window.width &
    window.height](#window.width_.26_window.height)
  - [4.14
    window.borderless](#window.borderless)
  - [4.15
    window.resizable](#window.resizable)
  - [4.16
    window.minwidth &
    window.minheight](#window.minwidth_.26_window.minheight)
  - [4.17
    window.fullscreen](#window.fullscreen)
  - [4.18
    window.fullscreentype](#window.fullscreentype)
  - [4.19
    window.vsync](#window.vsync)
  - [4.20
    window.depth](#window.depth)
  - [4.21
    window.stencil](#window.stencil)
  - [4.22
    window.msaa](#window.msaa)
  - [4.23
    window.display](#window.display)
  - [4.24
    window.highdpi](#window.highdpi)
  - [4.25
    window.usedpiscale](#window.usedpiscale)
  - [4.26 window.x
    & window.y](#window.x_.26_window.y)
  - [4.27
    window.fsaa](#window.fsaa)
  - [4.28
    window.srgb](#window.srgb)
  - [4.29 Release
    Mode](#Release_Mode)
- [5 Older
  Versions](#Older_Versions)
- [6 See
  Also](#See_Also)
- [7 Other
  Languages](#Other_Languages)

## Introduction

If a file called `conf.lua` is present in your game folder (or .love
file), it is run *before* the LÖVE modules are loaded. You can use this
file to overwrite the `love.conf` function, which is later called by the
LÖVE 'boot' script. Using the `love.conf` function, you can set some
configuration options, and change things such as the default size of the
window, which modules are loaded, and other program setup-related
options.

  
`love.conf` must be defined inside a file named `conf.lua`. It will not
work if it's defined inside `main.lua`, because it affects
initialization that happens before `main.lua` is loaded.

## love.conf

The `love.conf` function takes one argument: a table filled with all the
default values which you can overwrite to your liking. If you want to
change the default window size, for instance, do:

    function love.conf(t)
        t.window.width = 1024
        t.window.height = 768
    end

If you don't need the physics module or joystick module, do the
following.

    function love.conf(t)
        t.modules.joystick = false
        t.modules.physics = false
    end

Setting unused modules to false is encouraged when you release your
game. It reduces startup time slightly (especially if the joystick
module is disabled) and reduces memory usage (slightly).

Note that you can't disable
`love.filesystem` and
`love.data`; it's mandatory. The same goes
for the [love](love "love") module itself.
`love.graphics` needs
`love.window` to be enabled.

In LÖVE version 0.9.2 and earlier, errors in the config file will cause
the game to not launch and no error message to appear. If the game
doesn't load, check the config file for errors first. In version 0.10.2
and later, errors in the config will now show the blue error screen
showing the error in the config file.

## Current Configuration File

Here is a full list of options and their default values for LÖVE
[11.3](11.3 "11.3") and [11.4](11.4 "11.4"):

    function love.conf(t)
        t.identity = nil                    -- The name of the save directory (string)
        t.appendidentity = false            -- Search files in source directory before save directory (boolean)
        t.version = "11.4"                  -- The LÖVE version this game was made for (string)
        t.console = false                   -- Attach a console (boolean, Windows only)
        t.accelerometerjoystick = true      -- Enable the accelerometer on iOS and Android by exposing it as a Joystick (boolean)
        t.externalstorage = false           -- True to save files (and read from the save directory) in external storage on Android (boolean) 
        t.gammacorrect = false              -- Enable gamma-correct rendering, when supported by the system (boolean)

        t.audio.mic = false                 -- Request and use microphone capabilities in Android (boolean)
        t.audio.mixwithsystem = true        -- Keep background music playing when opening LOVE (boolean, iOS and Android only)

        t.window.title = "Untitled"         -- The window title (string)
        t.window.icon = nil                 -- Filepath to an image to use as the window's icon (string)
        t.window.width = 800                -- The window width (number)
        t.window.height = 600               -- The window height (number)
        t.window.borderless = false         -- Remove all border visuals from the window (boolean)
        t.window.resizable = false          -- Let the window be user-resizable (boolean)
        t.window.minwidth = 1               -- Minimum window width if the window is resizable (number)
        t.window.minheight = 1              -- Minimum window height if the window is resizable (number)
        t.window.fullscreen = false         -- Enable fullscreen (boolean)
        t.window.fullscreentype = "desktop" -- Choose between "desktop" fullscreen or "exclusive" fullscreen mode (string)
        t.window.vsync = 1                  -- Vertical sync mode (number)
        t.window.msaa = 0                   -- The number of samples to use with multi-sampled antialiasing (number)
        t.window.depth = nil                -- The number of bits per sample in the depth buffer
        t.window.stencil = nil              -- The number of bits per sample in the stencil buffer
        t.window.display = 1                -- Index of the monitor to show the window in (number)
        t.window.highdpi = false            -- Enable high-dpi mode for the window on a Retina display (boolean)
        t.window.usedpiscale = true         -- Enable automatic DPI scaling when highdpi is set to true as well (boolean)
        t.window.x = nil                    -- The x-coordinate of the window's position in the specified display (number)
        t.window.y = nil                    -- The y-coordinate of the window's position in the specified display (number)

        t.modules.audio = true              -- Enable the audio module (boolean)
        t.modules.data = true               -- Enable the data module (boolean)
        t.modules.event = true              -- Enable the event module (boolean)
        t.modules.font = true               -- Enable the font module (boolean)
        t.modules.graphics = true           -- Enable the graphics module (boolean)
        t.modules.image = true              -- Enable the image module (boolean)
        t.modules.joystick = true           -- Enable the joystick module (boolean)
        t.modules.keyboard = true           -- Enable the keyboard module (boolean)
        t.modules.math = true               -- Enable the math module (boolean)
        t.modules.mouse = true              -- Enable the mouse module (boolean)
        t.modules.physics = true            -- Enable the physics module (boolean)
        t.modules.sound = true              -- Enable the sound module (boolean)
        t.modules.system = true             -- Enable the system module (boolean)
        t.modules.thread = true             -- Enable the thread module (boolean)
        t.modules.timer = true              -- Enable the timer module (boolean), Disabling it will result 0 delta time in love.update
        t.modules.touch = true              -- Enable the touch module (boolean)
        t.modules.video = true              -- Enable the video module (boolean)
        t.modules.window = true             -- Enable the window module (boolean)
    end

## Flags

#### identity

This flag determines the name of the save directory for your game. Note
that you can only specify the name, not the location where it will be
created:

    t.identity = "gabe_HL3" -- Correct
    t.identity = "c:/Users/gabe/HL3" -- Incorrect

Alternatively
`love.filesystem.setIdentity`
can be used to set the save directory outside of the config file.

#### appendidentity

|  |
|----|
| ***Available since LÖVE [11.0](11.0 "11.0")*** |
| This flag is not supported in earlier versions. |

This flag determines if game directory should be searched first then
save directory (`true`) or otherwise (`false`)

#### version

|  |
|----|
| ***Available since LÖVE [0.8.0](0.8.0 "0.8.0")*** |
| This flag is not supported in earlier versions. |

`t.version` should be a string, representing the version of LÖVE for
which your game was made.

Before [11.0](11.0 "11.0"), it should be formatted as
`"`*`X.Y.Z`*`"` where *`X`* is the major release number, *`Y`* the
minor, and *`Z`* the patch level. Since 11.0, it should be formatted as
`"`*`X.Y`*`"` where *`X`* and *`Y`* are the major and minor release
respectively.

If set in the config file of the game, LÖVE will display a warning if
the game isn't compatible with the current version of LÖVE being used to
run the game. Its default is the version of LÖVE running.

#### console

Determines whether a console should be opened alongside the game window
(Windows only) or not. Note: On OSX you can get console output by
running LÖVE through the terminal, or on Windows with LÖVE
[0.10.2](0.10.2 "0.10.2"), by running `lovec.exe` instead of
`love.exe`.

#### accelerometerjoystick

|  |
|----|
| ***Available since LÖVE [0.10.0](0.10.0 "0.10.0")*** |
| This flag is not supported in earlier versions. |

Sets whether the device accelerometer on iOS and Android should be
exposed as a 3-axis [Joystick](Joystick "Joystick"). Disabling the
accelerometer when it's not used may reduce CPU usage.

#### externalstorage

|  |
|----|
| ***Available since LÖVE [0.10.1](0.10.1 "0.10.1")*** |
| This flag is not supported in earlier versions. |

Sets whether files are saved in external storage (true) or internal
storage (false) on Android.

#### gammacorrect

|  |
|----|
| ***Available since LÖVE [0.10.0](0.10.0 "0.10.0")*** |
| This flag is not supported in earlier versions. |

Determines whether [gamma-correct
rendering](love.graphics.isGammaCorrect "love.graphics.isGammaCorrect")
is enabled, when the system supports it.

#### audio.mic

|  |
|----|
| ***Available since LÖVE [11.3](11.3 "11.3")*** |
| This flag is not supported in earlier versions. |

Request microphone permission from the user. When user allows it,
`love.audio.getRecordingDevices`
will lists recording devices available. Otherwise,
`love.audio.getRecordingDevices`
returns empty table and a message is shown to inform user when called.

#### audio.mixwithsystem

|  |
|----|
| ***Available since LÖVE [11.0](11.0 "11.0")*** |
| This flag is not supported in earlier versions. |

Sets whether background audio / music from other apps should play while
LÖVE is open. See
`love.system.hasBackgroundMusic`
for more details.

#### window

|  |
|----|
| ***Available since LÖVE [0.9.0](0.9.0 "0.9.0")*** |
| These flags are not supported in earlier versions. |

It is possible to defer window creation until
`love.window.setMode`
is first called in your code. To do so, set `t.window = nil` in
love.conf (or `t.screen = nil` in older versions.) If this is done, LÖVE
may crash if any function from
`love.graphics` is called before
the first
`love.window.setMode`
in your code.

The `t.window` table was named `t.screen` in versions prior to
[0.9.0](0.9.0 "0.9.0"). The `t.screen` table doesn't exist in
love.conf in 0.9.0, and the `t.window` table doesn't exist in love.conf
in 0.8.0. This means **love.conf** will fail to execute (therefore it
will fall back to default values) if care is not taken to use the
correct table for the LÖVE version being used.

#### window.title

|  |
|----|
| ***Available since LÖVE [0.9.0](0.9.0 "0.9.0")*** |
| This flag is not supported in earlier versions. |

Sets the title of the window the game is in. Alternatively
`love.window.setTitle`
can be used to change the window title outside of the config file.

#### window.icon

|  |
|----|
| ***Available since LÖVE [0.9.0](0.9.0 "0.9.0")*** |
| This flag is not supported in earlier versions. |

A filepath to an image to use as the window's icon. Not all operating
systems support very large icon images. The icon can also be changed
with
`love.window.setIcon`.

#### window.width & window.height

|  |
|----|
| ***Available since LÖVE [0.9.0](0.9.0 "0.9.0")*** |
| These flags are not supported in earlier versions. |

Sets the window's dimensions. If these flags are set to 0 LÖVE
automatically uses the user's desktop dimensions. In mobile, the aspect
ratio will be used to determine if the game runs in landscape or
portrait.

#### window.borderless

|  |
|----|
| ***Available since LÖVE [0.9.0](0.9.0 "0.9.0")*** |
| This flag is not supported in earlier versions. |

Removes all border visuals from the window. Note that the effects may
vary between operating systems.

#### window.resizable

|  |
|----|
| ***Available since LÖVE [0.9.0](0.9.0 "0.9.0")*** |
| This flag is not supported in earlier versions. |

If set to true this allows the user to resize the game's window. In
version 11.4 and later for Android, this also allows changing
orientation between landscape and portrait.

#### window.minwidth & window.minheight

|  |
|----|
| ***Available since LÖVE [0.9.0](0.9.0 "0.9.0")*** |
| These flags are not supported in earlier versions. |

Sets the minimum width and height for the game's window if it can be
resized by the user. If you set lower values to `window.width` and
`window.height` LÖVE will always favor the minimum dimensions set via
`window.minwidth` and `window.minheight`.

#### window.fullscreen

|  |
|----|
| ***Available since LÖVE [0.9.0](0.9.0 "0.9.0")*** |
| This flag is not supported in earlier versions. |

Wether to run the game in fullscreen (`true`) or windowed (`false`)
mode. The fullscreen can also be toggled via
`love.window.setFullscreen`
or
`love.window.setMode`.
In [11.3](11.3 "11.3") for Android, setting this to `true` hides
the status bar.

#### window.fullscreentype

|  |
|----|
| ***Available since LÖVE [0.9.0](0.9.0 "0.9.0")*** |
| This flag is not supported in earlier versions. |

Specifies the [type of
fullscreen](FullscreenType "FullscreenType") mode to use
(`exclusive` or `desktop`). Generally the `desktop` is recommended, as
it is less restrictive than `exclusive` mode on some operating systems.
(Note: In [0.9.2](0.9.2 "0.9.2") and earlier, use `normal` instead
of `exclusive`.)

#### window.vsync

|  |
|----|
| ***Available since LÖVE [0.9.0](0.9.0 "0.9.0")*** |
| This flag is not supported in earlier versions. |

Enables or deactivates vertical synchronization. Vsync tries to keep the
game at a steady framerate and can prevent issues like screen tearing.
It is recommended to keep vsync activated if you don't know about the
possible implications of turning it off. Before LÖVE 11.0, this value
was boolean (`true` or `false`). Since LÖVE 11.0, this value is a number
(`-1` to use adaptive vsync when supported, `0` to disable vsync, `1` to
enable vsync; `2` or a larger number will wait that many frames before
refreshing - this is driver-dependent, however.)

Note that in iOS, vertical synchronization is always enabled and cannot
be changed.

#### window.depth

|  |
|----|
| ***Available since LÖVE [11.0](11.0 "11.0")*** |
| This flag is not supported in earlier versions. |

The number of bits per sample in the depth buffer (16/24/32, default
`nil`)

#### window.stencil

|  |
|----|
| ***Available since LÖVE [11.0](11.0 "11.0")*** |
| This flag is not supported in earlier versions. |

Then number of bits per sample in the stencil buffer (generally 8,
default `nil`)

#### window.msaa

|  |
|----|
| ***Available since LÖVE [0.9.2](0.9.2 "0.9.2")*** |
| This flag is not supported in earlier versions. |

The number of samples to use with multi-sampled antialiasing.

#### window.display

|  |
|----|
| ***Available since LÖVE [0.9.0](0.9.0 "0.9.0")*** |
| This flag is not supported in earlier versions. |

The index of the display to show the window in, if multiple monitors are
available.

#### window.highdpi

|  |
|----|
| ***Available since LÖVE [0.9.1](0.9.1 "0.9.1")*** |
| This flag is not supported in earlier versions. |

See
`love.window.getDPIScale`.
Allows the window's backbuffer to use the full pixel density of high-DPI
displays on supported operating systems. LOVE will automatically scale
things accordingly and use DPI-scaled units instead of pixels for most
things (since [11.0](11.0 "11.0")) when this is true, unless the
`usedpiscale` flag is set to false. When `highdpi` is false, the OS will
keep things consistent between low-DPI and high-DPI displays by
rendering to a low-resolution backbuffer and scaling that up on its own,
when a high-DPI display is used.

This flag currently does nothing on Windows, and on Android it's
effectively always enabled.

#### window.usedpiscale

|  |
|----|
| ***Available since LÖVE [11.3](11.3 "11.3")*** |
| This flag is not supported in earlier versions. |

Disables LOVE's automatic DPI scaling on high-DPI displays when false.
This only has an effect when the `highdpi` flag is set to true, since
the OS (rather than LOVE) takes care of everything otherwise.

#### window.x & window.y

|  |
|----|
| ***Available since LÖVE [0.9.2](0.9.2 "0.9.2")*** |
| These flags are not supported in earlier versions. |

Determines the position of the window on the user's screen.
Alternatively
`love.window.setPosition`
can be used to change the position on the fly.

#### window.fsaa

|  |
|----|
| ***Available since LÖVE [0.9.0](0.9.0 "0.9.0") and removed in LÖVE [0.10.0](0.10.0 "0.10.0")*** |
| This flag has been replaced by the window.msaa flag. |

The number of samples to use with multi-sampled antialiasing.

#### window.srgb

|  |
|----|
| ***Available since LÖVE [0.9.1](0.9.1 "0.9.1") and removed in LÖVE [0.10.0](0.10.0 "0.10.0")*** |
| This flag has been replaced by the gammacorrect flag. |

Enabling this window flag will automatically convert the colors of
everything drawn to the main screen from the linear RGB colorspace to
the sRGB colorspace - the window's surface is treated as gamma-space
sRGB. This is only one component of gamma-correct rendering, an advanced
topic which is easy to mess up, so it's recommended to keep this option
disabled if you're not sure about its implications.

#### Release Mode

|  |
|----|
| ***Available since LÖVE [0.8.0](0.8.0 "0.8.0") and removed in LÖVE [0.9.0](0.9.0 "0.9.0")*** |
| This flag is not supported in earlier or later versions. |

  
If `t.release` is enabled, LÖVE uses the [release error
handler](love.releaseerrhand "love.releaseerrhand"), which is
sparse on information by default, and can, of course, be overridden.

The default release mode error handler also outputs a message to the
player informing them to contact the author using the values *title,
author and url* as specified in conf.lua.

When a fused game in release mode is run it will not save in the love
save dir, but rather one for itself, whereas previously it would
be %APPDATA%\\LOVE\\game on Windows, it now is %APPDATA%\\game. This
concept applies to other platforms as well.

## Older Versions

Here is a full list of options and their default values for LÖVE
[11.0](11.0 "11.0") until [11.2](11.2 "11.2"):

    function love.conf(t)
        t.identity = nil                    -- The name of the save directory (string)
        t.appendidentity = false            -- Search files in source directory before save directory (boolean)
        t.version = "11.0"                  -- The LÖVE version this game was made for (string)
        t.console = false                   -- Attach a console (boolean, Windows only)
        t.accelerometerjoystick = true      -- Enable the accelerometer on iOS and Android by exposing it as a Joystick (boolean)
        t.externalstorage = false           -- True to save files (and read from the save directory) in external storage on Android (boolean) 
        t.gammacorrect = false              -- Enable gamma-correct rendering, when supported by the system (boolean)

        t.audio.mixwithsystem = true        -- Keep background music playing when opening LOVE (boolean, iOS and Android only)

        t.window.title = "Untitled"         -- The window title (string)
        t.window.icon = nil                 -- Filepath to an image to use as the window's icon (string)
        t.window.width = 800                -- The window width (number)
        t.window.height = 600               -- The window height (number)
        t.window.borderless = false         -- Remove all border visuals from the window (boolean)
        t.window.resizable = false          -- Let the window be user-resizable (boolean)
        t.window.minwidth = 1               -- Minimum window width if the window is resizable (number)
        t.window.minheight = 1              -- Minimum window height if the window is resizable (number)
        t.window.fullscreen = false         -- Enable fullscreen (boolean)
        t.window.fullscreentype = "desktop" -- Choose between "desktop" fullscreen or "exclusive" fullscreen mode (string)
        t.window.vsync = 1                  -- Vertical sync mode (number)
        t.window.msaa = 0                   -- The number of samples to use with multi-sampled antialiasing (number)
        t.window.depth = nil                -- The number of bits per sample in the depth buffer
        t.window.stencil = nil              -- The number of bits per sample in the stencil buffer
        t.window.display = 1                -- Index of the monitor to show the window in (number)
        t.window.highdpi = false            -- Enable high-dpi mode for the window on a Retina display (boolean)
        t.window.x = nil                    -- The x-coordinate of the window's position in the specified display (number)
        t.window.y = nil                    -- The y-coordinate of the window's position in the specified display (number)

        t.modules.audio = true              -- Enable the audio module (boolean)
        t.modules.data = true               -- Enable the data module (boolean)
        t.modules.event = true              -- Enable the event module (boolean)
        t.modules.font = true               -- Enable the font module (boolean)
        t.modules.graphics = true           -- Enable the graphics module (boolean)
        t.modules.image = true              -- Enable the image module (boolean)
        t.modules.joystick = true           -- Enable the joystick module (boolean)
        t.modules.keyboard = true           -- Enable the keyboard module (boolean)
        t.modules.math = true               -- Enable the math module (boolean)
        t.modules.mouse = true              -- Enable the mouse module (boolean)
        t.modules.physics = true            -- Enable the physics module (boolean)
        t.modules.sound = true              -- Enable the sound module (boolean)
        t.modules.system = true             -- Enable the system module (boolean)
        t.modules.thread = true             -- Enable the thread module (boolean)
        t.modules.timer = true              -- Enable the timer module (boolean), Disabling it will result 0 delta time in love.update
        t.modules.touch = true              -- Enable the touch module (boolean)
        t.modules.video = true              -- Enable the video module (boolean)
        t.modules.window = true             -- Enable the window module (boolean)
    end

Here is a full list of options and their default values for LÖVE
[0.10.1](0.10.1 "0.10.1") and [0.10.2](0.10.2 "0.10.2"):

    function love.conf(t)
        t.identity = nil                    -- The name of the save directory (string)
        t.version = "0.10.2"                -- The LÖVE version this game was made for (string)
        t.console = false                   -- Attach a console (boolean, Windows only)
        t.accelerometerjoystick = true      -- Enable the accelerometer on iOS and Android by exposing it as a Joystick (boolean)
        t.externalstorage = false           -- True to save files (and read from the save directory) in external storage on Android (boolean) 
        t.gammacorrect = false              -- Enable gamma-correct rendering, when supported by the system (boolean)

        t.window.title = "Untitled"         -- The window title (string)
        t.window.icon = nil                 -- Filepath to an image to use as the window's icon (string)
        t.window.width = 800                -- The window width (number)
        t.window.height = 600               -- The window height (number)
        t.window.borderless = false         -- Remove all border visuals from the window (boolean)
        t.window.resizable = false          -- Let the window be user-resizable (boolean)
        t.window.minwidth = 1               -- Minimum window width if the window is resizable (number)
        t.window.minheight = 1              -- Minimum window height if the window is resizable (number)
        t.window.fullscreen = false         -- Enable fullscreen (boolean)
        t.window.fullscreentype = "desktop" -- Choose between "desktop" fullscreen or "exclusive" fullscreen mode (string)
        t.window.vsync = true               -- Enable vertical sync (boolean)
        t.window.msaa = 0                   -- The number of samples to use with multi-sampled antialiasing (number)
        t.window.display = 1                -- Index of the monitor to show the window in (number)
        t.window.highdpi = false            -- Enable high-dpi mode for the window on a Retina display (boolean)
        t.window.x = nil                    -- The x-coordinate of the window's position in the specified display (number)
        t.window.y = nil                    -- The y-coordinate of the window's position in the specified display (number)

        t.modules.audio = true              -- Enable the audio module (boolean)
        t.modules.event = true              -- Enable the event module (boolean)
        t.modules.graphics = true           -- Enable the graphics module (boolean)
        t.modules.image = true              -- Enable the image module (boolean)
        t.modules.joystick = true           -- Enable the joystick module (boolean)
        t.modules.keyboard = true           -- Enable the keyboard module (boolean)
        t.modules.math = true               -- Enable the math module (boolean)
        t.modules.mouse = true              -- Enable the mouse module (boolean)
        t.modules.physics = true            -- Enable the physics module (boolean)
        t.modules.sound = true              -- Enable the sound module (boolean)
        t.modules.system = true             -- Enable the system module (boolean)
        t.modules.timer = true              -- Enable the timer module (boolean), Disabling it will result 0 delta time in love.update
        t.modules.touch = true              -- Enable the touch module (boolean)
        t.modules.video = true              -- Enable the video module (boolean)
        t.modules.window = true             -- Enable the window module (boolean)
        t.modules.thread = true             -- Enable the thread module (boolean)
    end

Here is a full list of options and their default values for LÖVE
[0.10.0](0.10.0 "0.10.0"):

    function love.conf(t)
        t.identity = nil                    -- The name of the save directory (string)
        t.version = "0.10.0"                -- The LÖVE version this game was made for (string)
        t.console = false                   -- Attach a console (boolean, Windows only)
        t.accelerometerjoystick = true      -- Enable the accelerometer on iOS and Android by exposing it as a Joystick (boolean)
        t.gammacorrect = false              -- Enable gamma-correct rendering, when supported by the system (boolean)

        t.window.title = "Untitled"         -- The window title (string)
        t.window.icon = nil                 -- Filepath to an image to use as the window's icon (string)
        t.window.width = 800                -- The window width (number)
        t.window.height = 600               -- The window height (number)
        t.window.borderless = false         -- Remove all border visuals from the window (boolean)
        t.window.resizable = false          -- Let the window be user-resizable (boolean)
        t.window.minwidth = 1               -- Minimum window width if the window is resizable (number)
        t.window.minheight = 1              -- Minimum window height if the window is resizable (number)
        t.window.fullscreen = false         -- Enable fullscreen (boolean)
        t.window.fullscreentype = "desktop" -- Choose between "desktop" fullscreen or "exclusive" fullscreen mode (string)
        t.window.vsync = true               -- Enable vertical sync (boolean)
        t.window.msaa = 0                   -- The number of samples to use with multi-sampled antialiasing (number)
        t.window.display = 1                -- Index of the monitor to show the window in (number)
        t.window.highdpi = false            -- Enable high-dpi mode for the window on a Retina display (boolean)
        t.window.x = nil                    -- The x-coordinate of the window's position in the specified display (number)
        t.window.y = nil                    -- The y-coordinate of the window's position in the specified display (number)

        t.modules.audio = true              -- Enable the audio module (boolean)
        t.modules.event = true              -- Enable the event module (boolean)
        t.modules.graphics = true           -- Enable the graphics module (boolean)
        t.modules.image = true              -- Enable the image module (boolean)
        t.modules.joystick = true           -- Enable the joystick module (boolean)
        t.modules.keyboard = true           -- Enable the keyboard module (boolean)
        t.modules.math = true               -- Enable the math module (boolean)
        t.modules.mouse = true              -- Enable the mouse module (boolean)
        t.modules.physics = true            -- Enable the physics module (boolean)
        t.modules.sound = true              -- Enable the sound module (boolean)
        t.modules.system = true             -- Enable the system module (boolean)
        t.modules.timer = true              -- Enable the timer module (boolean), Disabling it will result 0 delta time in love.update
        t.modules.touch = true              -- Enable the touch module (boolean)
        t.modules.video = true              -- Enable the video module (boolean)
        t.modules.window = true             -- Enable the window module (boolean)
        t.modules.thread = true             -- Enable the thread module (boolean)
    end

Here is a full list of options and their default values for LÖVE
[0.9.2](0.9.2 "0.9.2"):

    function love.conf(t)
        t.identity = nil                   -- The name of the save directory (string)
        t.version = "0.9.2"                -- The LÖVE version this game was made for (string)
        t.console = false                  -- Attach a console (boolean, Windows only)

        t.window.title = "Untitled"        -- The window title (string)
        t.window.icon = nil                -- Filepath to an image to use as the window's icon (string)
        t.window.width = 800               -- The window width (number)
        t.window.height = 600              -- The window height (number)
        t.window.borderless = false        -- Remove all border visuals from the window (boolean)
        t.window.resizable = false         -- Let the window be user-resizable (boolean)
        t.window.minwidth = 1              -- Minimum window width if the window is resizable (number)
        t.window.minheight = 1             -- Minimum window height if the window is resizable (number)
        t.window.fullscreen = false        -- Enable fullscreen (boolean)
        t.window.fullscreentype = "normal" -- Choose between "normal" fullscreen or "desktop" fullscreen mode (string)
        t.window.vsync = true              -- Enable vertical sync (boolean)
        t.window.fsaa = 0                  -- The number of samples to use with multi-sampled antialiasing (number)
        t.window.display = 1               -- Index of the monitor to show the window in (number)
        t.window.highdpi = false           -- Enable high-dpi mode for the window on a Retina display (boolean)
        t.window.srgb = false              -- Enable sRGB gamma correction when drawing to the screen (boolean)
        t.window.x = nil                   -- The x-coordinate of the window's position in the specified display (number)
        t.window.y = nil                   -- The y-coordinate of the window's position in the specified display (number)

        t.modules.audio = true             -- Enable the audio module (boolean)
        t.modules.event = true             -- Enable the event module (boolean)
        t.modules.graphics = true          -- Enable the graphics module (boolean)
        t.modules.image = true             -- Enable the image module (boolean)
        t.modules.joystick = true          -- Enable the joystick module (boolean)
        t.modules.keyboard = true          -- Enable the keyboard module (boolean)
        t.modules.math = true              -- Enable the math module (boolean)
        t.modules.mouse = true             -- Enable the mouse module (boolean)
        t.modules.physics = true           -- Enable the physics module (boolean)
        t.modules.sound = true             -- Enable the sound module (boolean)
        t.modules.system = true            -- Enable the system module (boolean)
        t.modules.timer = true             -- Enable the timer module (boolean), Disabling it will result 0 delta time in love.update
        t.modules.window = true            -- Enable the window module (boolean)
        t.modules.thread = true            -- Enable the thread module (boolean)
    end

Here is a full list of options and their default values for LÖVE
[0.9.1](0.9.1 "0.9.1"):

    function love.conf(t)
        t.identity = nil                   -- The name of the save directory (string)
        t.version = "0.9.1"                -- The LÖVE version this game was made for (string)
        t.console = false                  -- Attach a console (boolean, Windows only)

        t.window.title = "Untitled"        -- The window title (string)
        t.window.icon = nil                -- Filepath to an image to use as the window's icon (string)
        t.window.width = 800               -- The window width (number)
        t.window.height = 600              -- The window height (number)
        t.window.borderless = false        -- Remove all border visuals from the window (boolean)
        t.window.resizable = false         -- Let the window be user-resizable (boolean)
        t.window.minwidth = 1              -- Minimum window width if the window is resizable (number)
        t.window.minheight = 1             -- Minimum window height if the window is resizable (number)
        t.window.fullscreen = false        -- Enable fullscreen (boolean)
        t.window.fullscreentype = "normal" -- Standard fullscreen or desktop fullscreen mode (string)
        t.window.vsync = true              -- Enable vertical sync (boolean)
        t.window.fsaa = 0                  -- The number of samples to use with multi-sampled antialiasing (number)
        t.window.display = 1               -- Index of the monitor to show the window in (number)
        t.window.highdpi = false           -- Enable high-dpi mode for the window on a Retina display (boolean)
        t.window.srgb = false              -- Enable sRGB gamma correction when drawing to the screen (boolean)

        t.modules.audio = true             -- Enable the audio module (boolean)
        t.modules.event = true             -- Enable the event module (boolean)
        t.modules.graphics = true          -- Enable the graphics module (boolean)
        t.modules.image = true             -- Enable the image module (boolean)
        t.modules.joystick = true          -- Enable the joystick module (boolean)
        t.modules.keyboard = true          -- Enable the keyboard module (boolean)
        t.modules.math = true              -- Enable the math module (boolean)
        t.modules.mouse = true             -- Enable the mouse module (boolean)
        t.modules.physics = true           -- Enable the physics module (boolean)
        t.modules.sound = true             -- Enable the sound module (boolean)
        t.modules.system = true            -- Enable the system module (boolean)
        t.modules.timer = true             -- Enable the timer module (boolean)
        t.modules.window = true            -- Enable the window module (boolean)
        t.modules.thread = true            -- Enable the thread module (boolean)
    end

Here is a full list of options and their default values for LÖVE
[0.9.0](0.9.0 "0.9.0"):

    function love.conf(t)
        t.identity = nil                   -- The name of the save directory (string)
        t.version = "0.9.0"                -- The LÖVE version this game was made for (string)
        t.console = false                  -- Attach a console (boolean, Windows only)

        t.window.title = "Untitled"        -- The window title (string)
        t.window.icon = nil                -- Filepath to an image to use as the window's icon (string)
        t.window.width = 800               -- The window width (number)
        t.window.height = 600              -- The window height (number)
        t.window.borderless = false        -- Remove all border visuals from the window (boolean)
        t.window.resizable = false         -- Let the window be user-resizable (boolean)
        t.window.minwidth = 1              -- Minimum window width if the window is resizable (number)
        t.window.minheight = 1             -- Minimum window height if the window is resizable (number)
        t.window.fullscreen = false        -- Enable fullscreen (boolean)
        t.window.fullscreentype = "normal" -- Standard fullscreen or desktop fullscreen mode (string)
        t.window.vsync = true              -- Enable vertical sync (boolean)
        t.window.fsaa = 0                  -- The number of samples to use with multi-sampled antialiasing (number)
        t.window.display = 1               -- Index of the monitor to show the window in (number)

        t.modules.audio = true             -- Enable the audio module (boolean)
        t.modules.event = true             -- Enable the event module (boolean)
        t.modules.graphics = true          -- Enable the graphics module (boolean)
        t.modules.image = true             -- Enable the image module (boolean)
        t.modules.joystick = true          -- Enable the joystick module (boolean)
        t.modules.keyboard = true          -- Enable the keyboard module (boolean)
        t.modules.math = true              -- Enable the math module (boolean)
        t.modules.mouse = true             -- Enable the mouse module (boolean)
        t.modules.physics = true           -- Enable the physics module (boolean)
        t.modules.sound = true             -- Enable the sound module (boolean)
        t.modules.system = true            -- Enable the system module (boolean)
        t.modules.timer = true             -- Enable the timer module (boolean)
        t.modules.window = true            -- Enable the window module (boolean)
        t.modules.thread = true            -- Enable the thread module (boolean)
    end

Here is a full list of options and their default values for LÖVE
[0.8.0](0.8.0 "0.8.0"):

    function love.conf(t)
        t.title = "Untitled"        -- The title of the window the game is in (string)
        t.author = "Unnamed"        -- The author of the game (string)
        t.url = nil                 -- The website of the game (string)
        t.identity = nil            -- The name of the save directory (string)
        t.version = "0.8.0"         -- The LÖVE version this game was made for (string)
        t.console = false           -- Attach a console (boolean, Windows only)
        t.release = false           -- Enable release mode (boolean)
        t.screen.width = 800        -- The window width (number)
        t.screen.height = 600       -- The window height (number)
        t.screen.fullscreen = false -- Enable fullscreen (boolean)
        t.screen.vsync = true       -- Enable vertical sync (boolean)
        t.screen.fsaa = 0           -- The number of MSAA samples (number)
        t.modules.joystick = true   -- Enable the joystick module (boolean)
        t.modules.audio = true      -- Enable the audio module (boolean)
        t.modules.keyboard = true   -- Enable the keyboard module (boolean)
        t.modules.event = true      -- Enable the event module (boolean)
        t.modules.image = true      -- Enable the image module (boolean)
        t.modules.graphics = true   -- Enable the graphics module (boolean)
        t.modules.timer = true      -- Enable the timer module (boolean)
        t.modules.mouse = true      -- Enable the mouse module (boolean)
        t.modules.sound = true      -- Enable the sound module (boolean)
        t.modules.physics = true    -- Enable the physics module (boolean)
        t.modules.thread = true     -- Enable the thread module (boolean)
    end

Here is a full list of options and their default values for LÖVE
[0.7.2](0.7.2 "0.7.2") and earlier:

    function love.conf(t)
        t.title = "Untitled"        -- The title of the window the game is in (string)
        t.author = "Unnamed"        -- The author of the game (string)
        t.identity = nil            -- The name of the save directory (string)
        t.version = 0               -- The LÖVE version this game was made for (number)
        t.console = false           -- Attach a console (boolean, Windows only)
        t.screen.width = 800        -- The window width (number)
        t.screen.height = 600       -- The window height (number)
        t.screen.fullscreen = false -- Enable fullscreen (boolean)
        t.screen.vsync = true       -- Enable vertical sync (boolean)
        t.screen.fsaa = 0           -- The number of MSAA samples (number)
        t.modules.joystick = true   -- Enable the joystick module (boolean)
        t.modules.audio = true      -- Enable the audio module (boolean)
        t.modules.keyboard = true   -- Enable the keyboard module (boolean)
        t.modules.event = true      -- Enable the event module (boolean)
        t.modules.image = true      -- Enable the image module (boolean)
        t.modules.graphics = true   -- Enable the graphics module (boolean)
        t.modules.timer = true      -- Enable the timer module (boolean)
        t.modules.mouse = true      -- Enable the mouse module (boolean)
        t.modules.sound = true      -- Enable the sound module (boolean)
        t.modules.physics = true    -- Enable the physics module (boolean)
    end

## See Also

- [love](love "love")

  

## Other Languages

[Dansk](Config_Files_(Dansk) "Config Files (Dansk)") –
[Deutsch](Config_Files_(Deutsch) "Config Files (Deutsch)") –
English –
[Español](Config_Files_(Espa%C3%B1ol) "Config Files (Español)") –
[Français](Config_Files_(Fran%C3%A7ais) "Config Files (Français)") –
[Indonesia](Config_Files_(Indonesia) "Config Files (Indonesia)") –
<a
href="/w/index.php?title=Config_Files_(Italiano)&amp;action=edit&amp;redlink=1"
class="new"
title="Config Files (Italiano) (page does not exist)">Italiano</a> – <a
href="/w/index.php?title=Config_Files_(Lietuvi%C5%A1kai)&amp;action=edit&amp;redlink=1"
class="new"
title="Config Files (Lietuviškai) (page does not exist)">Lietuviškai</a> –
[Magyar](Config_Files_(Magyar) "Config Files (Magyar)") – <a
href="/w/index.php?title=Config_Files_(Nederlands)&amp;action=edit&amp;redlink=1"
class="new"
title="Config Files (Nederlands) (page does not exist)">Nederlands</a> –
[Polski](Config_Files_(Polski) "Config Files (Polski)") –
[Português](Config_Files_(Portugu%C3%AAs) "Config Files (Português)") –
<a
href="/w/index.php?title=Config_Files_(Rom%C3%A2n%C4%83)&amp;action=edit&amp;redlink=1"
class="new"
title="Config Files (Română) (page does not exist)">Română</a> – <a
href="/w/index.php?title=Config_Files_(Slovensk%C3%BD)&amp;action=edit&amp;redlink=1"
class="new"
title="Config Files (Slovenský) (page does not exist)">Slovenský</a> –
<a
href="/w/index.php?title=Config_Files_(Suomi)&amp;action=edit&amp;redlink=1"
class="new">Suomi</a> –
[Svenska](Config_Files_(Svenska) "Config Files (Svenska)") – <a
href="/w/index.php?title=Config_Files_(T%C3%BCrk%C3%A7e)&amp;action=edit&amp;redlink=1"
class="new"
title="Config Files (Türkçe) (page does not exist)">Türkçe</a> – <a
href="/w/index.php?title=Config_Files_(%C4%8Cesky)&amp;action=edit&amp;redlink=1"
class="new">Česky</a> –
<a
href="/w/index.php?title=Config_Files_(%CE%95%CE%BB%CE%BB%CE%B7%CE%BD%CE%B9%CE%BA%CE%AC)&amp;action=edit&amp;redlink=1"
class="new"
title="Config Files (Ελληνικά) (page does not exist)">Ελληνικά</a> – <a
href="/w/index.php?title=Config_Files_(%D0%91%D1%8A%D0%BB%D0%B3%D0%B0%D1%80%D1%81%D0%BA%D0%B8)&amp;action=edit&amp;redlink=1"
class="new"
title="Config Files (Български) (page does not exist)">Български</a> –
[Русский](Config_Files_(%D0%A0%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9) "Config Files (Русский)") –
<a
href="/w/index.php?title=Config_Files_(%D0%A1%D1%80%D0%BF%D1%81%D0%BA%D0%B8)&amp;action=edit&amp;redlink=1"
class="new"
title="Config Files (Српски) (page does not exist)">Српски</a> –
[Українська](Config_Files_(%D0%A3%D0%BA%D1%80%D0%B0%D1%97%D0%BD%D1%81%D1%8C%D0%BA%D0%B0) "Config Files (Українська)") –
<a
href="/w/index.php?title=Config_Files_(%D7%A2%D7%91%D7%A8%D7%99%D7%AA)&amp;action=edit&amp;redlink=1"
class="new">עברית</a> –
<a
href="/w/index.php?title=Config_Files_(%E0%B9%84%E0%B8%97%E0%B8%A2)&amp;action=edit&amp;redlink=1"
class="new">ไทย</a> –
[日本語](Config_Files_(%E6%97%A5%E6%9C%AC%E8%AA%9E) "Config Files (日本語)") –
<a
href="/w/index.php?title=Config_Files_(%E6%AD%A3%E9%AB%94%E4%B8%AD%E6%96%87)&amp;action=edit&amp;redlink=1"
class="new"
title="Config Files (正體中文) (page does not exist)">正體中文</a> –
[简体中文](Config_Files_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87) "Config Files (简体中文)") –
[Tiếng
Việt](Config_Files_(Ti%E1%BA%BFng_Vi%E1%BB%87t) "Config Files (Tiếng Việt)") –
[한국어](Config_Files_(%ED%95%9C%EA%B5%AD%EC%96%B4) "Config Files (한국어)")  
*[More
info](Help:i18n "Help:i18n")*
