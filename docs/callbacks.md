# Callbacks

LÖVE callbacks are functions that you define in your game which LÖVE calls at specific times.

## Available Callbacks

- [conf](#conf)
- [directorydropped](#directorydropped)
- [displayrotated](#displayrotated)
- [draw](#draw)
- [errorhandler](#errorhandler)
- [filedropped](#filedropped)
- [focus](#focus)
- [gamepadaxis](#gamepadaxis)
- [gamepadpressed](#gamepadpressed)
- [gamepadreleased](#gamepadreleased)
- [joystickadded](#joystickadded)
- [joystickaxis](#joystickaxis)
- [joystickhat](#joystickhat)
- [joystickpressed](#joystickpressed)
- [joystickreleased](#joystickreleased)
- [joystickremoved](#joystickremoved)
- [keypressed](#keypressed)
- [keyreleased](#keyreleased)
- [load](#load)
- [lowmemory](#lowmemory)
- [mousefocus](#mousefocus)
- [mousemoved](#mousemoved)
- [mousepressed](#mousepressed)
- [mousereleased](#mousereleased)
- [quit](#quit)
- [resize](#resize)
- [run](#run)
- [textedited](#textedited)
- [textinput](#textinput)
- [threaderror](#threaderror)
- [touchmoved](#touchmoved)
- [touchpressed](#touchpressed)
- [touchreleased](#touchreleased)
- [update](#update)
- [visible](#visible)
- [wheelmoved](#wheelmoved)

---

## conf

If a file called conf.lua is present in your game folder (or .love file), it is run before the LÖVE modules are loaded. You can use this file to overwrite the love.conf function, which is later called by the LÖVE 'boot' script. Using the love.conf function, you can set some configuration options, and change things like the default size of the window, which modules are loaded, and other stuff.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| t | table |  | The love.conf function takes one argument: a table filled with all the default values which you can overwrite to your liking. If you want to change the default window size, for instance, do:

function love.conf(t)
    t.window.width = 1024
    t.window.height = 768
end

If you don't need the physics module or joystick module, do the following.

function love.conf(t)
    t.modules.joystick = false
    t.modules.physics = false
end

Setting unused modules to false is encouraged when you release your game. It reduces startup time slightly (especially if the joystick module is disabled) and reduces memory usage (slightly).

Note that you can't disable love.filesystem; it's mandatory. The same goes for the love module itself. love.graphics needs love.window to be enabled. (see table fields below) |

**t table fields:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| identity | string | nil | This flag determines the name of the save directory for your game. Note that you can only specify the name, not the location where it will be created:
t.identity = "gabe_HL3" -- Correct

t.identity = "c:/Users/gabe/HL3" -- Incorrect
Alternatively love.filesystem.setIdentity can be used to set the save directory outside of the config file. |
| appendidentity | boolean | false | This flag determines if game directory should be searched first then save directory (true) or otherwise (false) |
| version | string | "11.5" | t.version should be a string, representing the version of LÖVE for which your game was made. It should be formatted as "X.Y.Z" where X is the major release number, Y the minor, and Z the patch level. It allows LÖVE to display a warning if it isn't compatible. Its default is the version of LÖVE running. |
| console | boolean | false | Determines whether a console should be opened alongside the game window (Windows only) or not. Note: On OSX you can get console output by running LÖVE through the terminal. |
| accelerometerjoystick | boolean | true | Sets whether the device accelerometer on iOS and Android should be exposed as a 3-axis Joystick. Disabling the accelerometer when it's not used may reduce CPU usage. |
| externalstorage | boolean | false | Sets whether files are saved in external storage (true) or internal storage (false) on Android. |
| gammacorrect | boolean | false | Determines whether gamma-correct rendering is enabled, when the system supports it. |
| audio | table |  | Audio options. |
| window | table |  | It is possible to defer window creation until love.window.setMode is first called in your code. To do so, set t.window = nil in love.conf (or t.screen = nil in older versions.) If this is done, LÖVE may crash if any function from love.graphics is called before the first love.window.setMode in your code.

The t.window table was named t.screen in versions prior to 0.9.0. The t.screen table doesn't exist in love.conf in 0.9.0, and the t.window table doesn't exist in love.conf in 0.8.0. This means love.conf will fail to execute (therefore it will fall back to default values) if care is not taken to use the correct table for the LÖVE version being used. |
| modules | table |  | Module options. |

**Returns:**

*No return values*

## directorydropped

Callback function triggered when a directory is dragged and dropped onto the window.

Paths passed into this callback are able to be used with love.filesystem.mount, which is the only way to get read access via love.filesystem to the dropped directory. love.filesystem.mount does not generally accept other full platform-dependent directory paths that haven't been dragged and dropped onto the window.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| path | string |  | The full platform-dependent path to the directory. It can be used as an argument to love.filesystem.mount, in order to gain read access to the directory with love.filesystem. |

**Returns:**

*No return values*

## displayrotated

Called when the device display orientation changed, for example, user rotated their phone 180 degrees.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| index | number |  | The index of the display that changed orientation. |
| orientation | DisplayOrientation |  | The new orientation. |

**Returns:**

*No return values*

## draw

Callback function used to draw on the screen every frame.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

## errorhandler

The error handler, used to display error messages.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| msg | string |  | The error message. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| mainLoop | function | Function which handles one frame, including events and rendering, when called. If this is nil then LÖVE exits immediately. |

## filedropped

Callback function triggered when a file is dragged and dropped onto the window.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| file | DroppedFile |  | The unopened File object representing the file that was dropped. |

**Returns:**

*No return values*

## focus

Callback function triggered when window receives or loses focus.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| focus | boolean |  | True if the window gains focus, false if it loses focus.  |

**Returns:**

*No return values*

## gamepadaxis

Called when a Joystick's virtual gamepad axis is moved.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| joystick | Joystick |  | The joystick object. |
| axis | GamepadAxis |  | The virtual gamepad axis. |
| value | number |  | The new axis value. |

**Returns:**

*No return values*

## gamepadpressed

Called when a Joystick's virtual gamepad button is pressed.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| joystick | Joystick |  | The joystick object. |
| button | GamepadButton |  | The virtual gamepad button. |

**Returns:**

*No return values*

## gamepadreleased

Called when a Joystick's virtual gamepad button is released.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| joystick | Joystick |  | The joystick object. |
| button | GamepadButton |  | The virtual gamepad button. |

**Returns:**

*No return values*

## joystickadded

Called when a Joystick is connected.

This callback is also triggered after love.load for every Joystick which was already connected when the game started up.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| joystick | Joystick |  | The newly connected Joystick object. |

**Returns:**

*No return values*

## joystickaxis

Called when a joystick axis moves.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| joystick | Joystick |  | The joystick object. |
| axis | number |  | The axis number. |
| value | number |  | The new axis value. |

**Returns:**

*No return values*

## joystickhat

Called when a joystick hat direction changes.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| joystick | Joystick |  | The joystick object. |
| hat | number |  | The hat number. |
| direction | JoystickHat |  | The new hat direction. |

**Returns:**

*No return values*

## joystickpressed

Called when a joystick button is pressed.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| joystick | Joystick |  | The joystick object. |
| button | number |  | The button number. |

**Returns:**

*No return values*

## joystickreleased

Called when a joystick button is released.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| joystick | Joystick |  | The joystick object. |
| button | number |  | The button number. |

**Returns:**

*No return values*

## joystickremoved

Called when a Joystick is disconnected.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| joystick | Joystick |  | The now-disconnected Joystick object. |

**Returns:**

*No return values*

## keypressed

Callback function triggered when a key is pressed.

### Variant 1

Scancodes are keyboard layout-independent, so the scancode 'w' will be generated if the key in the same place as the 'w' key on an American keyboard is pressed, no matter what the key is labelled or what the user's operating system settings are.

Key repeat needs to be enabled with love.keyboard.setKeyRepeat for repeat keypress events to be received. This does not affect love.textinput.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| key | KeyConstant |  | Character of the pressed key. |
| scancode | Scancode |  | The scancode representing the pressed key. |
| isrepeat | boolean |  | Whether this keypress event is a repeat. The delay between key repeats depends on the user's system settings. |

**Returns:**

*No return values*

### Variant 2

Key repeat needs to be enabled with love.keyboard.setKeyRepeat for repeat keypress events to be received.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| key | KeyConstant |  | Character of the key pressed. |
| isrepeat | boolean |  | Whether this keypress event is a repeat. The delay between key repeats depends on the user's system settings. |

**Returns:**

*No return values*

## keyreleased

Callback function triggered when a keyboard key is released.

Scancodes are keyboard layout-independent, so the scancode 'w' will be used if the key in the same place as the 'w' key on an American keyboard is pressed, no matter what the key is labelled or what the user's operating system settings are.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| key | KeyConstant |  | Character of the released key. |
| scancode | Scancode |  | The scancode representing the released key. |

**Returns:**

*No return values*

## load

This function is called exactly once at the beginning of the game.

In LÖVE 11.0, the passed arguments excludes the game name and the fused command-line flag (if exist) when runs from non-fused LÖVE executable. Previous version pass the argument as-is without any filtering.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| arg | table |  | Command-line arguments given to the game. |
| unfilteredArg | table |  | Unfiltered command-line arguments given to the executable (see #Notes). |

**Returns:**

*No return values*

## lowmemory

Callback function triggered when the system is running out of memory on mobile devices.

Mobile operating systems may forcefully kill the game if it uses too much memory, so any non-critical resource should be removed if possible (by setting all variables referencing the resources to '''nil'''), when this event is triggered. Sounds and images in particular tend to use the most memory.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

## mousefocus

Callback function triggered when window receives or loses mouse focus.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| focus | boolean |  | Whether the window has mouse focus or not. |

**Returns:**

*No return values*

## mousemoved

Callback function triggered when the mouse is moved.

If Relative Mode is enabled for the mouse, the '''dx''' and '''dy''' arguments of this callback will update but '''x''' and '''y''' are not guaranteed to.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | The mouse position on the x-axis. |
| y | number |  | The mouse position on the y-axis. |
| dx | number |  | The amount moved along the x-axis since the last time love.mousemoved was called. |
| dy | number |  | The amount moved along the y-axis since the last time love.mousemoved was called. |
| istouch | boolean |  | True if the mouse button press originated from a touchscreen touch-press. |

**Returns:**

*No return values*

## mousepressed

Callback function triggered when a mouse button is pressed.

Use love.wheelmoved to detect mouse wheel motion. It will not register as a button press in version 0.10.0 and newer.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | Mouse x position, in pixels. |
| y | number |  | Mouse y position, in pixels. |
| button | number |  | The button index that was pressed. 1 is the primary mouse button, 2 is the secondary mouse button and 3 is the middle button. Further buttons are mouse dependent. |
| istouch | boolean |  | True if the mouse button press originated from a touchscreen touch-press. |
| presses | number |  | The number of presses in a short time frame and small area, used to simulate double, triple clicks |

**Returns:**

*No return values*

## mousereleased

Callback function triggered when a mouse button is released.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | Mouse x position, in pixels. |
| y | number |  | Mouse y position, in pixels. |
| button | number |  | The button index that was released. 1 is the primary mouse button, 2 is the secondary mouse button and 3 is the middle button. Further buttons are mouse dependent. |
| istouch | boolean |  | True if the mouse button release originated from a touchscreen touch-release. |
| presses | number |  | The number of presses in a short time frame and small area, used to simulate double, triple clicks |

**Returns:**

*No return values*

## quit

Callback function triggered when the game is closed.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| r | boolean | Abort quitting. If true, do not close the game. |

## resize

Called when the window is resized, for example if the user resizes the window, or if love.window.setMode is called with an unsupported width or height in fullscreen and the window chooses the closest appropriate size.

Calls to love.window.setMode will '''only''' trigger this event if the width or height of the window after the call doesn't match the requested width and height. This can happen if a fullscreen mode is requested which doesn't match any supported mode, or if the fullscreen type is 'desktop' and the requested width or height don't match the desktop resolution.

Since 11.0, this function returns width and height in DPI-scaled units rather than pixels.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| w | number |  | The new width. |
| h | number |  | The new height. |

**Returns:**

*No return values*

## run

The main function, containing the main loop. A sensible default is used when left out.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| mainLoop | function | Function which handlers one frame, including events and rendering when called. |

## textedited

Called when the candidate text for an IME (Input Method Editor) has changed.

The candidate text is not the final text that the user will eventually choose. Use love.textinput for that.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| text | string |  | The UTF-8 encoded unicode candidate text. |
| start | number |  | The start cursor of the selected candidate text. |
| length | number |  | The length of the selected candidate text. May be 0. |

**Returns:**

*No return values*

## textinput

Called when text has been entered by the user. For example if shift-2 is pressed on an American keyboard layout, the text '@' will be generated.

Although Lua strings can store UTF-8 encoded unicode text just fine, many functions in Lua's string library will not treat the text as you might expect. For example, #text (and string.len(text)) will give the number of ''bytes'' in the string, rather than the number of unicode characters. The Lua wiki and a presentation by one of Lua's creators give more in-depth explanations, with some tips.

The utf8 library can be used to operate on UTF-8 encoded unicode text (such as the text argument given in this function.)

On Android and iOS, textinput is disabled by default; call love.keyboard.setTextInput to enable it.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| text | string |  | The UTF-8 encoded unicode text. |

**Returns:**

*No return values*

## threaderror

Callback function triggered when a Thread encounters an error.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| thread | Thread |  | The thread which produced the error. |
| errorstr | string |  | The error message. |

**Returns:**

*No return values*

## touchmoved

Callback function triggered when a touch press moves inside the touch screen.

The identifier is only guaranteed to be unique for the specific touch press until love.touchreleased is called with that identifier, at which point it may be reused for new touch presses.

The unofficial Android and iOS ports of LÖVE 0.9.2 reported touch positions as normalized values in the range of 1, whereas this API reports positions in pixels.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| id | light userdata |  | The identifier for the touch press. |
| x | number |  | The x-axis position of the touch inside the window, in pixels. |
| y | number |  | The y-axis position of the touch inside the window, in pixels. |
| dx | number |  | The x-axis movement of the touch inside the window, in pixels. |
| dy | number |  | The y-axis movement of the touch inside the window, in pixels. |
| pressure | number |  | The amount of pressure being applied. Most touch screens aren't pressure sensitive, in which case the pressure will be 1. |

**Returns:**

*No return values*

## touchpressed

Callback function triggered when the touch screen is touched.

The identifier is only guaranteed to be unique for the specific touch press until love.touchreleased is called with that identifier, at which point it may be reused for new touch presses.

The unofficial Android and iOS ports of LÖVE 0.9.2 reported touch positions as normalized values in the range of 1, whereas this API reports positions in pixels.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| id | light userdata |  | The identifier for the touch press. |
| x | number |  | The x-axis position of the touch press inside the window, in pixels. |
| y | number |  | The y-axis position of the touch press inside the window, in pixels. |
| dx | number |  | The x-axis movement of the touch press inside the window, in pixels. This should always be zero. |
| dy | number |  | The y-axis movement of the touch press inside the window, in pixels. This should always be zero. |
| pressure | number |  | The amount of pressure being applied. Most touch screens aren't pressure sensitive, in which case the pressure will be 1. |

**Returns:**

*No return values*

## touchreleased

Callback function triggered when the touch screen stops being touched.

The identifier is only guaranteed to be unique for the specific touch press until love.touchreleased is called with that identifier, at which point it may be reused for new touch presses.

The unofficial Android and iOS ports of LÖVE 0.9.2 reported touch positions as normalized values in the range of 1, whereas this API reports positions in pixels.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| id | light userdata |  | The identifier for the touch press. |
| x | number |  | The x-axis position of the touch inside the window, in pixels. |
| y | number |  | The y-axis position of the touch inside the window, in pixels. |
| dx | number |  | The x-axis movement of the touch inside the window, in pixels. |
| dy | number |  | The y-axis movement of the touch inside the window, in pixels. |
| pressure | number |  | The amount of pressure being applied. Most touch screens aren't pressure sensitive, in which case the pressure will be 1. |

**Returns:**

*No return values*

## update

Callback function used to update the state of the game every frame.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| dt | number |  | Time since the last update in seconds. |

**Returns:**

*No return values*

## visible

Callback function triggered when window is minimized/hidden or unminimized by the user.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| visible | boolean |  | True if the window is visible, false if it isn't. |

**Returns:**

*No return values*

## wheelmoved

Callback function triggered when the mouse wheel is moved.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | Amount of horizontal mouse wheel movement. Positive values indicate movement to the right. |
| y | number |  | Amount of vertical mouse wheel movement. Positive values indicate upward movement. |

**Returns:**

*No return values*

