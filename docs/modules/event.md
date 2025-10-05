# love.event

Manages events, like keypresses.

## Contents

**Functions:**

- [clear](#loveeventclear)
- [poll](#loveeventpoll)
- [pump](#loveeventpump)
- [push](#loveeventpush)
- [quit](#loveeventquit)
- [wait](#loveeventwait)

**Enums:**

- [Event](#event)

---

## Functions

## love.event.clear

Clears the event queue.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

## love.event.poll

Returns an iterator for messages in the event queue.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| i | function | Iterator function usable in a for loop. |

## love.event.pump

Pump events into the event queue.

This is a low-level function, and is usually not called by the user, but by love.run.

Note that this does need to be called for any OS to think you're still running,

and if you want to handle OS-generated events at all (think callbacks).

**Arguments:**

*No arguments*

**Returns:**

*No return values*

## love.event.push

Adds an event to the event queue.

From 0.10.0 onwards, you may pass an arbitrary amount of arguments with this function, though the default callbacks don't ever use more than six.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| n | [Event](#event) |  | The name of the event. |
| a | Variant | nil | First event argument. |
| b | Variant | nil | Second event argument. |
| c | Variant | nil | Third event argument. |
| d | Variant | nil | Fourth event argument. |
| e | Variant | nil | Fifth event argument. |
| f | Variant | nil | Sixth event argument. |
| ... | Variant | nil | Further event arguments may follow. |

**Returns:**

*No return values*

## love.event.quit

Adds the quit event to the queue.

The quit event is a signal for the event handler to close LÖVE. It's possible to abort the exit process with the love.quit callback.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| exitstatus | number | 0 | The program exit status to use when closing the application. |

**Returns:**

*No return values*

### Variant 2

Restarts the game without relaunching the executable. This cleanly shuts down the main Lua state instance and creates a brand new one.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| 'restart' | string |  | Tells the default love.run to exit and restart the game without relaunching the executable. |

**Returns:**

*No return values*

## love.event.wait

Like love.event.poll(), but blocks until there is an event in the queue.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| n | [Event](#event) | The name of event. |
| a | Variant | First event argument. |
| b | Variant | Second event argument. |
| c | Variant | Third event argument. |
| d | Variant | Fourth event argument. |
| e | Variant | Fifth event argument. |
| f | Variant | Sixth event argument. |
| ... | Variant | Further event arguments may follow. |

## Enums

## Event

Arguments to love.event.push() and the like.

Since 0.8.0, event names are no longer abbreviated.

**Constants:**

| Name | Description |
| --- | --- |
| `focus` | Window focus gained or lost |
| `joystickpressed` | Joystick pressed |
| `joystickreleased` | Joystick released |
| `keypressed` | Key pressed |
| `keyreleased` | Key released |
| `mousepressed` | Mouse pressed |
| `mousereleased` | Mouse released |
| `quit` | Quit |
| `resize` | Window size changed by the user |
| `visible` | Window is minimized or un-minimized by the user |
| `mousefocus` | Window mouse focus gained or lost |
| `threaderror` | A Lua error has occurred in a thread |
| `joystickadded` | Joystick connected |
| `joystickremoved` | Joystick disconnected |
| `joystickaxis` | Joystick axis motion |
| `joystickhat` | Joystick hat pressed |
| `gamepadpressed` | Joystick's virtual gamepad button pressed |
| `gamepadreleased` | Joystick's virtual gamepad button released |
| `gamepadaxis` | Joystick's virtual gamepad axis moved |
| `textinput` | User entered text |
| `mousemoved` | Mouse position changed |
| `lowmemory` | Running out of memory on mobile devices system |
| `textedited` | Candidate text for an IME changed |
| `wheelmoved` | Mouse wheel moved |
| `touchpressed` | Touch screen touched |
| `touchreleased` | Touch screen stop touching |
| `touchmoved` | Touch press moved inside touch screen |
| `directorydropped` | Directory is dragged and dropped onto the window |
| `filedropped` | File is dragged and dropped onto the window. |
| `jp` | Joystick pressed |
| `jr` | Joystick released |
| `kp` | Key pressed |
| `kr` | Key released |
| `mp` | Mouse pressed |
| `mr` | Mouse released |
| `q` | Quit |
| `f` | Window focus gained or lost |

