# love.sound

This module is responsible for decoding sound files. It can't play the sounds, see love.audio for that.

## Contents

**Functions:**

- [newDecoder](#lovesoundnewdecoder)
- [newSoundData](#lovesoundnewsounddata)

**Types:**

- [Decoder](#decoder)
- [SoundData](#sounddata)

---

## Functions

## love.sound.newDecoder

Attempts to find a decoder for the encoded sound data in the specified file.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| file | File |  | The file with encoded sound data. |
| buffer | number | 2048 | The size of each decoded chunk, in bytes. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| decoder | [Decoder](#decoder) | A new Decoder object. |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| filename | string |  | The filename of the file with encoded sound data. |
| buffer | number | 2048 | The size of each decoded chunk, in bytes. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| decoder | [Decoder](#decoder) | A new Decoder object. |

## love.sound.newSoundData

Creates new SoundData from a filepath, File, or Decoder. It's also possible to create SoundData with a custom sample rate, channel and bit depth.

The sound data will be decoded to the memory in a raw format. It is recommended to create only short sounds like effects, as a 3 minute song uses 30 MB of memory this way.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| filename | string |  | The file name of the file to load. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| soundData | [SoundData](#sounddata) | A new SoundData object. |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| file | File |  | A File pointing to an audio file. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| soundData | [SoundData](#sounddata) | A new SoundData object. |

### Variant 3

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| decoder | [Decoder](#decoder) |  | Decode data from this Decoder until EOF. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| soundData | [SoundData](#sounddata) | A new SoundData object. |

### Variant 4

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| samples | number |  | Total number of samples. |
| rate | number | 44100 | Number of samples per second |
| bits | number | 16 | Bits per sample (8 or 16). |
| channels | number | 2 | Either 1 for mono or 2 for stereo. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| soundData | [SoundData](#sounddata) | A new SoundData object. |

## Types

## Decoder

An object which can gradually decode a sound file.

**Constructors:** [newDecoder](#lovesoundnewdecoder)

**Supertypes:** Object

### Methods

#### Decoder:clone

Creates a new copy of current decoder.

The new decoder will start decoding from the beginning of the audio stream.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| decoder | [Decoder](#decoder) | New copy of the decoder. |

#### Decoder:decode

Decodes the audio and returns a SoundData object containing the decoded audio data.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| soundData | [SoundData](#sounddata) | Decoded audio data. |

#### Decoder:getBitDepth

Returns the number of bits per sample.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| bitDepth | number | Either 8, or 16. |

#### Decoder:getChannelCount

Returns the number of channels in the stream.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| channels | number | 1 for mono, 2 for stereo. |

#### Decoder:getDuration

Gets the duration of the sound file. It may not always be sample-accurate, and it may return -1 if the duration cannot be determined at all.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| duration | number | The duration of the sound file in seconds, or -1 if it cannot be determined. |

#### Decoder:getSampleRate

Returns the sample rate of the Decoder.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| rate | number | Number of samples per second. |

#### Decoder:seek

Sets the currently playing position of the Decoder.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| offset | number |  | The position to seek to, in seconds. |

**Returns:**

*No return values*

## SoundData

Contains raw audio samples.

You can not play SoundData back directly. You must wrap a Source object around it.

**Constructors:** [newSoundData](#lovesoundnewsounddata)

**Supertypes:** Data, Object

### Methods

#### SoundData:getBitDepth

Returns the number of bits per sample.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| bitdepth | number | Either 8, or 16. |

#### SoundData:getChannelCount

Returns the number of channels in the SoundData.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| channels | number | 1 for mono, 2 for stereo. |

#### SoundData:getDuration

Gets the duration of the sound data.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| duration | number | The duration of the sound data in seconds. |

#### SoundData:getSample

Gets the value of the sample-point at the specified position. For stereo SoundData objects, the data from the left and right channels are interleaved in that order.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| i | number |  | An integer value specifying the position of the sample (starting at 0). |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| sample | number | The normalized samplepoint (range -1.0 to 1.0). |

### Variant 2

Gets the value of a sample using an explicit sample index instead of interleaving them in the sample position parameter.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| i | number |  | An integer value specifying the position of the sample (starting at 0). |
| channel | number |  | The index of the channel to get within the given sample. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| sample | number | The normalized samplepoint (range -1.0 to 1.0). |

#### SoundData:getSampleCount

Returns the number of samples per channel of the SoundData.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| count | number | Total number of samples. |

#### SoundData:getSampleRate

Returns the sample rate of the SoundData.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| rate | number | Number of samples per second. |

#### SoundData:setSample

Sets the value of the sample-point at the specified position. For stereo SoundData objects, the data from the left and right channels are interleaved in that order.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| i | number |  | An integer value specifying the position of the sample (starting at 0). |
| sample | number |  | The normalized samplepoint (range -1.0 to 1.0). |

**Returns:**

*No return values*

### Variant 2

Sets the value of a sample using an explicit sample index instead of interleaving them in the sample position parameter.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| i | number |  | An integer value specifying the position of the sample (starting at 0). |
| channel | number |  | The index of the channel to set within the given sample. |
| sample | number |  | The normalized samplepoint (range -1.0 to 1.0). |

**Returns:**

*No return values*

