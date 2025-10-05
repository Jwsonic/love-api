# love.window

Provides an interface for modifying and retrieving information about the program's window.

## Contents

**Functions:**

- [close](#lovewindowclose)
- [fromPixels](#lovewindowfrompixels)
- [getDPIScale](#lovewindowgetdpiscale)
- [getDesktopDimensions](#lovewindowgetdesktopdimensions)
- [getDisplayCount](#lovewindowgetdisplaycount)
- [getDisplayName](#lovewindowgetdisplayname)
- [getDisplayOrientation](#lovewindowgetdisplayorientation)
- [getFullscreen](#lovewindowgetfullscreen)
- [getFullscreenModes](#lovewindowgetfullscreenmodes)
- [getIcon](#lovewindowgeticon)
- [getMode](#lovewindowgetmode)
- [getPosition](#lovewindowgetposition)
- [getSafeArea](#lovewindowgetsafearea)
- [getTitle](#lovewindowgettitle)
- [getVSync](#lovewindowgetvsync)
- [hasFocus](#lovewindowhasfocus)
- [hasMouseFocus](#lovewindowhasmousefocus)
- [isDisplaySleepEnabled](#lovewindowisdisplaysleepenabled)
- [isMaximized](#lovewindowismaximized)
- [isMinimized](#lovewindowisminimized)
- [isOpen](#lovewindowisopen)
- [isVisible](#lovewindowisvisible)
- [maximize](#lovewindowmaximize)
- [minimize](#lovewindowminimize)
- [requestAttention](#lovewindowrequestattention)
- [restore](#lovewindowrestore)
- [setDisplaySleepEnabled](#lovewindowsetdisplaysleepenabled)
- [setFullscreen](#lovewindowsetfullscreen)
- [setIcon](#lovewindowseticon)
- [setMode](#lovewindowsetmode)
- [setPosition](#lovewindowsetposition)
- [setTitle](#lovewindowsettitle)
- [setVSync](#lovewindowsetvsync)
- [showMessageBox](#lovewindowshowmessagebox)
- [toPixels](#lovewindowtopixels)
- [updateMode](#lovewindowupdatemode)

**Enums:**

- [DisplayOrientation](#displayorientation)
- [FullscreenType](#fullscreentype)
- [MessageBoxType](#messageboxtype)

---

## Functions

## love.window.close

Closes the window. It can be reopened with love.window.setMode.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

## love.window.fromPixels

Converts a number from pixels to density-independent units.

The pixel density inside the window might be greater (or smaller) than the 'size' of the window. For example on a retina screen in Mac OS X with the highdpi window flag enabled, the window may take up the same physical size as an 800x600 window, but the area inside the window uses 1600x1200 pixels. love.window.fromPixels(1600) would return 800 in that case.

This function converts coordinates from pixels to the size users are expecting them to display at onscreen. love.window.toPixels does the opposite. The highdpi window flag must be enabled to use the full pixel density of a Retina screen on Mac OS X and iOS. The flag currently does nothing on Windows and Linux, and on Android it is effectively always enabled.

Most LÖVE functions return values and expect arguments in terms of pixels rather than density-independent units.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| pixelvalue | number |  | A number in pixels to convert to density-independent units. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| value | number | The converted number, in density-independent units. |

### Variant 2

The units of love.graphics.getWidth, love.graphics.getHeight, love.mouse.getPosition, mouse events, love.touch.getPosition, and touch events are always in terms of pixels.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| px | number |  | The x-axis value of a coordinate in pixels. |
| py | number |  | The y-axis value of a coordinate in pixels. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| x | number | The converted x-axis value of the coordinate, in density-independent units. |
| y | number | The converted y-axis value of the coordinate, in density-independent units. |

## love.window.getDPIScale

Gets the DPI scale factor associated with the window.

The pixel density inside the window might be greater (or smaller) than the 'size' of the window. For example on a retina screen in Mac OS X with the highdpi window flag enabled, the window may take up the same physical size as an 800x600 window, but the area inside the window uses 1600x1200 pixels. love.window.getDPIScale() would return 2.0 in that case.

The love.window.fromPixels and love.window.toPixels functions can also be used to convert between units.

The highdpi window flag must be enabled to use the full pixel density of a Retina screen on Mac OS X and iOS. The flag currently does nothing on Windows and Linux, and on Android it is effectively always enabled.

The units of love.graphics.getWidth, love.graphics.getHeight, love.mouse.getPosition, mouse events, love.touch.getPosition, and touch events are always in terms of pixels.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| scale | number | The pixel scale factor associated with the window. |

## love.window.getDesktopDimensions

Gets the width and height of the desktop.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| displayindex | number | 1 | The index of the display, if multiple monitors are available. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| width | number | The width of the desktop. |
| height | number | The height of the desktop. |

## love.window.getDisplayCount

Gets the number of connected monitors.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| count | number | The number of currently connected displays. |

## love.window.getDisplayName

Gets the name of a display.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| displayindex | number | 1 | The index of the display to get the name of. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| name | string | The name of the specified display. |

## love.window.getDisplayOrientation

Gets current device display orientation.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| displayindex | number | nil | Display index to get its display orientation, or nil for default display index. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| orientation | [DisplayOrientation](#displayorientation) | Current device display orientation. |

## love.window.getFullscreen

Gets whether the window is fullscreen.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| fullscreen | boolean | True if the window is fullscreen, false otherwise. |
| fstype | [FullscreenType](#fullscreentype) | The type of fullscreen mode used. |

## love.window.getFullscreenModes

Gets a list of supported fullscreen modes.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| displayindex | number | 1 | The index of the display, if multiple monitors are available. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| modes | table | A table of width/height pairs. (Note that this may not be in order.) (see table fields below) |

**modes table fields:**

| Name | Type | Description |
| --- | --- | --- |
| width | number | Window fullscreen width. |
| height | number | Window fullscreen height. |

## love.window.getIcon

Gets the window icon.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| imagedata | ImageData | The window icon imagedata, or nil if no icon has been set with love.window.setIcon. |

## love.window.getMode

Gets the display mode and properties of the window.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| width | number | Window width. |
| height | number | Window height. |
| flags | table | Table with the window properties: (see table fields below) |

**flags table fields:**

| Name | Type | Description |
| --- | --- | --- |
| fullscreen | boolean | Fullscreen (true), or windowed (false). |
| fullscreentype | [FullscreenType](#fullscreentype) | The type of fullscreen mode used. |
| vsync | boolean | True if the graphics framerate is synchronized with the monitor's refresh rate, false otherwise. |
| msaa | number | The number of antialiasing samples used (0 if MSAA is disabled). |
| resizable | boolean | True if the window is resizable in windowed mode, false otherwise. |
| borderless | boolean | True if the window is borderless in windowed mode, false otherwise. |
| centered | boolean | True if the window is centered in windowed mode, false otherwise. |
| display | number | The index of the display the window is currently in, if multiple monitors are available. |
| minwidth | number | The minimum width of the window, if it's resizable. |
| minheight | number | The minimum height of the window, if it's resizable. |
| highdpi | boolean | True if high-dpi mode is allowed on Retina displays in OS X. Does nothing on non-Retina displays. |
| refreshrate | number | The refresh rate of the screen's current display mode, in Hz. May be 0 if the value can't be determined. |
| x | number | The x-coordinate of the window's position in its current display. |
| y | number | The y-coordinate of the window's position in its current display. |
| srgb | boolean | Removed in 0.10.0 (use love.graphics.isGammaCorrect instead). True if sRGB gamma correction is applied when drawing to the screen. |

## love.window.getPosition

Gets the position of the window on the screen.

The window position is in the coordinate space of the display it is currently in.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| x | number | The x-coordinate of the window's position. |
| y | number | The y-coordinate of the window's position. |
| displayindex | number | The index of the display that the window is in. |

## love.window.getSafeArea

Gets area inside the window which is known to be unobstructed by a system title bar, the iPhone X notch, etc. Useful for making sure UI elements can be seen by the user.

Values returned are in DPI-scaled units (the same coordinate system as most other window-related APIs), not in pixels.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| x | number | Starting position of safe area (x-axis). |
| y | number | Starting position of safe area (y-axis). |
| w | number | Width of safe area. |
| h | number | Height of safe area. |

## love.window.getTitle

Gets the window title.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| title | string | The current window title. |

## love.window.getVSync

Gets current vertical synchronization (vsync).

This can be less expensive alternative to love.window.getMode if you want to get current vsync status.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| vsync | number | Current vsync status. 1 if enabled, 0 if disabled, and -1 for adaptive vsync. |

## love.window.hasFocus

Checks if the game window has keyboard focus.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| focus | boolean | True if the window has the focus or false if not. |

## love.window.hasMouseFocus

Checks if the game window has mouse focus.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| focus | boolean | True if the window has mouse focus or false if not. |

## love.window.isDisplaySleepEnabled

Gets whether the display is allowed to sleep while the program is running.

Display sleep is disabled by default. Some types of input (e.g. joystick button presses) might not prevent the display from sleeping, if display sleep is allowed.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| enabled | boolean | True if system display sleep is enabled / allowed, false otherwise. |

## love.window.isMaximized

Gets whether the Window is currently maximized.

The window can be maximized if it is not fullscreen and is resizable, and either the user has pressed the window's Maximize button or love.window.maximize has been called.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| maximized | boolean | True if the window is currently maximized in windowed mode, false otherwise. |

## love.window.isMinimized

Gets whether the Window is currently minimized.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| minimized | boolean | True if the window is currently minimized, false otherwise. |

## love.window.isOpen

Checks if the window is open.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| open | boolean | True if the window is open, false otherwise. |

## love.window.isVisible

Checks if the game window is visible.

The window is considered visible if it's not minimized and the program isn't hidden.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| visible | boolean | True if the window is visible or false if not. |

## love.window.maximize

Makes the window as large as possible.

This function has no effect if the window isn't resizable, since it essentially programmatically presses the window's 'maximize' button.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

## love.window.minimize

Minimizes the window to the system's task bar / dock.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

## love.window.requestAttention

Causes the window to request the attention of the user if it is not in the foreground.

In Windows the taskbar icon will flash, and in OS X the dock icon will bounce.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| continuous | boolean | false | Whether to continuously request attention until the window becomes active, or to do it only once. |

**Returns:**

*No return values*

## love.window.restore

Restores the size and position of the window if it was minimized or maximized.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

## love.window.setDisplaySleepEnabled

Sets whether the display is allowed to sleep while the program is running.

Display sleep is disabled by default. Some types of input (e.g. joystick button presses) might not prevent the display from sleeping, if display sleep is allowed.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| enable | boolean |  | True to enable system display sleep, false to disable it. |

**Returns:**

*No return values*

## love.window.setFullscreen

Enters or exits fullscreen. The display to use when entering fullscreen is chosen based on which display the window is currently in, if multiple monitors are connected.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| fullscreen | boolean |  | Whether to enter or exit fullscreen mode. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| success | boolean | True if an attempt to enter fullscreen was successful, false otherwise. |

### Variant 2

If fullscreen mode is entered and the window size doesn't match one of the monitor's display modes (in normal fullscreen mode) or the window size doesn't match the desktop size (in 'desktop' fullscreen mode), the window will be resized appropriately. The window will revert back to its original size again when fullscreen mode is exited using this function.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| fullscreen | boolean |  | Whether to enter or exit fullscreen mode. |
| fstype | [FullscreenType](#fullscreentype) |  | The type of fullscreen mode to use. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| success | boolean | True if an attempt to enter fullscreen was successful, false otherwise. |

## love.window.setIcon

Sets the window icon until the game is quit. Not all operating systems support very large icon images.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| imagedata | ImageData |  | The window icon image. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| success | boolean | Whether the icon has been set successfully. |

## love.window.setMode

Sets the display mode and properties of the window.

If width or height is 0, setMode will use the width and height of the desktop. 

Changing the display mode may have side effects: for example, canvases will be cleared and values sent to shaders with canvases beforehand or re-draw to them afterward if you need to.

* If fullscreen is enabled and the width or height is not supported (see resize event will be triggered.

* If the fullscreen type is 'desktop', then the window will be automatically resized to the desktop resolution.

* If the width and height is bigger than or equal to the desktop dimensions (this includes setting both to 0) and fullscreen is set to false, it will appear 'visually' fullscreen, but it's not true fullscreen and conf.lua (i.e. t.window = false) and use this function to manually create the window, then you must not call any other love.graphics.* function before this one. Doing so will result in undefined behavior and/or crashes because OpenGL cannot function properly without a window.

* Transparent backgrounds are currently not supported.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| width | number |  | Display width. |
| height | number |  | Display height. |
| flags | table |  | The flags table with the options: (see table fields below) |

**flags table fields:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| fullscreen | boolean | false | Fullscreen (true), or windowed (false). |
| fullscreentype | [FullscreenType](#fullscreentype) | 'desktop' | The type of fullscreen to use. This defaults to 'normal' in 0.9.0 through 0.9.2 and to 'desktop' in 0.10.0 and older. |
| vsync | boolean | true | True if LÖVE should wait for vsync, false otherwise. |
| msaa | number | 0 | The number of antialiasing samples. |
| stencil | boolean | true | Whether a stencil buffer should be allocated. If true, the stencil buffer will have 8 bits. |
| depth | number | 0 | The number of bits in the depth buffer. |
| resizable | boolean | false | True if the window should be resizable in windowed mode, false otherwise. |
| borderless | boolean | false | True if the window should be borderless in windowed mode, false otherwise. |
| centered | boolean | true | True if the window should be centered in windowed mode, false otherwise. |
| display | number | 1 | The index of the display to show the window in, if multiple monitors are available. |
| minwidth | number | 1 | The minimum width of the window, if it's resizable. Cannot be less than 1. |
| minheight | number | 1 | The minimum height of the window, if it's resizable. Cannot be less than 1. |
| highdpi | boolean | false | True if high-dpi mode should be used on Retina displays in macOS and iOS. Does nothing on non-Retina displays. |
| x | number | nil | The x-coordinate of the window's position in the specified display. |
| y | number | nil | The y-coordinate of the window's position in the specified display. |
| usedpiscale | boolean | true | Disables automatic DPI scaling when false. |
| srgb | boolean | false | Removed in 0.10.0 (set t.gammacorrect in conf.lua instead). True if sRGB gamma correction should be applied when drawing to the screen. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| success | boolean | True if successful, false otherwise. |

## love.window.setPosition

Sets the position of the window on the screen.

The window position is in the coordinate space of the specified display.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | The x-coordinate of the window's position. |
| y | number |  | The y-coordinate of the window's position. |
| displayindex | number | 1 | The index of the display that the new window position is relative to. |

**Returns:**

*No return values*

## love.window.setTitle

Sets the window title.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| title | string |  | The new window title. |

**Returns:**

*No return values*

## love.window.setVSync

Sets vertical synchronization mode.

* Not all graphics drivers support adaptive vsync (-1 value). In that case, it will be automatically set to 1.

* It is recommended to keep vsync activated if you don't know about the possible implications of turning it off.

* This function doesn't recreate the window, unlike love.window.setMode and love.window.updateMode.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| vsync | number |  | VSync number: 1 to enable, 0 to disable, and -1 for adaptive vsync. |

**Returns:**

*No return values*

## love.window.showMessageBox

Displays a message box dialog above the love window. The message box contains a title, optional text, and buttons.

### Variant 1

Displays a simple message box with a single 'OK' button.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| title | string |  | The title of the message box. |
| message | string |  | The text inside the message box. |
| type | [MessageBoxType](#messageboxtype) | 'info' | The type of the message box. |
| attachtowindow | boolean | true | Whether the message box should be attached to the love window or free-floating. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| success | boolean | Whether the message box was successfully displayed. |

### Variant 2

Displays a message box with a customized list of buttons.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| title | string |  | The title of the message box. |
| message | string |  | The text inside the message box. |
| buttonlist | table |  | A table containing a list of button names to show. The table can also contain the fields enterbutton and escapebutton, which should be the index of the default button to use when the user presses 'enter' or 'escape', respectively. |
| type | [MessageBoxType](#messageboxtype) | 'info' | The type of the message box. |
| attachtowindow | boolean | true | Whether the message box should be attached to the love window or free-floating. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| pressedbutton | number | The index of the button pressed by the user. May be 0 if the message box dialog was closed without pressing a button. |

## love.window.toPixels

Converts a number from density-independent units to pixels.

The pixel density inside the window might be greater (or smaller) than the 'size' of the window. For example on a retina screen in Mac OS X with the highdpi window flag enabled, the window may take up the same physical size as an 800x600 window, but the area inside the window uses 1600x1200 pixels. love.window.toPixels(800) would return 1600 in that case.

This is used to convert coordinates from the size users are expecting them to display at onscreen to pixels. love.window.fromPixels does the opposite. The highdpi window flag must be enabled to use the full pixel density of a Retina screen on Mac OS X and iOS. The flag currently does nothing on Windows and Linux, and on Android it is effectively always enabled.

Most LÖVE functions return values and expect arguments in terms of pixels rather than density-independent units.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| value | number |  | A number in density-independent units to convert to pixels. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| pixelvalue | number | The converted number, in pixels. |

### Variant 2

The units of love.graphics.getWidth, love.graphics.getHeight, love.mouse.getPosition, mouse events, love.touch.getPosition, and touch events are always in terms of pixels.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | The x-axis value of a coordinate in density-independent units to convert to pixels. |
| y | number |  | The y-axis value of a coordinate in density-independent units to convert to pixels. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| px | number | The converted x-axis value of the coordinate, in pixels. |
| py | number | The converted y-axis value of the coordinate, in pixels. |

## love.window.updateMode

Sets the display mode and properties of the window, without modifying unspecified properties.

If width or height is 0, updateMode will use the width and height of the desktop. 

Changing the display mode may have side effects: for example, canvases will be cleared. Make sure to save the contents of canvases beforehand or re-draw to them afterward if you need to.

If fullscreen is enabled and the width or height is not supported (see resize event will be triggered.

If the fullscreen type is 'desktop', then the window will be automatically resized to the desktop resolution.

Transparent backgrounds are currently not supported.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| width | number |  | Window width. |
| height | number |  | Window height. |
| settings | table |  | The settings table with the following optional fields. Any field not filled in will use the current value that would be returned by love.window.getMode. (see table fields below) |

**settings table fields:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| fullscreen | boolean |  | Fullscreen (true), or windowed (false). |
| fullscreentype | [FullscreenType](#fullscreentype) |  | The type of fullscreen to use. |
| vsync | boolean |  | True if LÖVE should wait for vsync, false otherwise. |
| msaa | number |  | The number of antialiasing samples. |
| resizable | boolean |  | True if the window should be resizable in windowed mode, false otherwise. |
| borderless | boolean |  | True if the window should be borderless in windowed mode, false otherwise. |
| centered | boolean |  | True if the window should be centered in windowed mode, false otherwise. |
| display | number |  | The index of the display to show the window in, if multiple monitors are available. |
| minwidth | number |  | The minimum width of the window, if it's resizable. Cannot be less than 1. |
| minheight | number |  | The minimum height of the window, if it's resizable. Cannot be less than 1. |
| highdpi | boolean |  | True if high-dpi mode should be used on Retina displays in macOS and iOS. Does nothing on non-Retina displays. |
| x | number |  | The x-coordinate of the window's position in the specified display. |
| y | number |  | The y-coordinate of the window's position in the specified display. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| success | boolean | True if successful, false otherwise. |

## Enums

## DisplayOrientation

Types of device display orientation.

**Constants:**

| Name | Description |
| --- | --- |
| `unknown` | Orientation cannot be determined. |
| `landscape` | Landscape orientation. |
| `landscapeflipped` | Landscape orientation (flipped). |
| `portrait` | Portrait orientation. |
| `portraitflipped` | Portrait orientation (flipped). |

## FullscreenType

Types of fullscreen modes.

**Constants:**

| Name | Description |
| --- | --- |
| `desktop` | Sometimes known as borderless fullscreen windowed mode. A borderless screen-sized window is created which sits on top of all desktop UI elements. The window is automatically resized to match the dimensions of the desktop, and its size cannot be changed. |
| `exclusive` | Standard exclusive-fullscreen mode. Changes the display mode (actual resolution) of the monitor. |
| `normal` | Standard exclusive-fullscreen mode. Changes the display mode (actual resolution) of the monitor. |

## MessageBoxType

Types of message box dialogs. Different types may have slightly different looks.

**Constants:**

| Name | Description |
| --- | --- |
| `info` | Informational dialog. |
| `warning` | Warning dialog. |
| `error` | Error dialog. |

