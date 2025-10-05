# love.video

This module is responsible for decoding, controlling, and streaming video files.

It can't draw the videos, see love.graphics.newVideo and Video objects for that.

## Contents

**Functions:**

- [newVideoStream](#lovevideonewvideostream)

**Types:**

- [VideoStream](#videostream)

---

## Functions

## love.video.newVideoStream

Creates a new VideoStream. Currently only Ogg Theora video files are supported. VideoStreams can't draw videos, see love.graphics.newVideo for that.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| filename | string |  | The file path to the Ogg Theora video file. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| videostream | [VideoStream](#videostream) | A new VideoStream. |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| file | File |  | The File object containing the Ogg Theora video. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| videostream | [VideoStream](#videostream) | A new VideoStream. |

## Types

## VideoStream

An object which decodes, streams, and controls Videos.

**Constructors:** [newVideoStream](#lovevideonewvideostream)

**Supertypes:** Object

### Methods

#### VideoStream:getFilename

Gets the filename of the VideoStream.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| filename | string | The filename of the VideoStream |

#### VideoStream:isPlaying

Gets whether the VideoStream is playing.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| playing | boolean | Whether the VideoStream is playing. |

#### VideoStream:pause

Pauses the VideoStream.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

#### VideoStream:play

Plays the VideoStream.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

#### VideoStream:rewind

Rewinds the VideoStream. Synonym to VideoStream:seek(0).

**Arguments:**

*No arguments*

**Returns:**

*No return values*

#### VideoStream:seek

Sets the current playback position of the VideoStream.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| offset | number |  | The time in seconds since the beginning of the VideoStream. |

**Returns:**

*No return values*

#### VideoStream:tell

Gets the current playback position of the VideoStream.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| seconds | number | The number of seconds sionce the beginning of the VideoStream. |

