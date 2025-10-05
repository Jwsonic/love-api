# love.audio

Provides an interface to create noise with the user's speakers.

## Contents

**Functions:**

- [getActiveEffects](#loveaudiogetactiveeffects)
- [getActiveSourceCount](#loveaudiogetactivesourcecount)
- [getDistanceModel](#loveaudiogetdistancemodel)
- [getDopplerScale](#loveaudiogetdopplerscale)
- [getEffect](#loveaudiogeteffect)
- [getMaxSceneEffects](#loveaudiogetmaxsceneeffects)
- [getMaxSourceEffects](#loveaudiogetmaxsourceeffects)
- [getOrientation](#loveaudiogetorientation)
- [getPosition](#loveaudiogetposition)
- [getRecordingDevices](#loveaudiogetrecordingdevices)
- [getVelocity](#loveaudiogetvelocity)
- [getVolume](#loveaudiogetvolume)
- [isEffectsSupported](#loveaudioiseffectssupported)
- [newQueueableSource](#loveaudionewqueueablesource)
- [newSource](#loveaudionewsource)
- [pause](#loveaudiopause)
- [play](#loveaudioplay)
- [setDistanceModel](#loveaudiosetdistancemodel)
- [setDopplerScale](#loveaudiosetdopplerscale)
- [setEffect](#loveaudioseteffect)
- [setMixWithSystem](#loveaudiosetmixwithsystem)
- [setOrientation](#loveaudiosetorientation)
- [setPosition](#loveaudiosetposition)
- [setVelocity](#loveaudiosetvelocity)
- [setVolume](#loveaudiosetvolume)
- [stop](#loveaudiostop)

**Types:**

- [RecordingDevice](#recordingdevice)
- [Source](#source)

**Enums:**

- [DistanceModel](#distancemodel)
- [EffectType](#effecttype)
- [EffectWaveform](#effectwaveform)
- [FilterType](#filtertype)
- [SourceType](#sourcetype)
- [TimeUnit](#timeunit)

---

## Functions

## love.audio.getActiveEffects

Gets a list of the names of the currently enabled effects.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| effects | table | The list of the names of the currently enabled effects. |

## love.audio.getActiveSourceCount

Gets the current number of simultaneously playing sources.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| count | number | The current number of simultaneously playing sources. |

## love.audio.getDistanceModel

Returns the distance attenuation model.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| model | [DistanceModel](#distancemodel) | The current distance model. The default is 'inverseclamped'. |

## love.audio.getDopplerScale

Gets the current global scale factor for velocity-based doppler effects.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| scale | number | The current doppler scale factor. |

## love.audio.getEffect

Gets the settings associated with an effect.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| name | string |  | The name of the effect. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| settings | table | The settings associated with the effect. |

## love.audio.getMaxSceneEffects

Gets the maximum number of active effects supported by the system.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| maximum | number | The maximum number of active effects. |

## love.audio.getMaxSourceEffects

Gets the maximum number of active Effects in a single Source object, that the system can support.

This function return 0 for system that doesn't support audio effects.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| maximum | number | The maximum number of active Effects per Source. |

## love.audio.getOrientation

Returns the orientation of the listener.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| fx | number | Forward x of the listener orientation. |
| fy | number | Forward y of the listener orientation. |
| fz | number | Forward z of the listener orientation. |
| ux | number | Up x of the listener orientation. |
| uy | number | Up y of the listener orientation. |
| uz | number | Up z of the listener orientation. |

## love.audio.getPosition

Returns the position of the listener. Please note that positional audio only works for mono (i.e. non-stereo) sources.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| x | number | The X position of the listener. |
| y | number | The Y position of the listener. |
| z | number | The Z position of the listener. |

## love.audio.getRecordingDevices

Gets a list of RecordingDevices on the system.

The first device in the list is the user's default recording device. The list may be empty if there are no microphones connected to the system.

Audio recording is currently not supported on iOS.

Audio recording for Android is supported since 11.3. However, it's not supported when APK from Play Store is used.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| devices | table | The list of connected recording devices. |

## love.audio.getVelocity

Returns the velocity of the listener.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| x | number | The X velocity of the listener. |
| y | number | The Y velocity of the listener. |
| z | number | The Z velocity of the listener. |

## love.audio.getVolume

Returns the master volume.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| volume | number | The current master volume |

## love.audio.isEffectsSupported

Gets whether audio effects are supported in the system.

Older Linux distributions that ship with older OpenAL library may not support audio effects. Furthermore, iOS doesn't

support audio effects at all.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| supported | boolean | True if effects are supported, false otherwise. |

## love.audio.newQueueableSource

Creates a new Source usable for real-time generated sound playback with Source:queue.

The sample rate, bit depth, and channel count of any SoundData used with Source:queue must match the parameters given to this constructor.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| samplerate | number |  | Number of samples per second when playing. |
| bitdepth | number |  | Bits per sample (8 or 16). |
| channels | number |  | 1 for mono or 2 for stereo. |
| buffercount | number | 0 | The number of buffers that can be queued up at any given time with Source:queue. Cannot be greater than 64. A sensible default (~8) is chosen if no value is specified. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| source | [Source](#source) | The new Source usable with Source:queue. |

## love.audio.newSource

Creates a new Source from a filepath, File, Decoder or SoundData.

Sources created from SoundData are always static.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| filename | string |  | The filepath to the audio file. |
| type | [SourceType](#sourcetype) |  | Streaming or static source. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| source | [Source](#source) | A new Source that can play the specified audio. |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| file | File |  | A File pointing to an audio file. |
| type | [SourceType](#sourcetype) |  | Streaming or static source. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| source | [Source](#source) | A new Source that can play the specified audio. |

### Variant 3

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| decoder | Decoder |  | The Decoder to create a Source from. |
| type | [SourceType](#sourcetype) |  | Streaming or static source. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| source | [Source](#source) | A new Source that can play the specified audio. |

### Variant 4

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| data | FileData |  | The FileData to create a Source from. |
| type | [SourceType](#sourcetype) |  | Streaming or static source. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| source | [Source](#source) | A new Source that can play the specified audio. |

### Variant 5

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| data | SoundData |  | The SoundData to create a Source from. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| source | [Source](#source) | A new Source that can play the specified audio. The SourceType of the returned audio is 'static'. |

## love.audio.pause

Pauses specific or all currently played Sources.

### Variant 1

Pauses all currently active Sources and returns them.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| Sources | table | A table containing a list of Sources that were paused by this call. |

### Variant 2

Pauses the given Sources.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| source | [Source](#source) |  | The first Source to pause. |
| ... | [Source](#source) |  | Additional Sources to pause. |

**Returns:**

*No return values*

### Variant 3

Pauses the given Sources.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| sources | table |  | A table containing a list of Sources to pause. |

**Returns:**

*No return values*

## love.audio.play

Plays the specified Source.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| source | [Source](#source) |  | The Source to play. |

**Returns:**

*No return values*

### Variant 2

Starts playing multiple Sources simultaneously.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| sources | table |  | Table containing a list of Sources to play. |

**Returns:**

*No return values*

### Variant 3

Starts playing multiple Sources simultaneously.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| source1 | [Source](#source) |  | The first Source to play. |
| source2 | [Source](#source) |  | The second Source to play. |
| ... | [Source](#source) |  | Additional Sources to play. |

**Returns:**

*No return values*

## love.audio.setDistanceModel

Sets the distance attenuation model.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| model | [DistanceModel](#distancemodel) |  | The new distance model. |

**Returns:**

*No return values*

## love.audio.setDopplerScale

Sets a global scale factor for velocity-based doppler effects. The default scale value is 1.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| scale | number |  | The new doppler scale factor. The scale must be greater than 0. |

**Returns:**

*No return values*

## love.audio.setEffect

Defines an effect that can be applied to a Source.

Not all system supports audio effects. Use love.audio.isEffectsSupported to check.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| name | string |  | The name of the effect. |
| settings | table |  | The settings to use for this effect, with the following fields: (see table fields below) |

**settings table fields:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| type | [EffectType](#effecttype) |  | The type of effect to use. |
| volume | number |  | The volume of the effect. |
| ... | number |  | Effect-specific settings. See EffectType for available effects and their corresponding settings. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| success | boolean | Whether the effect was successfully created. |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| name | string |  | The name of the effect. |
| enabled | boolean | true | If false and the given effect name was previously set, disables the effect. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| success | boolean | Whether the effect was successfully disabled. |

## love.audio.setMixWithSystem

Sets whether the system should mix the audio with the system's audio.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| mix | boolean |  | True to enable mixing, false to disable it. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| success | boolean | True if the change succeeded, false otherwise. |

## love.audio.setOrientation

Sets the orientation of the listener.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| fx, fy, fz | number |  | Forward vector of the listener orientation. |
| ux, uy, uz | number |  | Up vector of the listener orientation. |

**Returns:**

*No return values*

## love.audio.setPosition

Sets the position of the listener, which determines how sounds play.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | The x position of the listener. |
| y | number |  | The y position of the listener. |
| z | number |  | The z position of the listener. |

**Returns:**

*No return values*

## love.audio.setVelocity

Sets the velocity of the listener.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | The X velocity of the listener. |
| y | number |  | The Y velocity of the listener. |
| z | number |  | The Z velocity of the listener. |

**Returns:**

*No return values*

## love.audio.setVolume

Sets the master volume.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| volume | number |  | 1.0 is max and 0.0 is off. |

**Returns:**

*No return values*

## love.audio.stop

Stops currently played sources.

### Variant 1

This function will stop all currently active sources.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

### Variant 2

This function will only stop the specified source.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| source | [Source](#source) |  | The source on which to stop the playback. |

**Returns:**

*No return values*

### Variant 3

Simultaneously stops all given Sources.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| source1 | [Source](#source) |  | The first Source to stop. |
| source2 | [Source](#source) |  | The second Source to stop. |
| ... | [Source](#source) |  | Additional Sources to stop. |

**Returns:**

*No return values*

### Variant 4

Simultaneously stops all given Sources.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| sources | table |  | A table containing a list of Sources to stop. |

**Returns:**

*No return values*

## Types

## RecordingDevice

Represents an audio input device capable of recording sounds.

**Supertypes:** Object

### Methods

#### RecordingDevice:getBitDepth

Gets the number of bits per sample in the data currently being recorded.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| bits | number | The number of bits per sample in the data that's currently being recorded. |

#### RecordingDevice:getChannelCount

Gets the number of channels currently being recorded (mono or stereo).

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| channels | number | The number of channels being recorded (1 for mono, 2 for stereo). |

#### RecordingDevice:getData

Gets all recorded audio SoundData stored in the device's internal ring buffer.

The internal ring buffer is cleared when this function is called, so calling it again will only get audio recorded after the previous call. If the device's internal ring buffer completely fills up before getData is called, the oldest data that doesn't fit into the buffer will be lost.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| data | SoundData | The recorded audio data, or nil if the device isn't recording. |

#### RecordingDevice:getName

Gets the name of the recording device.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| name | string | The name of the device. |

#### RecordingDevice:getSampleCount

Gets the number of currently recorded samples.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| samples | number | The number of samples that have been recorded so far. |

#### RecordingDevice:getSampleRate

Gets the number of samples per second currently being recorded.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| rate | number | The number of samples being recorded per second (sample rate). |

#### RecordingDevice:isRecording

Gets whether the device is currently recording.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| recording | boolean | True if the recording, false otherwise. |

#### RecordingDevice:start

Begins recording audio using this device.

A ring buffer is used internally to store recorded data before RecordingDevice:getData or RecordingDevice:stop are called – the former clears the buffer. If the buffer completely fills up before getData or stop are called, the oldest data that doesn't fit into the buffer will be lost.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| samplecount | number |  | The maximum number of samples to store in an internal ring buffer when recording. RecordingDevice:getData clears the internal buffer when called. |
| samplerate | number | 8000 | The number of samples per second to store when recording. |
| bitdepth | number | 16 | The number of bits per sample. |
| channels | number | 1 | Whether to record in mono or stereo. Most microphones don't support more than 1 channel. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| success | boolean | True if the device successfully began recording using the specified parameters, false if not. |

#### RecordingDevice:stop

Stops recording audio from this device. Any sound data currently in the device's buffer will be returned.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| data | SoundData | The sound data currently in the device's buffer, or nil if the device wasn't recording. |

## Source

A Source represents audio you can play back.

You can do interesting things with Sources, like set the volume, pitch, and its position relative to the listener. Please note that positional audio only works for mono (i.e. non-stereo) sources.

The Source controls (play/pause/stop) act according to the following state table.

**Constructors:** [newQueueableSource](#loveaudionewqueueablesource), [newSource](#loveaudionewsource)

**Supertypes:** Object

### Methods

#### Source:clone

Creates an identical copy of the Source in the stopped state.

Static Sources will use significantly less memory and take much less time to be created if Source:clone is used to create them instead of love.audio.newSource, so this method should be preferred when making multiple Sources which play the same sound.

Cloned Sources inherit all the set-able state of the original Source, but they are initialized stopped.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| source | [Source](#source) | The new identical copy of this Source. |

#### Source:getActiveEffects

Gets a list of the Source's active effect names.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| effects | table | A list of the source's active effect names. |

#### Source:getAirAbsorption

Gets the amount of air absorption applied to the Source.

By default the value is set to 0 which means that air absorption effects are disabled. A value of 1 will apply high frequency attenuation to the Source at a rate of 0.05 dB per meter.

Audio air absorption functionality is not supported on iOS.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| amount | number | The amount of air absorption applied to the Source. |

#### Source:getAttenuationDistances

Gets the reference and maximum attenuation distances of the Source. The values, combined with the current DistanceModel, affect how the Source's volume attenuates based on distance from the listener.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| ref | number | The current reference attenuation distance. If the current DistanceModel is clamped, this is the minimum distance before the Source is no longer attenuated. |
| max | number | The current maximum attenuation distance. |

#### Source:getChannelCount

Gets the number of channels in the Source. Only 1-channel (mono) Sources can use directional and positional effects.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| channels | number | 1 for mono, 2 for stereo. |

#### Source:getCone

Gets the Source's directional volume cones. Together with Source:setDirection, the cone angles allow for the Source's volume to vary depending on its direction.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| innerAngle | number | The inner angle from the Source's direction, in radians. The Source will play at normal volume if the listener is inside the cone defined by this angle. |
| outerAngle | number | The outer angle from the Source's direction, in radians. The Source will play at a volume between the normal and outer volumes, if the listener is in between the cones defined by the inner and outer angles. |
| outerVolume | number | The Source's volume when the listener is outside both the inner and outer cone angles. |

#### Source:getDirection

Gets the direction of the Source.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| x | number | The X part of the direction vector. |
| y | number | The Y part of the direction vector. |
| z | number | The Z part of the direction vector. |

#### Source:getDuration

Gets the duration of the Source. For streaming Sources it may not always be sample-accurate, and may return -1 if the duration cannot be determined at all.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| unit | [TimeUnit](#timeunit) | 'seconds' | The time unit for the return value. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| duration | number | The duration of the Source, or -1 if it cannot be determined. |

#### Source:getEffect

Gets the filter settings associated to a specific effect.

This function returns nil if the effect was applied with no filter settings associated to it.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| name | string |  | The name of the effect. |
| filtersettings | table | {} | An optional empty table that will be filled with the filter settings. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| filtersettings | table | The settings for the filter associated to this effect, or nil if the effect is not present in this Source or has no filter associated. The table has the following fields: (see table fields below) |

**filtersettings table fields:**

| Name | Type | Description |
| --- | --- | --- |
| volume | number | The overall volume of the audio. |
| highgain | number | Volume of high-frequency audio. Only applies to low-pass and band-pass filters. |
| lowgain | number | Volume of low-frequency audio. Only applies to high-pass and band-pass filters. |

#### Source:getFilter

Gets the filter settings currently applied to the Source.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| settings | table | The filter settings to use for this Source, or nil if the Source has no active filter. The table has the following fields: (see table fields below) |

**settings table fields:**

| Name | Type | Description |
| --- | --- | --- |
| type | [FilterType](#filtertype) | The type of filter to use. |
| volume | number | The overall volume of the audio. |
| highgain | number | Volume of high-frequency audio. Only applies to low-pass and band-pass filters. |
| lowgain | number | Volume of low-frequency audio. Only applies to high-pass and band-pass filters. |

#### Source:getFreeBufferCount

Gets the number of free buffer slots in a queueable Source. If the queueable Source is playing, this value will increase up to the amount the Source was created with. If the queueable Source is stopped, it will process all of its internal buffers first, in which case this function will always return the amount it was created with.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| buffers | number | How many more SoundData objects can be queued up. |

#### Source:getPitch

Gets the current pitch of the Source.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| pitch | number | The pitch, where 1.0 is normal. |

#### Source:getPosition

Gets the position of the Source.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| x | number | The X position of the Source. |
| y | number | The Y position of the Source. |
| z | number | The Z position of the Source. |

#### Source:getRolloff

Returns the rolloff factor of the source.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| rolloff | number | The rolloff factor. |

#### Source:getType

Gets the type of the Source.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| sourcetype | [SourceType](#sourcetype) | The type of the source. |

#### Source:getVelocity

Gets the velocity of the Source.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| x | number | The X part of the velocity vector. |
| y | number | The Y part of the velocity vector. |
| z | number | The Z part of the velocity vector. |

#### Source:getVolume

Gets the current volume of the Source.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| volume | number | The volume of the Source, where 1.0 is normal volume. |

#### Source:getVolumeLimits

Returns the volume limits of the source.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| min | number | The minimum volume. |
| max | number | The maximum volume. |

#### Source:isLooping

Returns whether the Source will loop.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| loop | boolean | True if the Source will loop, false otherwise. |

#### Source:isPlaying

Returns whether the Source is playing.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| playing | boolean | True if the Source is playing, false otherwise. |

#### Source:isRelative

Gets whether the Source's position, velocity, direction, and cone angles are relative to the listener.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| relative | boolean | True if the position, velocity, direction and cone angles are relative to the listener, false if they're absolute. |

#### Source:pause

Pauses the Source.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

#### Source:play

Starts playing the Source.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| success | boolean | Whether the Source was able to successfully start playing. |

#### Source:queue

Queues SoundData for playback in a queueable Source.

This method requires the Source to be created via love.audio.newQueueableSource.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| sounddata | SoundData |  | The data to queue. The SoundData's sample rate, bit depth, and channel count must match the Source's. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| success | boolean | True if the data was successfully queued for playback, false if there were no available buffers to use for queueing. |

#### Source:seek

Sets the currently playing position of the Source.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| offset | number |  | The position to seek to. |
| unit | [TimeUnit](#timeunit) | 'seconds' | The unit of the position value. |

**Returns:**

*No return values*

#### Source:setAirAbsorption

Sets the amount of air absorption applied to the Source.

By default the value is set to 0 which means that air absorption effects are disabled. A value of 1 will apply high frequency attenuation to the Source at a rate of 0.05 dB per meter.

Air absorption can simulate sound transmission through foggy air, dry air, smoky atmosphere, etc. It can be used to simulate different atmospheric conditions within different locations in an area.

Audio air absorption functionality is not supported on iOS.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| amount | number |  | The amount of air absorption applied to the Source. Must be between 0 and 10. |

**Returns:**

*No return values*

#### Source:setAttenuationDistances

Sets the reference and maximum attenuation distances of the Source. The parameters, combined with the current DistanceModel, affect how the Source's volume attenuates based on distance.

Distance attenuation is only applicable to Sources based on mono (rather than stereo) audio.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| ref | number |  | The new reference attenuation distance. If the current DistanceModel is clamped, this is the minimum attenuation distance. |
| max | number |  | The new maximum attenuation distance. |

**Returns:**

*No return values*

#### Source:setCone

Sets the Source's directional volume cones. Together with Source:setDirection, the cone angles allow for the Source's volume to vary depending on its direction.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| innerAngle | number |  | The inner angle from the Source's direction, in radians. The Source will play at normal volume if the listener is inside the cone defined by this angle. |
| outerAngle | number |  | The outer angle from the Source's direction, in radians. The Source will play at a volume between the normal and outer volumes, if the listener is in between the cones defined by the inner and outer angles. |
| outerVolume | number | 0 | The Source's volume when the listener is outside both the inner and outer cone angles. |

**Returns:**

*No return values*

#### Source:setDirection

Sets the direction vector of the Source. A zero vector makes the source non-directional.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | The X part of the direction vector. |
| y | number |  | The Y part of the direction vector. |
| z | number |  | The Z part of the direction vector. |

**Returns:**

*No return values*

#### Source:setEffect

Applies an audio effect to the Source.

The effect must have been previously defined using love.audio.setEffect.

### Variant 1

Applies the given previously defined effect to this Source.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| name | string |  | The name of the effect previously set up with love.audio.setEffect. |
| enable | boolean | true | If false and the given effect name was previously enabled on this Source, disables the effect. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| success | boolean | Whether the effect was successfully applied to this Source. |

### Variant 2

Applies the given previously defined effect to this Source, and applies a filter to the Source which affects the sound fed into the effect.

Audio effect functionality is not supported on iOS.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| name | string |  | The name of the effect previously set up with love.audio.setEffect. |
| filtersettings | table |  | The filter settings to apply prior to the effect, with the following fields: (see table fields below) |

**filtersettings table fields:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| type | [FilterType](#filtertype) |  | The type of filter to use. |
| volume | number |  | The overall volume of the audio. Must be between 0 and 1. |
| highgain | number |  | Volume of high-frequency audio. Only applies to low-pass and band-pass filters. Must be between 0 and 1. |
| lowgain | number |  | Volume of low-frequency audio. Only applies to high-pass and band-pass filters. Must be between 0 and 1. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| success | boolean | Whether the effect and filter were successfully applied to this Source. |

#### Source:setFilter

Sets a low-pass, high-pass, or band-pass filter to apply when playing the Source.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| settings | table |  | The filter settings to use for this Source, with the following fields: (see table fields below) |

**settings table fields:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| type | [FilterType](#filtertype) |  | The type of filter to use. |
| volume | number |  | The overall volume of the audio. Must be between 0 and 1. |
| highgain | number |  | Volume of high-frequency audio. Only applies to low-pass and band-pass filters. Must be between 0 and 1. |
| lowgain | number |  | Volume of low-frequency audio. Only applies to high-pass and band-pass filters. Must be between 0 and 1. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| success | boolean | Whether the filter was successfully applied to the Source. |

### Variant 2

Disables filtering on this Source.



**Arguments:**

*No arguments*

**Returns:**

*No return values*

#### Source:setLooping

Sets whether the Source should loop.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| loop | boolean |  | True if the source should loop, false otherwise. |

**Returns:**

*No return values*

#### Source:setPitch

Sets the pitch of the Source.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| pitch | number |  | Calculated with regard to 1 being the base pitch. Each reduction by 50 percent equals a pitch shift of -12 semitones (one octave reduction). Each doubling equals a pitch shift of 12 semitones (one octave increase). Zero is not a legal value. |

**Returns:**

*No return values*

#### Source:setPosition

Sets the position of the Source. Please note that this only works for mono (i.e. non-stereo) sound files!

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | The X position of the Source. |
| y | number |  | The Y position of the Source. |
| z | number |  | The Z position of the Source. |

**Returns:**

*No return values*

#### Source:setRelative

Sets whether the Source's position, velocity, direction, and cone angles are relative to the listener, or absolute.

By default, all sources are absolute and therefore relative to the origin of love's coordinate system 0, 0. Only absolute sources are affected by the position of the listener. Please note that positional audio only works for mono (i.e. non-stereo) sources. 

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| enable | boolean | false | True to make the position, velocity, direction and cone angles relative to the listener, false to make them absolute. |

**Returns:**

*No return values*

#### Source:setRolloff

Sets the rolloff factor which affects the strength of the used distance attenuation.

Extended information and detailed formulas can be found in the chapter '3.4. Attenuation By Distance' of OpenAL 1.1 specification.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| rolloff | number |  | The new rolloff factor. |

**Returns:**

*No return values*

#### Source:setVelocity

Sets the velocity of the Source.

This does '''not''' change the position of the Source, but lets the application know how it has to calculate the doppler effect.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | The X part of the velocity vector. |
| y | number |  | The Y part of the velocity vector. |
| z | number |  | The Z part of the velocity vector. |

**Returns:**

*No return values*

#### Source:setVolume

Sets the current volume of the Source.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| volume | number |  | The volume for a Source, where 1.0 is normal volume. Volume cannot be raised above 1.0. |

**Returns:**

*No return values*

#### Source:setVolumeLimits

Sets the volume limits of the source. The limits have to be numbers from 0 to 1.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| min | number |  | The minimum volume. |
| max | number |  | The maximum volume. |

**Returns:**

*No return values*

#### Source:stop

Stops a Source.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

#### Source:tell

Gets the currently playing position of the Source.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| unit | [TimeUnit](#timeunit) | 'seconds' | The type of unit for the return value. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| position | number | The currently playing position of the Source. |

## Enums

## DistanceModel

The different distance models.

Extended information can be found in the chapter "3.4. Attenuation By Distance" of the OpenAL 1.1 specification.

**Constants:**

| Name | Description |
| --- | --- |
| `none` | Sources do not get attenuated. |
| `inverse` | Inverse distance attenuation. |
| `inverseclamped` | Inverse distance attenuation. Gain is clamped. In version 0.9.2 and older this is named '''inverse clamped'''. |
| `linear` | Linear attenuation. |
| `linearclamped` | Linear attenuation. Gain is clamped. In version 0.9.2 and older this is named '''linear clamped'''. |
| `exponent` | Exponential attenuation. |
| `exponentclamped` | Exponential attenuation. Gain is clamped. In version 0.9.2 and older this is named '''exponent clamped'''. |

## EffectType

The different types of effects supported by love.audio.setEffect.

**Constants:**

| Name | Description |
| --- | --- |
| `chorus` | Plays multiple copies of the sound with slight pitch and time variation. Used to make sounds sound "fuller" or "thicker". |
| `compressor` | Decreases the dynamic range of the sound, making the loud and quiet parts closer in volume, producing a more uniform amplitude throughout time. |
| `distortion` | Alters the sound by amplifying it until it clips, shearing off parts of the signal, leading to a compressed and distorted sound. |
| `echo` | Decaying feedback based effect, on the order of seconds. Also known as delay; causes the sound to repeat at regular intervals at a decreasing volume. |
| `equalizer` | Adjust the frequency components of the sound using a 4-band (low-shelf, two band-pass and a high-shelf) equalizer. |
| `flanger` | Plays two copies of the sound; while varying the phase, or equivalently delaying one of them, by amounts on the order of milliseconds, resulting in phasing sounds. |
| `reverb` | Decaying feedback based effect, on the order of milliseconds. Used to simulate the reflection off of the surroundings. |
| `ringmodulator` | An implementation of amplitude modulation; multiplies the source signal with a simple waveform, to produce either volume changes, or inharmonic overtones. |

## EffectWaveform

The different types of waveforms that can be used with the '''ringmodulator''' EffectType.

**Constants:**

| Name | Description |
| --- | --- |
| `sawtooth` | A sawtooth wave, also known as a ramp wave. Named for its linear rise, and (near-)instantaneous fall along time. |
| `sine` | A sine wave. Follows a trigonometric sine function. |
| `square` | A square wave. Switches between high and low states (near-)instantaneously. |
| `triangle` | A triangle wave. Follows a linear rise and fall that repeats periodically. |

## FilterType

Types of filters for Sources.

**Constants:**

| Name | Description |
| --- | --- |
| `lowpass` | Low-pass filter. High frequency sounds are attenuated. |
| `highpass` | High-pass filter. Low frequency sounds are attenuated. |
| `bandpass` | Band-pass filter. Both high and low frequency sounds are attenuated based on the given parameters. |

## SourceType

Types of audio sources.

A good rule of thumb is to use stream for music files and static for all short sound effects. Basically, you want to avoid loading large files into memory at once.

**Constants:**

| Name | Description |
| --- | --- |
| `static` | The whole audio is decoded. |
| `stream` | The audio is decoded in chunks when needed. |
| `queue` | The audio must be manually queued by the user. |

## TimeUnit

Units that represent time.

**Constants:**

| Name | Description |
| --- | --- |
| `seconds` | Regular seconds. |
| `samples` | Audio samples. |

