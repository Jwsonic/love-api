# love.filesystem

Provides an interface to the user's filesystem.

## Contents

**Functions:**

- [append](#lovefilesystemappend)
- [areSymlinksEnabled](#lovefilesystemaresymlinksenabled)
- [createDirectory](#lovefilesystemcreatedirectory)
- [getAppdataDirectory](#lovefilesystemgetappdatadirectory)
- [getCRequirePath](#lovefilesystemgetcrequirepath)
- [getDirectoryItems](#lovefilesystemgetdirectoryitems)
- [getIdentity](#lovefilesystemgetidentity)
- [getInfo](#lovefilesystemgetinfo)
- [getRealDirectory](#lovefilesystemgetrealdirectory)
- [getRequirePath](#lovefilesystemgetrequirepath)
- [getSaveDirectory](#lovefilesystemgetsavedirectory)
- [getSource](#lovefilesystemgetsource)
- [getSourceBaseDirectory](#lovefilesystemgetsourcebasedirectory)
- [getUserDirectory](#lovefilesystemgetuserdirectory)
- [getWorkingDirectory](#lovefilesystemgetworkingdirectory)
- [init](#lovefilesysteminit)
- [isFused](#lovefilesystemisfused)
- [lines](#lovefilesystemlines)
- [load](#lovefilesystemload)
- [mount](#lovefilesystemmount)
- [newFile](#lovefilesystemnewfile)
- [newFileData](#lovefilesystemnewfiledata)
- [read](#lovefilesystemread)
- [remove](#lovefilesystemremove)
- [setCRequirePath](#lovefilesystemsetcrequirepath)
- [setIdentity](#lovefilesystemsetidentity)
- [setRequirePath](#lovefilesystemsetrequirepath)
- [setSource](#lovefilesystemsetsource)
- [setSymlinksEnabled](#lovefilesystemsetsymlinksenabled)
- [unmount](#lovefilesystemunmount)
- [write](#lovefilesystemwrite)

**Types:**

- [DroppedFile](#droppedfile)
- [File](#file)
- [FileData](#filedata)

**Enums:**

- [BufferMode](#buffermode)
- [FileDecoder](#filedecoder)
- [FileMode](#filemode)
- [FileType](#filetype)

---

## Functions

## love.filesystem.append

Append data to an existing file.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| name | string |  | The name (and path) of the file. |
| data | string |  | The string data to append to the file. |
| size | number | all | How many bytes to write. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| success | boolean | True if the operation was successful, or nil if there was an error. |
| errormsg | string | The error message on failure. |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| name | string |  | The name (and path) of the file. |
| data | Data |  | The Data object to append to the file. |
| size | number | all | How many bytes to write. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| success | boolean | True if the operation was successful, or nil if there was an error. |
| errormsg | string | The error message on failure. |

## love.filesystem.areSymlinksEnabled

Gets whether love.filesystem follows symbolic links.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| enable | boolean | Whether love.filesystem follows symbolic links. |

## love.filesystem.createDirectory

Recursively creates a directory.

When called with 'a/b' it creates both 'a' and 'a/b', if they don't exist already.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| name | string |  | The directory to create. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| success | boolean | True if the directory was created, false if not. |

## love.filesystem.getAppdataDirectory

Returns the application data directory (could be the same as getUserDirectory)

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| path | string | The path of the application data directory |

## love.filesystem.getCRequirePath

Gets the filesystem paths that will be searched for c libraries when require is called.

The paths string returned by this function is a sequence of path templates separated by semicolons. The argument passed to ''require'' will be inserted in place of any question mark ('?') character in each template (after the dot characters in the argument passed to ''require'' are replaced by directory separators.) Additionally, any occurrence of a double question mark ('??') will be replaced by the name passed to require and the default library extension for the platform.

The paths are relative to the game's source and save directories, as well as any paths mounted with love.filesystem.mount.

The default paths string is '??', which makes require('cool') try to load cool.dll, or cool.so depending on the platform.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| paths | string | The paths that the ''require'' function will check for c libraries in love's filesystem. |

## love.filesystem.getDirectoryItems

Returns a table with the names of files and subdirectories in the specified path. The table is not sorted in any way; the order is undefined.

If the path passed to the function exists in the game and the save directory, it will list the files and directories from both places.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| dir | string |  | The directory. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| files | table | A sequence with the names of all files and subdirectories as strings. |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| dir | string |  | The directory. |
| callback | function |  | A function which is called for each file and folder in the directory. The filename is passed to the function as an argument. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| files | table | A sequence with the names of all files and subdirectories as strings. |

## love.filesystem.getIdentity

Gets the write directory name for your game. 

Note that this only returns the name of the folder to store your files in, not the full path.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| name | string | The identity that is used as write directory. |

## love.filesystem.getInfo

Gets information about the specified file or directory.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| path | string |  | The file or directory path to check. |
| filtertype | [FileType](#filetype) | nil | If supplied, this parameter causes getInfo to only return the info table if the item at the given path matches the specified file type. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| info | table | A table containing information about the specified path, or nil if nothing exists at the path. The table contains the following fields: (see table fields below) |

**info table fields:**

| Name | Type | Description |
| --- | --- | --- |
| type | [FileType](#filetype) | The type of the object at the path (file, directory, symlink, etc.) |
| size | number | The size in bytes of the file, or nil if it can't be determined. |
| modtime | number | The file's last modification time in seconds since the unix epoch, or nil if it can't be determined. |

### Variant 2

This variant accepts an existing table to fill in, instead of creating a new one.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| path | string |  | The file or directory path to check. |
| info | table |  | A table which will be filled in with info about the specified path. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| info | table | The table given as an argument, or nil if nothing exists at the path. The table will be filled in with the following fields: (see table fields below) |

**info table fields:**

| Name | Type | Description |
| --- | --- | --- |
| type | [FileType](#filetype) | The type of the object at the path (file, directory, symlink, etc.) |
| size | number | The size in bytes of the file, or nil if it can't be determined. |
| modtime | number | The file's last modification time in seconds since the unix epoch, or nil if it can't be determined. |

### Variant 3

This variant only returns info if the item at the given path is the same file type as specified in the filtertype argument, and accepts an existing table to fill in, instead of creating a new one.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| path | string |  | The file or directory path to check. |
| filtertype | [FileType](#filetype) |  | Causes getInfo to only return the info table if the item at the given path matches the specified file type. |
| info | table |  | A table which will be filled in with info about the specified path. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| info | table | The table given as an argument, or nil if nothing exists at the path. The table will be filled in with the following fields: (see table fields below) |

**info table fields:**

| Name | Type | Description |
| --- | --- | --- |
| type | [FileType](#filetype) | The type of the object at the path (file, directory, symlink, etc.) |
| size | number | The size in bytes of the file, or nil if it can't be determined. |
| modtime | number | The file's last modification time in seconds since the unix epoch, or nil if it can't be determined. |

## love.filesystem.getRealDirectory

Gets the platform-specific absolute path of the directory containing a filepath.

This can be used to determine whether a file is inside the save directory or the game's source .love.

This function returns the directory containing the given ''file path'', rather than file. For example, if the file screenshot1.png exists in a directory called screenshots in the game's save directory, love.filesystem.getRealDirectory('screenshots/screenshot1.png') will return the same value as love.filesystem.getSaveDirectory.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| filepath | string |  | The filepath to get the directory of. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| realdir | string | The platform-specific full path of the directory containing the filepath. |

## love.filesystem.getRequirePath

Gets the filesystem paths that will be searched when require is called.

The paths string returned by this function is a sequence of path templates separated by semicolons. The argument passed to ''require'' will be inserted in place of any question mark ('?') character in each template (after the dot characters in the argument passed to ''require'' are replaced by directory separators.)

The paths are relative to the game's source and save directories, as well as any paths mounted with love.filesystem.mount.

The default paths string is '?.lua;?/init.lua', which makes require('cool') try to load cool.lua and then try cool/init.lua if cool.lua doesn't exist.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| paths | string | The paths that the ''require'' function will check in love's filesystem. |

## love.filesystem.getSaveDirectory

Gets the full path to the designated save directory.

This can be useful if you want to use the standard io library (or something else) to

read or write in the save directory.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| dir | string | The absolute path to the save directory. |

## love.filesystem.getSource

Returns the full path to the the .love file or directory. If the game is fused to the LÖVE executable, then the executable is returned.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| path | string | The full platform-dependent path of the .love file or directory. |

## love.filesystem.getSourceBaseDirectory

Returns the full path to the directory containing the .love file. If the game is fused to the LÖVE executable, then the directory containing the executable is returned.

If love.filesystem.isFused is true, the path returned by this function can be passed to love.filesystem.mount, which will make the directory containing the main game (e.g. C:\Program Files\coolgame\) readable by love.filesystem.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| path | string | The full platform-dependent path of the directory containing the .love file. |

## love.filesystem.getUserDirectory

Returns the path of the user's directory

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| path | string | The path of the user's directory |

## love.filesystem.getWorkingDirectory

Gets the current working directory.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| cwd | string | The current working directory. |

## love.filesystem.init

Initializes love.filesystem, will be called internally, so should not be used explicitly.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| appname | string |  | The name of the application binary, typically love. |

**Returns:**

*No return values*

## love.filesystem.isFused

Gets whether the game is in fused mode or not.

If a game is in fused mode, its save directory will be directly in the Appdata directory instead of Appdata/LOVE/. The game will also be able to load C Lua dynamic libraries which are located in the save directory.

A game is in fused mode if the source .love has been fused to the executable (see Game Distribution), or if '--fused' has been given as a command-line argument when starting the game.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| fused | boolean | True if the game is in fused mode, false otherwise. |

## love.filesystem.lines

Iterate over the lines in a file.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| name | string |  | The name (and path) of the file |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| iterator | function | A function that iterates over all the lines in the file |

## love.filesystem.load

Loads a Lua file (but does not run it).

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| name | string |  | The name (and path) of the file. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| chunk | function | The loaded chunk. |
| errormsg | string | The error message if file could not be opened. |

## love.filesystem.mount

Mounts a zip file or folder in the game's save directory for reading.

It is also possible to mount love.filesystem.getSourceBaseDirectory if the game is in fused mode.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| archive | string |  | The folder or zip file in the game's save directory to mount. |
| mountpoint | string |  | The new path the archive will be mounted to. |
| appendToPath | boolean | false | Whether the archive will be searched when reading a filepath before or after already-mounted archives. This includes the game's source and save directories. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| success | boolean | True if the archive was successfully mounted, false otherwise. |

### Variant 2

Mounts the contents of the given FileData in memory. The FileData's data must contain a zipped directory structure.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| filedata | [FileData](#filedata) |  | The FileData object in memory to mount. |
| mountpoint | string |  | The new path the archive will be mounted to. |
| appendToPath | boolean | false | Whether the archive will be searched when reading a filepath before or after already-mounted archives. This includes the game's source and save directories. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| success | boolean | True if the archive was successfully mounted, false otherwise. |

### Variant 3

Mounts the contents of the given Data object in memory. The data must contain a zipped directory structure.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| data | Data |  | The Data object in memory to mount. |
| archivename | string |  | The name to associate the mounted data with, for use with love.filesystem.unmount. Must be unique compared to other mounted data. |
| mountpoint | string |  | The new path the archive will be mounted to. |
| appendToPath | boolean | false | Whether the archive will be searched when reading a filepath before or after already-mounted archives. This includes the game's source and save directories. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| success | boolean | True if the archive was successfully mounted, false otherwise. |

## love.filesystem.newFile

Creates a new File object. 

It needs to be opened before it can be accessed.

### Variant 1

Please note that this function will not return any error message (e.g. if you use an invalid filename) because it just creates the File Object. You can still check if the file is valid by using File:open which returns a boolean and an error message if something goes wrong while opening the file.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| filename | string |  | The filename of the file. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| file | [File](#file) | The new File object. |

### Variant 2

Creates a File object and opens it for reading, writing, or appending.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| filename | string |  | The filename of the file. |
| mode | [FileMode](#filemode) |  | The mode to open the file in. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| file | [File](#file) | The new File object, or nil if an error occurred. |
| errorstr | string | The error string if an error occurred. |

## love.filesystem.newFileData

Creates a new FileData object from a file on disk, or from a string in memory.

### Variant 1

Creates a new FileData object from a string in memory.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| contents | string |  | The contents of the file in memory represented as a string. |
| name | string |  | The name of the file. The extension may be parsed and used by LÖVE when passing the FileData object into love.audio.newSource. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| data | [FileData](#filedata) | The new FileData. |

### Variant 2

Creates a new FileData object from a Data object in memory.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| originaldata | Data |  | The Data object to copy into the new FileData object. |
| name | string |  | The name of the file. The extension may be parsed and used by LÖVE when passing the FileData object into love.audio.newSource. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| data | [FileData](#filedata) | The new FileData. |

### Variant 3

Creates a new FileData from a file on the storage device.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| filepath | string |  | Path to the file. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| data | [FileData](#filedata) | The new FileData, or nil if an error occurred. |
| err | string | The error string, if an error occurred. |

## love.filesystem.read

Read the contents of a file.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| name | string |  | The name (and path) of the file. |
| size | number | all | How many bytes to read. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| contents | string | The file contents. |
| size | number | How many bytes have been read. |
| contents | nil | returns nil as content. |
| error | string | returns an error message. |

### Variant 2

Reads the contents of a file into either a string or a FileData object.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| container | ContainerType |  | What type to return the file's contents as. |
| name | string |  | The name (and path) of the file |
| size | number | all | How many bytes to read |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| contents | FileData or string | FileData or string containing the file contents. |
| size | number | How many bytes have been read. |
| contents | nil | returns nil as content. |
| error | string | returns an error message. |

## love.filesystem.remove

Removes a file or empty directory.

The directory must be empty before removal or else it will fail. Simply remove all files and folders in the directory beforehand.

If the file exists in the .love but not in the save directory, it returns false as well.

An opened File prevents removal of the underlying file. Simply close the File to remove it.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| name | string |  | The file or directory to remove. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| success | boolean | True if the file/directory was removed, false otherwise. |

## love.filesystem.setCRequirePath

Sets the filesystem paths that will be searched for c libraries when require is called.

The paths string returned by this function is a sequence of path templates separated by semicolons. The argument passed to ''require'' will be inserted in place of any question mark ('?') character in each template (after the dot characters in the argument passed to ''require'' are replaced by directory separators.) Additionally, any occurrence of a double question mark ('??') will be replaced by the name passed to require and the default library extension for the platform.

The paths are relative to the game's source and save directories, as well as any paths mounted with love.filesystem.mount.

The default paths string is '??', which makes require('cool') try to load cool.dll, or cool.so depending on the platform.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| paths | string |  | The paths that the ''require'' function will check in love's filesystem. |

**Returns:**

*No return values*

## love.filesystem.setIdentity

Sets the write directory for your game. 

Note that you can only set the name of the folder to store your files in, not the location.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| name | string |  | The new identity that will be used as write directory. |

**Returns:**

*No return values*

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| name | string |  | The new identity that will be used as write directory. |

**Returns:**

*No return values*

## love.filesystem.setRequirePath

Sets the filesystem paths that will be searched when require is called.

The paths string given to this function is a sequence of path templates separated by semicolons. The argument passed to ''require'' will be inserted in place of any question mark ('?') character in each template (after the dot characters in the argument passed to ''require'' are replaced by directory separators.)

The paths are relative to the game's source and save directories, as well as any paths mounted with love.filesystem.mount.

The default paths string is '?.lua;?/init.lua', which makes require('cool') try to load cool.lua and then try cool/init.lua if cool.lua doesn't exist.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| paths | string |  | The paths that the ''require'' function will check in love's filesystem. |

**Returns:**

*No return values*

## love.filesystem.setSource

Sets the source of the game, where the code is present. This function can only be called once, and is normally automatically done by LÖVE.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| path | string |  | Absolute path to the game's source folder. |

**Returns:**

*No return values*

## love.filesystem.setSymlinksEnabled

Sets whether love.filesystem follows symbolic links. It is enabled by default in version 0.10.0 and newer, and disabled by default in 0.9.2.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| enable | boolean |  | Whether love.filesystem should follow symbolic links. |

**Returns:**

*No return values*

## love.filesystem.unmount

Unmounts a zip file or folder previously mounted for reading with love.filesystem.mount.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| archive | string |  | The folder or zip file in the game's save directory which is currently mounted. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| success | boolean | True if the archive was successfully unmounted, false otherwise. |

## love.filesystem.write

Write data to a file in the save directory. If the file existed already, it will be completely replaced by the new contents.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| name | string |  | The name (and path) of the file. |
| data | string |  | The string data to write to the file. |
| size | number | all | How many bytes to write. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| success | boolean | If the operation was successful. |
| message | string | Error message if operation was unsuccessful. |

### Variant 2

If you are getting the error message 'Could not set write directory', try setting the save directory. This is done either with love.filesystem.setIdentity or by setting the identity field in love.conf.

'''Writing to multiple lines''': In Windows, some text editors (e.g. Notepad) only treat CRLF ('\r\n') as a new line.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| name | string |  | The name (and path) of the file. |
| data | Data |  | The Data object to write to the file. |
| size | number | all | How many bytes to write. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| success | boolean | If the operation was successful. |
| message | string | Error message if operation was unsuccessful. |

## Types

## DroppedFile

Represents a file dropped onto the window.

Note that the DroppedFile type can only be obtained from love.filedropped callback, and can't be constructed manually by the user.

**Supertypes:** File, Object

## File

Represents a file on the filesystem. A function that takes a file path can also take a File.

**Constructors:** [newFile](#lovefilesystemnewfile)

**Supertypes:** Object

### Methods

#### File:close

Closes a File.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| success | boolean | Whether closing was successful. |

#### File:flush

Flushes any buffered written data in the file to the disk.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| success | boolean | Whether the file successfully flushed any buffered data to the disk. |
| err | string | The error string, if an error occurred and the file could not be flushed. |

#### File:getBuffer

Gets the buffer mode of a file.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| mode | [BufferMode](#buffermode) | The current buffer mode of the file. |
| size | number | The maximum size in bytes of the file's buffer. |

#### File:getFilename

Gets the filename that the File object was created with. If the file object originated from the love.filedropped callback, the filename will be the full platform-dependent file path.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| filename | string | The filename of the File. |

#### File:getMode

Gets the FileMode the file has been opened with.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| mode | [FileMode](#filemode) | The mode this file has been opened with. |

#### File:getSize

Returns the file size.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| size | number | The file size in bytes. |

#### File:isEOF

Gets whether end-of-file has been reached.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| eof | boolean | Whether EOF has been reached. |

#### File:isOpen

Gets whether the file is open.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| open | boolean | True if the file is currently open, false otherwise. |

#### File:lines

Iterate over all the lines in a file.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| iterator | function | The iterator (can be used in for loops). |

#### File:open

Open the file for write, read or append.

If you are getting the error message 'Could not set write directory', try setting the save directory. This is done either with love.filesystem.setIdentity or by setting the identity field in love.conf (only available with love 0.7 or higher).

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| mode | [FileMode](#filemode) |  | The mode to open the file in. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| ok | boolean | True on success, false otherwise. |
| err | string | The error string if an error occurred. |

#### File:read

Read a number of bytes from a file.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| bytes | number | all | The number of bytes to read. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| contents | string | The contents of the read bytes. |
| size | number | How many bytes have been read. |

### Variant 2

Reads the contents of a file into either a string or a FileData object.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| container | ContainerType |  | What type to return the file's contents as. |
| bytes | number | all | The number of bytes to read. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| contents | FileData or string | FileData or string containing the read bytes. |
| size | number | How many bytes have been read. |

#### File:seek

Seek to a position in a file

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| pos | number |  | The position to seek to |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| success | boolean | Whether the operation was successful |

#### File:setBuffer

Sets the buffer mode for a file opened for writing or appending. Files with buffering enabled will not write data to the disk until the buffer size limit is reached, depending on the buffer mode.

File:flush will force any buffered data to be written to the disk.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| mode | [BufferMode](#buffermode) |  | The buffer mode to use. |
| size | number | 0 | The maximum size in bytes of the file's buffer. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| success | boolean | Whether the buffer mode was successfully set. |
| errorstr | string | The error string, if the buffer mode could not be set and an error occurred. |

#### File:tell

Returns the position in the file.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| pos | number | The current position. |

#### File:write

Write data to a file.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| data | string |  | The string data to write. |
| size | number | all | How many bytes to write. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| success | boolean | Whether the operation was successful. |
| err | string | The error string if an error occurred. |

### Variant 2

'''Writing to multiple lines''': In Windows, some text editors (e.g. Notepad before Windows 10 1809) only treat CRLF ('\r\n') as a new line.

--example

f = love.filesystem.newFile('note.txt')

f:open('w')

for i = 1, 10 do

    f:write('This is line '..i..'!\r\n')

end

f:close()

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| data | Data |  | The Data object to write. |
| size | number | all | How many bytes to write. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| success | boolean | Whether the operation was successful. |
| errorstr | string | The error string if an error occurred. |

## FileData

Data representing the contents of a file.

**Constructors:** [newFileData](#lovefilesystemnewfiledata)

**Supertypes:** Data, Object

### Methods

#### FileData:getExtension

Gets the extension of the FileData.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| ext | string | The extension of the file the FileData represents. |

#### FileData:getFilename

Gets the filename of the FileData.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| name | string | The name of the file the FileData represents. |

## Enums

## BufferMode

Buffer modes for File objects.

**Constants:**

| Name | Description |
| --- | --- |
| `none` | No buffering. The result of write and append operations appears immediately. |
| `line` | Line buffering. Write and append operations are buffered until a newline is output or the buffer size limit is reached. |
| `full` | Full buffering. Write and append operations are always buffered until the buffer size limit is reached. |

## FileDecoder

How to decode a given FileData.

**Constants:**

| Name | Description |
| --- | --- |
| `file` | The data is unencoded. |
| `base64` | The data is base64-encoded. |

## FileMode

The different modes you can open a File in.

**Constants:**

| Name | Description |
| --- | --- |
| `r` | Open a file for read. |
| `w` | Open a file for write. |
| `a` | Open a file for append. |
| `c` | Do not open a file (represents a closed file.) |

## FileType

The type of a file.

**Constants:**

| Name | Description |
| --- | --- |
| `file` | Regular file. |
| `directory` | Directory. |
| `symlink` | Symbolic link. |
| `other` | Something completely different like a device. |

