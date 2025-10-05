# love.thread

Allows you to work with threads.

Threads are separate Lua environments, running in parallel to the main code. As their code runs separately, they can be used to compute complex operations without adversely affecting the frame rate of the main thread. However, as they are separate environments, they cannot access the variables and functions of the main thread, and communication between threads is limited.

All LOVE objects (userdata) are shared among threads so you'll only have to send their references across threads. You may run into concurrency issues if you manipulate an object on multiple threads at the same time.

When a Thread is started, it only loads the love.thread module. Every other module has to be loaded with require.

## Contents

**Functions:**

- [getChannel](#lovethreadgetchannel)
- [newChannel](#lovethreadnewchannel)
- [newThread](#lovethreadnewthread)

**Types:**

- [Channel](#channel)
- [Thread](#thread)

---

## Functions

## love.thread.getChannel

Creates or retrieves a named thread channel.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| name | string |  | The name of the channel you want to create or retrieve. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| channel | [Channel](#channel) | The Channel object associated with the name. |

## love.thread.newChannel

Create a new unnamed thread channel.

One use for them is to pass new unnamed channels to other threads via Channel:push on a named channel.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| channel | [Channel](#channel) | The new Channel object. |

## love.thread.newThread

Creates a new Thread from a filename, string or FileData object containing Lua code.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| filename | string |  | The name of the Lua file to use as the source. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| thread | [Thread](#thread) | A new Thread that has yet to be started. |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| fileData | FileData |  | The FileData containing the Lua code to use as the source. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| thread | [Thread](#thread) | A new Thread that has yet to be started. |

### Variant 3

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| codestring | string |  | A string containing the Lua code to use as the source. It needs to either be at least 1024 characters long, or contain at least one newline. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| thread | [Thread](#thread) | A new Thread that has yet to be started. |

## Types

## Channel

An object which can be used to send and receive data between different threads.

**Constructors:** [newChannel](#lovethreadnewchannel), [getChannel](#lovethreadgetchannel)

**Supertypes:** Object

### Methods

#### Channel:clear

Clears all the messages in the Channel queue.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

#### Channel:demand

Retrieves the value of a Channel message and removes it from the message queue.

It waits until a message is in the queue then returns the message value.

### Variant 1

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| value | Variant | The contents of the message. |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| timeout | number |  | The maximum amount of time to wait. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| value | Variant | The contents of the message or nil if the timeout expired. |

#### Channel:getCount

Retrieves the number of messages in the thread Channel queue.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| count | number | The number of messages in the queue. |

#### Channel:hasRead

Gets whether a pushed value has been popped or otherwise removed from the Channel.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| id | number |  | An id value previously returned by Channel:push. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| hasread | boolean | Whether the value represented by the id has been removed from the Channel via Channel:pop, Channel:demand, or Channel:clear. |

#### Channel:peek

Retrieves the value of a Channel message, but leaves it in the queue.

It returns nil if there's no message in the queue.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| value | Variant | The contents of the message. |

#### Channel:performAtomic

Executes the specified function atomically with respect to this Channel.

Calling multiple methods in a row on the same Channel is often useful. However if multiple Threads are calling this Channel's methods at the same time, the different calls on each Thread might end up interleaved (e.g. one or more of the second thread's calls may happen in between the first thread's calls.)

This method avoids that issue by making sure the Thread calling the method has exclusive access to the Channel until the specified function has returned.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| func | function |  | The function to call, the form of function(channel, arg1, arg2, ...) end. The Channel is passed as the first argument to the function when it is called. |
| ... | any |  | Additional arguments that the given function will receive when it is called. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| ret1 | any | The first return value of the given function (if any.) |
| ... | any | Any other return values. |

#### Channel:pop

Retrieves the value of a Channel message and removes it from the message queue.

It returns nil if there are no messages in the queue.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| value | Variant | The contents of the message. |

#### Channel:push

Send a message to the thread Channel.

See Variant for the list of supported types.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| value | Variant |  | The contents of the message. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| id | number | Identifier which can be supplied to Channel:hasRead |

#### Channel:supply

Send a message to the thread Channel and wait for a thread to accept it.

See Variant for the list of supported types.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| value | Variant |  | The contents of the message. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| success | boolean | Whether the message was successfully supplied (always true). |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| value | Variant |  | The contents of the message. |
| timeout | number |  | The maximum amount of time to wait. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| success | boolean | Whether the message was successfully supplied before the timeout expired. |

## Thread

A Thread is a chunk of code that can run in parallel with other threads. Data can be sent between different threads with Channel objects.

**Constructors:** [newThread](#lovethreadnewthread)

**Supertypes:** Object

### Methods

#### Thread:getError

Retrieves the error string from the thread if it produced an error.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| err | string | The error message, or nil if the Thread has not caused an error. |

#### Thread:isRunning

Returns whether the thread is currently running.

Threads which are not running can be (re)started with Thread:start.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| value | boolean | True if the thread is running, false otherwise. |

#### Thread:start

Starts the thread.

Beginning with version 0.9.0, threads can be restarted after they have completed their execution.

### Variant 1

**Arguments:**

*No arguments*

**Returns:**

*No return values*

### Variant 2

Arguments passed to Thread:start are accessible in the thread's main file via '''...''' (the vararg expression.)

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| ... | Variant |  | A string, number, boolean, LÖVE object, or simple table. |

**Returns:**

*No return values*

#### Thread:wait

Wait for a thread to finish.

This call will block until the thread finishes.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

