# love.system

Provides access to information about the user's system.

## Contents

**Functions:**

- [getClipboardText](#lovesystemgetclipboardtext)
- [getOS](#lovesystemgetos)
- [getPowerInfo](#lovesystemgetpowerinfo)
- [getProcessorCount](#lovesystemgetprocessorcount)
- [hasBackgroundMusic](#lovesystemhasbackgroundmusic)
- [openURL](#lovesystemopenurl)
- [setClipboardText](#lovesystemsetclipboardtext)
- [vibrate](#lovesystemvibrate)

**Enums:**

- [PowerState](#powerstate)

---

## Functions

## love.system.getClipboardText

Gets text from the clipboard.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| text | string | The text currently held in the system's clipboard. |

## love.system.getOS

Gets the current operating system. In general, LÖVE abstracts away the need to know the current operating system, but there are a few cases where it can be useful (especially in combination with os.execute.)

In LÖVE version 0.8.0, the '''love._os''' string contains the current operating system.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| osString | string | The current operating system. 'OS X', 'Windows', 'Linux', 'Android' or 'iOS'. |

## love.system.getPowerInfo

Gets information about the system's power supply.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| state | [PowerState](#powerstate) | The basic state of the power supply. |
| percent | number | Percentage of battery life left, between 0 and 100. nil if the value can't be determined or there's no battery. |
| seconds | number | Seconds of battery life left. nil if the value can't be determined or there's no battery. |

## love.system.getProcessorCount

Gets the amount of logical processor in the system.

The number includes the threads reported if technologies such as Intel's Hyper-threading are enabled. For example, on a 4-core CPU with Hyper-threading, this function will return 8.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| processorCount | number | Amount of logical processors. |

## love.system.hasBackgroundMusic

Gets whether another application on the system is playing music in the background.

Currently this is implemented on iOS and Android, and will always return false on other operating systems. The t.audio.mixwithsystem flag in love.conf can be used to configure whether background audio / music from other apps should play while LÖVE is open.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| backgroundmusic | boolean | True if the user is playing music in the background via another app, false otherwise. |

## love.system.openURL

Opens a URL with the user's web or file browser.

Passing file:// scheme in Android 7.0 (Nougat) and later always result in failure. Prior to 11.2, this will crash LÖVE instead of returning false.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| url | string |  | The URL to open. Must be formatted as a proper URL. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| success | boolean | Whether the URL was opened successfully. |

## love.system.setClipboardText

Puts text in the clipboard.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| text | string |  | The new text to hold in the system's clipboard. |

**Returns:**

*No return values*

## love.system.vibrate

Causes the device to vibrate, if possible. Currently this will only work on Android and iOS devices that have a built-in vibration motor.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| seconds | number | 0.5 | The duration to vibrate for. If called on an iOS device, it will always vibrate for 0.5 seconds due to limitations in the iOS system APIs. |

**Returns:**

*No return values*

## Enums

## PowerState

The basic state of the system's power supply.

**Constants:**

| Name | Description |
| --- | --- |
| `unknown` | Cannot determine power status. |
| `battery` | Not plugged in, running on a battery. |
| `nobattery` | Plugged in, no battery available. |
| `charging` | Plugged in, charging battery. |
| `charged` | Plugged in, battery is fully charged. |

