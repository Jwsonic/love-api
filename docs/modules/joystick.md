# love.joystick

Provides an interface to the user's joystick.

## Contents

**Functions:**

- [getGamepadMappingString](#lovejoystickgetgamepadmappingstring)
- [getJoystickCount](#lovejoystickgetjoystickcount)
- [getJoysticks](#lovejoystickgetjoysticks)
- [loadGamepadMappings](#lovejoystickloadgamepadmappings)
- [saveGamepadMappings](#lovejoysticksavegamepadmappings)
- [setGamepadMapping](#lovejoysticksetgamepadmapping)

**Types:**

- [Joystick](#joystick)

**Enums:**

- [GamepadAxis](#gamepadaxis)
- [GamepadButton](#gamepadbutton)
- [JoystickHat](#joystickhat)
- [JoystickInputType](#joystickinputtype)

---

## Functions

## love.joystick.getGamepadMappingString

Gets the full gamepad mapping string of the Joysticks which have the given GUID, or nil if the GUID isn't recognized as a gamepad.

The mapping string contains binding information used to map the Joystick's buttons an axes to the standard gamepad layout, and can be used later with love.joystick.loadGamepadMappings.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| guid | string |  | The GUID value to get the mapping string for. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| mappingstring | string | A string containing the Joystick's gamepad mappings, or nil if the GUID is not recognized as a gamepad. |

## love.joystick.getJoystickCount

Gets the number of connected joysticks.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| joystickcount | number | The number of connected joysticks. |

## love.joystick.getJoysticks

Gets a list of connected Joysticks.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| joysticks | table | The list of currently connected Joysticks. |

## love.joystick.loadGamepadMappings

Loads a gamepad mappings string or file created with love.joystick.saveGamepadMappings.

It also recognizes any SDL gamecontroller mapping string, such as those created with Steam's Big Picture controller configure interface, or this nice database. If a new mapping is loaded for an already known controller GUID, the later version will overwrite the one currently loaded.

### Variant 1

Loads a gamepad mappings string from a file.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| filename | string |  | The filename to load the mappings string from. |

**Returns:**

*No return values*

### Variant 2

Loads a gamepad mappings string directly.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| mappings | string |  | The mappings string to load. |

**Returns:**

*No return values*

## love.joystick.saveGamepadMappings

Saves the virtual gamepad mappings of all recognized as gamepads and have either been recently used or their gamepad bindings have been modified.

The mappings are stored as a string for use with love.joystick.loadGamepadMappings.

### Variant 1

Saves the gamepad mappings of all relevant joysticks to a file.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| filename | string |  | The filename to save the mappings string to. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| mappings | string | The mappings string that was written to the file. |

### Variant 2

Returns the mappings string without writing to a file.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| mappings | string | The mappings string. |

## love.joystick.setGamepadMapping

Binds a virtual gamepad input to a button, axis or hat for all Joysticks of a certain type. For example, if this function is used with a GUID returned by a Dualshock 3 controller in OS X, the binding will affect Joystick:getGamepadAxis and Joystick:isGamepadDown for ''all'' Dualshock 3 controllers used with the game when run in OS X.

LÖVE includes built-in gamepad bindings for many common controllers. This function lets you change the bindings or add new ones for types of Joysticks which aren't recognized as gamepads by default.

The virtual gamepad buttons and axes are designed around the Xbox 360 controller layout.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| guid | string |  | The OS-dependent GUID for the type of Joystick the binding will affect. |
| button | [GamepadButton](#gamepadbutton) |  | The virtual gamepad button to bind. |
| inputtype | [JoystickInputType](#joystickinputtype) |  | The type of input to bind the virtual gamepad button to. |
| inputindex | number |  | The index of the axis, button, or hat to bind the virtual gamepad button to. |
| hatdir | [JoystickHat](#joystickhat) | nil | The direction of the hat, if the virtual gamepad button will be bound to a hat. nil otherwise. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| success | boolean | Whether the virtual gamepad button was successfully bound. |

### Variant 2

The physical locations for the bound gamepad axes and buttons should correspond as closely as possible to the layout of a standard Xbox 360 controller.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| guid | string |  | The OS-dependent GUID for the type of Joystick the binding will affect. |
| axis | [GamepadAxis](#gamepadaxis) |  | The virtual gamepad axis to bind. |
| inputtype | [JoystickInputType](#joystickinputtype) |  | The type of input to bind the virtual gamepad axis to. |
| inputindex | number |  | The index of the axis, button, or hat to bind the virtual gamepad axis to. |
| hatdir | [JoystickHat](#joystickhat) | nil | The direction of the hat, if the virtual gamepad axis will be bound to a hat. nil otherwise. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| success | boolean | Whether the virtual gamepad axis was successfully bound. |

## Types

## Joystick

Represents a physical joystick.

**Supertypes:** Object

### Methods

#### Joystick:getAxes

Gets the direction of each axis.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| axisDir1 | number | Direction of axis1. |
| axisDir2 | number | Direction of axis2. |
| axisDirN | number | Direction of axisN. |

#### Joystick:getAxis

Gets the direction of an axis.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| axis | number |  | The index of the axis to be checked. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| direction | number | Current value of the axis. |

#### Joystick:getAxisCount

Gets the number of axes on the joystick.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| axes | number | The number of axes available. |

#### Joystick:getButtonCount

Gets the number of buttons on the joystick.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| buttons | number | The number of buttons available. |

#### Joystick:getDeviceInfo

Gets the USB vendor ID, product ID, and product version numbers of joystick which consistent across operating systems.

Can be used to show different icons, etc. for different gamepads.

Some Linux distribution may not ship with SDL 2.0.6 or later, in which case this function will returns 0 for all the three values.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| vendorID | number | The USB vendor ID of the joystick. |
| productID | number | The USB product ID of the joystick. |
| productVersion | number | The product version of the joystick. |

#### Joystick:getGUID

Gets a stable GUID unique to the type of the physical joystick which does not change over time. For example, all Sony Dualshock 3 controllers in OS X have the same GUID. The value is platform-dependent.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| guid | string | The Joystick type's OS-dependent unique identifier. |

#### Joystick:getGamepadAxis

Gets the direction of a virtual gamepad axis. If the Joystick isn't recognized as a gamepad or isn't connected, this function will always return 0.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| axis | [GamepadAxis](#gamepadaxis) |  | The virtual axis to be checked. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| direction | number | Current value of the axis. |

#### Joystick:getGamepadMapping

Gets the button, axis or hat that a virtual gamepad input is bound to.

### Variant 1

Returns nil if the Joystick isn't recognized as a gamepad or the virtual gamepad axis is not bound to a Joystick input.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| axis | [GamepadAxis](#gamepadaxis) |  | The virtual gamepad axis to get the binding for. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| inputtype | [JoystickInputType](#joystickinputtype) | The type of input the virtual gamepad axis is bound to. |
| inputindex | number | The index of the Joystick's button, axis or hat that the virtual gamepad axis is bound to. |
| hatdirection | [JoystickHat](#joystickhat) | The direction of the hat, if the virtual gamepad axis is bound to a hat. nil otherwise. |

### Variant 2

The physical locations for the virtual gamepad axes and buttons correspond as closely as possible to the layout of a standard Xbox 360 controller.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| button | [GamepadButton](#gamepadbutton) |  | The virtual gamepad button to get the binding for. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| inputtype | [JoystickInputType](#joystickinputtype) | The type of input the virtual gamepad button is bound to. |
| inputindex | number | The index of the Joystick's button, axis or hat that the virtual gamepad button is bound to. |
| hatdirection | [JoystickHat](#joystickhat) | The direction of the hat, if the virtual gamepad button is bound to a hat. nil otherwise. |

#### Joystick:getGamepadMappingString

Gets the full gamepad mapping string of this Joystick, or nil if it's not recognized as a gamepad.

The mapping string contains binding information used to map the Joystick's buttons an axes to the standard gamepad layout, and can be used later with love.joystick.loadGamepadMappings.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| mappingstring | string | A string containing the Joystick's gamepad mappings, or nil if the Joystick is not recognized as a gamepad. |

#### Joystick:getHat

Gets the direction of the Joystick's hat.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| hat | number |  | The index of the hat to be checked. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| direction | [JoystickHat](#joystickhat) | The direction the hat is pushed. |

#### Joystick:getHatCount

Gets the number of hats on the joystick.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| hats | number | How many hats the joystick has. |

#### Joystick:getID

Gets the joystick's unique identifier. The identifier will remain the same for the life of the game, even when the Joystick is disconnected and reconnected, but it '''will''' change when the game is re-launched.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| id | number | The Joystick's unique identifier. Remains the same as long as the game is running. |
| instanceid | number | Unique instance identifier. Changes every time the Joystick is reconnected. nil if the Joystick is not connected. |

#### Joystick:getName

Gets the name of the joystick.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| name | string | The name of the joystick. |

#### Joystick:getVibration

Gets the current vibration motor strengths on a Joystick with rumble support.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| left | number | Current strength of the left vibration motor on the Joystick. |
| right | number | Current strength of the right vibration motor on the Joystick. |

#### Joystick:isConnected

Gets whether the Joystick is connected.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| connected | boolean | True if the Joystick is currently connected, false otherwise. |

#### Joystick:isDown

Checks if a button on the Joystick is pressed.

LÖVE 0.9.0 had a bug which required the button indices passed to Joystick:isDown to be 0-based instead of 1-based, for example button 1 would be 0 for this function. It was fixed in 0.9.1.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| buttonN | number |  | The index of a button to check. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| anyDown | boolean | True if any supplied button is down, false if not. |

#### Joystick:isGamepad

Gets whether the Joystick is recognized as a gamepad. If this is the case, the Joystick's buttons and axes can be used in a standardized manner across different operating systems and joystick models via Joystick:getGamepadAxis, Joystick:isGamepadDown, love.gamepadpressed, and related functions.

LÖVE automatically recognizes most popular controllers with a similar layout to the Xbox 360 controller as gamepads, but you can add more with love.joystick.setGamepadMapping.

If the Joystick is recognized as a gamepad, the physical locations for the virtual gamepad axes and buttons correspond as closely as possible to the layout of a standard Xbox 360 controller.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| isgamepad | boolean | True if the Joystick is recognized as a gamepad, false otherwise. |

#### Joystick:isGamepadDown

Checks if a virtual gamepad button on the Joystick is pressed. If the Joystick is not recognized as a Gamepad or isn't connected, then this function will always return false.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| buttonN | [GamepadButton](#gamepadbutton) |  | The gamepad button to check. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| anyDown | boolean | True if any supplied button is down, false if not. |

#### Joystick:isVibrationSupported

Gets whether the Joystick supports vibration.

The very first call to this function may take more time than expected because SDL's Haptic / Force Feedback subsystem needs to be initialized.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| supported | boolean | True if rumble / force feedback vibration is supported on this Joystick, false if not. |

#### Joystick:setVibration

Sets the vibration motor speeds on a Joystick with rumble support. Most common gamepads have this functionality, although not all drivers give proper support. Use Joystick:isVibrationSupported to check.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| left | number |  | Strength of the left vibration motor on the Joystick. Must be in the range of 1. |
| right | number |  | Strength of the right vibration motor on the Joystick. Must be in the range of 1. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| success | boolean | True if the vibration was successfully applied, false if not. |

### Variant 2

Disables vibration.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| success | boolean | True if the vibration was successfully disabled, false if not. |

### Variant 3

If the Joystick only has a single vibration motor, it will still work but it will use the largest value of the left and right parameters.

The Xbox 360 controller on Mac OS X only has support for vibration if a modified version of the Tattiebogle driver is used.

The very first call to this function may take more time than expected because SDL's Haptic / Force Feedback subsystem needs to be initialized.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| left | number |  | Strength of the left vibration motor on the Joystick. Must be in the range of 1. |
| right | number |  | Strength of the right vibration motor on the Joystick. Must be in the range of 1. |
| duration | number | -1 | The duration of the vibration in seconds. A negative value means infinite duration. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| success | boolean | True if the vibration was successfully applied, false if not. |

## Enums

## GamepadAxis

Virtual gamepad axes.

**Constants:**

| Name | Description |
| --- | --- |
| `leftx` | The x-axis of the left thumbstick. |
| `lefty` | The y-axis of the left thumbstick. |
| `rightx` | The x-axis of the right thumbstick. |
| `righty` | The y-axis of the right thumbstick. |
| `triggerleft` | Left analog trigger. |
| `triggerright` | Right analog trigger. |

## GamepadButton

Virtual gamepad buttons.

**Constants:**

| Name | Description |
| --- | --- |
| `a` | Bottom face button (A). |
| `b` | Right face button (B). |
| `x` | Left face button (X). |
| `y` | Top face button (Y). |
| `back` | Back button. |
| `guide` | Guide button. |
| `start` | Start button. |
| `leftstick` | Left stick click button. |
| `rightstick` | Right stick click button. |
| `leftshoulder` | Left bumper. |
| `rightshoulder` | Right bumper. |
| `dpup` | D-pad up. |
| `dpdown` | D-pad down. |
| `dpleft` | D-pad left. |
| `dpright` | D-pad right. |

## JoystickHat

Joystick hat positions.

**Constants:**

| Name | Description |
| --- | --- |
| `c` | Centered |
| `d` | Down |
| `l` | Left |
| `ld` | Left+Down |
| `lu` | Left+Up |
| `r` | Right |
| `rd` | Right+Down |
| `ru` | Right+Up |
| `u` | Up |

## JoystickInputType

Types of Joystick inputs.

**Constants:**

| Name | Description |
| --- | --- |
| `axis` | Analog axis. |
| `button` | Button. |
| `hat` | 8-direction hat value. |

