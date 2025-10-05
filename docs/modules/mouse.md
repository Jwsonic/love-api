# love.mouse

Provides an interface to the user's mouse.

## Contents

**Functions:**

- [getCursor](#lovemousegetcursor)
- [getPosition](#lovemousegetposition)
- [getRelativeMode](#lovemousegetrelativemode)
- [getSystemCursor](#lovemousegetsystemcursor)
- [getX](#lovemousegetx)
- [getY](#lovemousegety)
- [isCursorSupported](#lovemouseiscursorsupported)
- [isDown](#lovemouseisdown)
- [isGrabbed](#lovemouseisgrabbed)
- [isVisible](#lovemouseisvisible)
- [newCursor](#lovemousenewcursor)
- [setCursor](#lovemousesetcursor)
- [setGrabbed](#lovemousesetgrabbed)
- [setPosition](#lovemousesetposition)
- [setRelativeMode](#lovemousesetrelativemode)
- [setVisible](#lovemousesetvisible)
- [setX](#lovemousesetx)
- [setY](#lovemousesety)

**Types:**

- [Cursor](#cursor)

**Enums:**

- [CursorType](#cursortype)

---

## Functions

## love.mouse.getCursor

Gets the current Cursor.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| cursor | [Cursor](#cursor) | The current cursor, or nil if no cursor is set. |

## love.mouse.getPosition

Returns the current position of the mouse.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| x | number | The position of the mouse along the x-axis. |
| y | number | The position of the mouse along the y-axis. |

## love.mouse.getRelativeMode

Gets whether relative mode is enabled for the mouse.

If relative mode is enabled, the cursor is hidden and doesn't move when the mouse does, but relative mouse motion events are still generated via love.mousemoved. This lets the mouse move in any direction indefinitely without the cursor getting stuck at the edges of the screen.

The reported position of the mouse is not updated while relative mode is enabled, even when relative mouse motion events are generated.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| enabled | boolean | True if relative mode is enabled, false if it's disabled. |

## love.mouse.getSystemCursor

Gets a Cursor object representing a system-native hardware cursor.

Hardware cursors are framerate-independent and work the same way as normal operating system cursors. Unlike drawing an image at the mouse's current coordinates, hardware cursors never have visible lag between when the mouse is moved and when the cursor position updates, even at low framerates.

The 'image' CursorType is not a valid argument. Use love.mouse.newCursor to create a hardware cursor using a custom image.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| ctype | [CursorType](#cursortype) |  | The type of system cursor to get.  |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| cursor | [Cursor](#cursor) | The Cursor object representing the system cursor type. |

## love.mouse.getX

Returns the current x-position of the mouse.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| x | number | The position of the mouse along the x-axis. |

## love.mouse.getY

Returns the current y-position of the mouse.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| y | number | The position of the mouse along the y-axis. |

## love.mouse.isCursorSupported

Gets whether cursor functionality is supported.

If it isn't supported, calling love.mouse.newCursor and love.mouse.getSystemCursor will cause an error. Mobile devices do not support cursors.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| supported | boolean | Whether the system has cursor functionality. |

## love.mouse.isDown

Checks whether a certain mouse button is down.

This function does not detect mouse wheel scrolling; you must use the love.wheelmoved (or love.mousepressed in version 0.9.2 and older) callback for that. 

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| button | number |  | The index of a button to check. 1 is the primary mouse button, 2 is the secondary mouse button and 3 is the middle button. Further buttons are mouse dependant. |
| ... | number |  | Additional button numbers to check. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| down | boolean | True if any specified button is down. |

## love.mouse.isGrabbed

Checks if the mouse is grabbed.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| grabbed | boolean | True if the cursor is grabbed, false if it is not. |

## love.mouse.isVisible

Checks if the cursor is visible.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| visible | boolean | True if the cursor to visible, false if the cursor is hidden. |

## love.mouse.newCursor

Creates a new hardware Cursor object from an image file or ImageData.

Hardware cursors are framerate-independent and work the same way as normal operating system cursors. Unlike drawing an image at the mouse's current coordinates, hardware cursors never have visible lag between when the mouse is moved and when the cursor position updates, even at low framerates.

The hot spot is the point the operating system uses to determine what was clicked and at what position the mouse cursor is. For example, the normal arrow pointer normally has its hot spot at the top left of the image, but a crosshair cursor might have it in the middle.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| imageData | ImageData |  | The ImageData to use for the new Cursor. |
| hotx | number | 0 | The x-coordinate in the ImageData of the cursor's hot spot. |
| hoty | number | 0 | The y-coordinate in the ImageData of the cursor's hot spot. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| cursor | [Cursor](#cursor) | The new Cursor object. |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| filename | string |  | Path to the image to use for the new Cursor. |
| hotx | number | 0 | The x-coordinate in the image of the cursor's hot spot. |
| hoty | number | 0 | The y-coordinate in the image of the cursor's hot spot. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| cursor | [Cursor](#cursor) | The new Cursor object. |

### Variant 3

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| fileData | FileData |  | Data representing the image to use for the new Cursor. |
| hotx | number | 0 | The x-coordinate in the image of the cursor's hot spot. |
| hoty | number | 0 | The y-coordinate in the image of the cursor's hot spot. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| cursor | [Cursor](#cursor) | The new Cursor object. |

## love.mouse.setCursor

Sets the current mouse cursor.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| cursor | [Cursor](#cursor) |  | The Cursor object to use as the current mouse cursor. |

**Returns:**

*No return values*

### Variant 2

Resets the current mouse cursor to the default.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

## love.mouse.setGrabbed

Grabs the mouse and confines it to the window.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| grab | boolean |  | True to confine the mouse, false to let it leave the window. |

**Returns:**

*No return values*

## love.mouse.setPosition

Sets the current position of the mouse. Non-integer values are floored.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | The new position of the mouse along the x-axis. |
| y | number |  | The new position of the mouse along the y-axis. |

**Returns:**

*No return values*

## love.mouse.setRelativeMode

Sets whether relative mode is enabled for the mouse.

When relative mode is enabled, the cursor is hidden and doesn't move when the mouse does, but relative mouse motion events are still generated via love.mousemoved. This lets the mouse move in any direction indefinitely without the cursor getting stuck at the edges of the screen.

The reported position of the mouse may not be updated while relative mode is enabled, even when relative mouse motion events are generated.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| enable | boolean |  | True to enable relative mode, false to disable it. |

**Returns:**

*No return values*

## love.mouse.setVisible

Sets the current visibility of the cursor.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| visible | boolean |  | True to set the cursor to visible, false to hide the cursor. |

**Returns:**

*No return values*

## love.mouse.setX

Sets the current X position of the mouse.

Non-integer values are floored.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | The new position of the mouse along the x-axis. |

**Returns:**

*No return values*

## love.mouse.setY

Sets the current Y position of the mouse.

Non-integer values are floored.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| y | number |  | The new position of the mouse along the y-axis. |

**Returns:**

*No return values*

## Types

## Cursor

Represents a hardware cursor.

**Constructors:** [getCursor](#lovemousegetcursor), [newCursor](#lovemousenewcursor), [getSystemCursor](#lovemousegetsystemcursor)

**Supertypes:** Object

### Methods

#### Cursor:getType

Gets the type of the Cursor.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| ctype | [CursorType](#cursortype) | The type of the Cursor. |

## Enums

## CursorType

Types of hardware cursors.

**Constants:**

| Name | Description |
| --- | --- |
| `image` | The cursor is using a custom image. |
| `arrow` | An arrow pointer. |
| `ibeam` | An I-beam, normally used when mousing over editable or selectable text. |
| `wait` | Wait graphic. |
| `waitarrow` | Small wait cursor with an arrow pointer. |
| `crosshair` | Crosshair symbol. |
| `sizenwse` | Double arrow pointing to the top-left and bottom-right. |
| `sizenesw` | Double arrow pointing to the top-right and bottom-left. |
| `sizewe` | Double arrow pointing left and right. |
| `sizens` | Double arrow pointing up and down. |
| `sizeall` | Four-pointed arrow pointing up, down, left, and right. |
| `no` | Slashed circle or crossbones. |
| `hand` | Hand symbol. |

