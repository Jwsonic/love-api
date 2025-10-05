# love.timer

Provides an interface to the user's clock.

## Contents

**Functions:**

- [getAverageDelta](#lovetimergetaveragedelta)
- [getDelta](#lovetimergetdelta)
- [getFPS](#lovetimergetfps)
- [getTime](#lovetimergettime)
- [sleep](#lovetimersleep)
- [step](#lovetimerstep)

---

## Functions

## love.timer.getAverageDelta

Returns the average delta time (seconds per frame) over the last second.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| delta | number | The average delta time over the last second. |

## love.timer.getDelta

Returns the time between the last two frames.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| dt | number | The time passed (in seconds). |

## love.timer.getFPS

Returns the current frames per second.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| fps | number | The current FPS. |

## love.timer.getTime

Returns the value of a timer with an unspecified starting time.

This function should only be used to calculate differences between points in time, as the starting time of the timer is unknown.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| time | number | The time in seconds. Given as a decimal, accurate to the microsecond. |

## love.timer.sleep

Pauses the current thread for the specified amount of time.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| s | number |  | Seconds to sleep for. |

**Returns:**

*No return values*

## love.timer.step

Measures the time between two frames.

Calling this changes the return value of love.timer.getDelta.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| dt | number | The time passed (in seconds). |

