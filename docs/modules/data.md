# love.data

Provides functionality for creating and transforming data.

## Contents

**Functions:**

- [compress](#lovedatacompress)
- [decode](#lovedatadecode)
- [decompress](#lovedatadecompress)
- [encode](#lovedataencode)
- [getPackedSize](#lovedatagetpackedsize)
- [hash](#lovedatahash)
- [newByteData](#lovedatanewbytedata)
- [newDataView](#lovedatanewdataview)
- [pack](#lovedatapack)
- [unpack](#lovedataunpack)

**Types:**

- [ByteData](#bytedata)
- [CompressedData](#compresseddata)

**Enums:**

- [CompressedDataFormat](#compresseddataformat)
- [ContainerType](#containertype)
- [EncodeFormat](#encodeformat)
- [HashFunction](#hashfunction)

---

## Functions

## love.data.compress

Compresses a string or data using a specific compression algorithm.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| container | [ContainerType](#containertype) |  | What type to return the compressed data as. |
| format | [CompressedDataFormat](#compresseddataformat) |  | The format to use when compressing the string. |
| rawstring | string |  | The raw (un-compressed) string to compress. |
| level | number | -1 | The level of compression to use, between 0 and 9. -1 indicates the default level. The meaning of this argument depends on the compression format being used. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| compressedData | CompressedData or string | CompressedData/string which contains the compressed version of rawstring. |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| container | [ContainerType](#containertype) |  | What type to return the compressed data as. |
| format | [CompressedDataFormat](#compresseddataformat) |  | The format to use when compressing the data. |
| data | Data |  | A Data object containing the raw (un-compressed) data to compress. |
| level | number | -1 | The level of compression to use, between 0 and 9. -1 indicates the default level. The meaning of this argument depends on the compression format being used. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| compressedData | CompressedData or string | CompressedData/string which contains the compressed version of data. |

## love.data.decode

Decode Data or a string from any of the EncodeFormats to Data or string.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| container | [ContainerType](#containertype) |  | What type to return the decoded data as. |
| format | [EncodeFormat](#encodeformat) |  | The format of the input data. |
| sourceString | string |  | The raw (encoded) data to decode. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| decoded | ByteData or string | ByteData/string which contains the decoded version of source. |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| container | [ContainerType](#containertype) |  | What type to return the decoded data as. |
| format | [EncodeFormat](#encodeformat) |  | The format of the input data. |
| sourceData | Data |  | The raw (encoded) data to decode. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| decoded | ByteData or string | ByteData/string which contains the decoded version of source. |

## love.data.decompress

Decompresses a CompressedData or previously compressed string or Data object.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| container | [ContainerType](#containertype) |  | What type to return the decompressed data as. |
| compressedData | [CompressedData](#compresseddata) |  | The compressed data to decompress. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| decompressedData | Data or string | Data/string containing the raw decompressed data. |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| container | [ContainerType](#containertype) |  | What type to return the decompressed data as. |
| format | [CompressedDataFormat](#compresseddataformat) |  | The format that was used to compress the given string. |
| compressedString | string |  | A string containing data previously compressed with love.data.compress. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| decompressedData | Data or string | Data/string containing the raw decompressed data. |

### Variant 3

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| container | [ContainerType](#containertype) |  | What type to return the decompressed data as. |
| format | [CompressedDataFormat](#compresseddataformat) |  | The format that was used to compress the given data. |
| data | Data |  | A Data object containing data previously compressed with love.data.compress. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| decompressedData | Data or string | Data/string containing the raw decompressed data. |

## love.data.encode

Encode Data or a string to a Data or string in one of the EncodeFormats.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| container | [ContainerType](#containertype) |  | What type to return the encoded data as. |
| format | [EncodeFormat](#encodeformat) |  | The format of the output data. |
| sourceString | string |  | The raw data to encode. |
| linelength | number | 0 | The maximum line length of the output. Only supported for base64, ignored if 0. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| encoded | ByteData or string | ByteData/string which contains the encoded version of source. |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| container | [ContainerType](#containertype) |  | What type to return the encoded data as. |
| format | [EncodeFormat](#encodeformat) |  | The format of the output data. |
| sourceData | Data |  | The raw data to encode. |
| linelength | number | 0 | The maximum line length of the output. Only supported for base64, ignored if 0. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| encoded | ByteData or string | ByteData/string which contains the encoded version of source. |

## love.data.getPackedSize

Gets the size in bytes that a given format used with love.data.pack will use.

This function behaves the same as Lua 5.3's string.packsize.

The format string cannot have the variable-length options 's' or 'z'.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| format | string |  | A string determining how the values are packed. Follows the rules of Lua 5.3's string.pack format strings. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| size | number | The size in bytes that the packed data will use. |

## love.data.hash

Compute the message digest of a string using a specified hash algorithm.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| hashFunction | [HashFunction](#hashfunction) |  | Hash algorithm to use. |
| string | string |  | String to hash. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| rawdigest | string | Raw message digest string. |

### Variant 2

To return the hex string representation of the hash, use love.data.encode

hexDigestString = love.data.encode('string', 'hex', love.data.hash(algo, data))

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| hashFunction | [HashFunction](#hashfunction) |  | Hash algorithm to use. |
| data | Data |  | Data to hash. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| rawdigest | string | Raw message digest string. |

## love.data.newByteData

Creates a new Data object containing arbitrary bytes.

Data:getPointer along with LuaJIT's FFI can be used to manipulate the contents of the ByteData object after it has been created.

### Variant 1

Creates a new ByteData by copying the contents of the specified string.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| datastring | string |  | The byte string to copy. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| bytedata | [ByteData](#bytedata) | The new Data object. |

### Variant 2

Creates a new ByteData by copying from an existing Data object.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| Data | Data |  | The existing Data object to copy. |
| offset | number | 0 | The offset of the subsection to copy, in bytes. |
| size | number | data:getSize() | The size in bytes of the new Data object. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| bytedata | [ByteData](#bytedata) | The new Data object. |

### Variant 3

Creates a new empty ByteData with the specific size.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| size | number |  | The size in bytes of the new Data object. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| bytedata | [ByteData](#bytedata) | The new Data object. |

## love.data.newDataView

Creates a new Data referencing a subsection of an existing Data object.

Data:getString and Data:getPointer will return the original Data object's contents, with the view's offset and size applied.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| data | Data |  | The Data object to reference. |
| offset | number |  | The offset of the subsection to reference, in bytes. |
| size | number |  | The size in bytes of the subsection to reference. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| view | Data | The new Data view. |

## love.data.pack

Packs (serializes) simple Lua values.

This function behaves the same as Lua 5.3's string.pack.

Packing integers with values greater than 2^52 is not supported, as Lua 5.1 cannot represent those values in its number type. 

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| container | [ContainerType](#containertype) |  | What type to return the encoded data as. |
| format | string |  | A string determining how the values are packed. Follows the rules of Lua 5.3's string.pack format strings. |
| v1 | number or boolean or string |  | The first value (number, boolean, or string) to serialize. |
| ... | number or boolean or string |  | Additional values to serialize. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| data | Data or string | Data/string which contains the serialized data. |

## love.data.unpack

Unpacks (deserializes) a byte-string or Data into simple Lua values.

This function behaves the same as Lua 5.3's string.unpack.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| format | string |  | A string determining how the values were packed. Follows the rules of Lua 5.3's string.pack format strings. |
| datastring | string |  | A string containing the packed (serialized) data. |
| pos | number | 1 | Where to start reading in the string. Negative values can be used to read relative from the end of the string. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| v1 | number or boolean or string | The first value (number, boolean, or string) that was unpacked. |
| ... | number or boolean or string | Additional unpacked values. |
| index | number | The index of the first unread byte in the data string. |

### Variant 2

Unpacking integers with values greater than 2^52 is not supported, as Lua 5.1 cannot represent those values in its number type. 

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| format | string |  | A string determining how the values were packed. Follows the rules of Lua 5.3's string.pack format strings. |
| data | Data |  | A Data object containing the packed (serialized) data. |
| pos | number | 1 | 1-based index indicating where to start reading in the Data. Negative values can be used to read relative from the end of the Data object. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| v1 | number or boolean or string | The first value (number, boolean, or string) that was unpacked. |
| ... | number or boolean or string | Additional unpacked values. |
| index | number | The 1-based index of the first unread byte in the Data. |

## Types

## ByteData

Data object containing arbitrary bytes in an contiguous memory.

There are currently no LÖVE functions provided for manipulating the contents of a ByteData, but Data:getPointer can be used with LuaJIT's FFI to access and write to the contents directly.

**Constructors:** [newByteData](#lovedatanewbytedata)

**Supertypes:** Object, Data

## CompressedData

Represents byte data compressed using a specific algorithm.

love.data.decompress can be used to de-compress the data (or love.math.decompress in 0.10.2 or earlier).

**Constructors:** [compress](#lovedatacompress)

**Supertypes:** Data, Object

### Methods

#### CompressedData:getFormat

Gets the compression format of the CompressedData.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| format | [CompressedDataFormat](#compresseddataformat) | The format of the CompressedData. |

## Enums

## CompressedDataFormat

Compressed data formats.

**Constants:**

| Name | Description |
| --- | --- |
| `lz4` | The LZ4 compression format. Compresses and decompresses very quickly, but the compression ratio is not the best. LZ4-HC is used when compression level 9 is specified. Some benchmarks are available here. |
| `zlib` | The zlib format is DEFLATE-compressed data with a small bit of header data. Compresses relatively slowly and decompresses moderately quickly, and has a decent compression ratio. |
| `gzip` | The gzip format is DEFLATE-compressed data with a slightly larger header than zlib. Since it uses DEFLATE it has the same compression characteristics as the zlib format. |
| `deflate` | Raw DEFLATE-compressed data (no header). |

## ContainerType

Return type of various data-returning functions.

**Constants:**

| Name | Description |
| --- | --- |
| `data` | Return type is ByteData. |
| `string` | Return type is string. |

## EncodeFormat

Encoding format used to encode or decode data.

**Constants:**

| Name | Description |
| --- | --- |
| `base64` | Encode/decode data as base64 binary-to-text encoding. |
| `hex` | Encode/decode data as hexadecimal string. |

## HashFunction

Hash algorithm of love.data.hash.

**Constants:**

| Name | Description |
| --- | --- |
| `md5` | MD5 hash algorithm (16 bytes). |
| `sha1` | SHA1 hash algorithm (20 bytes). |
| `sha224` | SHA2 hash algorithm with message digest size of 224 bits (28 bytes). |
| `sha256` | SHA2 hash algorithm with message digest size of 256 bits (32 bytes). |
| `sha384` | SHA2 hash algorithm with message digest size of 384 bits (48 bytes). |
| `sha512` | SHA2 hash algorithm with message digest size of 512 bits (64 bytes). |

