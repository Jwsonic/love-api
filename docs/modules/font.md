# love.font

Allows you to work with fonts.

## Contents

**Functions:**

- [newBMFontRasterizer](#lovefontnewbmfontrasterizer)
- [newGlyphData](#lovefontnewglyphdata)
- [newImageRasterizer](#lovefontnewimagerasterizer)
- [newRasterizer](#lovefontnewrasterizer)
- [newTrueTypeRasterizer](#lovefontnewtruetyperasterizer)

**Types:**

- [GlyphData](#glyphdata)
- [Rasterizer](#rasterizer)

**Enums:**

- [HintingMode](#hintingmode)

---

## Functions

## love.font.newBMFontRasterizer

Creates a new BMFont Rasterizer.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| imageData | ImageData |  | The image data containing the drawable pictures of font glyphs. |
| glyphs | string |  | The sequence of glyphs in the ImageData. |
| dpiscale | number | 1 | DPI scale. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| rasterizer | [Rasterizer](#rasterizer) | The rasterizer. |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| fileName | string |  | The path to file containing the drawable pictures of font glyphs. |
| glyphs | string |  | The sequence of glyphs in the ImageData. |
| dpiscale | number | 1 | DPI scale. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| rasterizer | [Rasterizer](#rasterizer) | The rasterizer. |

## love.font.newGlyphData

Creates a new GlyphData.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| rasterizer | [Rasterizer](#rasterizer) |  | The Rasterizer containing the font. |
| glyph | number |  | The character code of the glyph. |

**Returns:**

*No return values*

## love.font.newImageRasterizer

Creates a new Image Rasterizer.

Create an ImageRasterizer from the image data.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| imageData | ImageData |  | Font image data. |
| glyphs | string |  | String containing font glyphs. |
| extraSpacing | number | 0 | Font extra spacing. |
| dpiscale | number | 1 | Font DPI scale. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| rasterizer | [Rasterizer](#rasterizer) | The rasterizer. |

## love.font.newRasterizer

Creates a new Rasterizer.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| filename | string |  | The font file. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| rasterizer | [Rasterizer](#rasterizer) | The rasterizer. |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| data | FileData |  | The FileData of the font file. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| rasterizer | [Rasterizer](#rasterizer) | The rasterizer. |

### Variant 3

Create a TrueTypeRasterizer with the default font.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| size | number | 12 | The font size. |
| hinting | [HintingMode](#hintingmode) | 'normal' | True Type hinting mode. |
| dpiscale | number | love.window.getDPIScale() | The font DPI scale. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| rasterizer | [Rasterizer](#rasterizer) | The rasterizer. |

### Variant 4

Create a TrueTypeRasterizer with custom font.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| fileName | string |  | Path to font file. |
| size | number | 12 | The font size. |
| hinting | [HintingMode](#hintingmode) | 'normal' | True Type hinting mode. |
| dpiscale | number | love.window.getDPIScale() | The font DPI scale. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| rasterizer | [Rasterizer](#rasterizer) | The rasterizer. |

### Variant 5

Create a TrueTypeRasterizer with custom font.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| fileData | FileData |  | File data containing font. |
| size | number | 12 | The font size. |
| hinting | [HintingMode](#hintingmode) | 'normal' | True Type hinting mode. |
| dpiscale | number | love.window.getDPIScale() | The font DPI scale. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| rasterizer | [Rasterizer](#rasterizer) | The rasterizer. |

### Variant 6

Creates a new BMFont Rasterizer.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| imageData | ImageData |  | The image data containing the drawable pictures of font glyphs. |
| glyphs | string |  | The sequence of glyphs in the ImageData. |
| dpiscale | number | 1 | DPI scale. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| rasterizer | [Rasterizer](#rasterizer) | The rasterizer. |

### Variant 7

Creates a new BMFont Rasterizer.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| fileName | string |  | The path to file containing the drawable pictures of font glyphs. |
| glyphs | string |  | The sequence of glyphs in the ImageData. |
| dpiscale | number | 1 | DPI scale. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| rasterizer | [Rasterizer](#rasterizer) | The rasterizer. |

## love.font.newTrueTypeRasterizer

Creates a new TrueType Rasterizer.

### Variant 1

Create a TrueTypeRasterizer with the default font.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| size | number | 12 | The font size. |
| hinting | [HintingMode](#hintingmode) | 'normal' | True Type hinting mode. |
| dpiscale | number | love.window.getDPIScale() | The font DPI scale. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| rasterizer | [Rasterizer](#rasterizer) | The rasterizer. |

### Variant 2

Create a TrueTypeRasterizer with custom font.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| fileName | string |  | Path to font file. |
| size | number | 12 | The font size. |
| hinting | [HintingMode](#hintingmode) | 'normal' | True Type hinting mode. |
| dpiscale | number | love.window.getDPIScale() | The font DPI scale. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| rasterizer | [Rasterizer](#rasterizer) | The rasterizer. |

### Variant 3

Create a TrueTypeRasterizer with custom font.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| fileData | FileData |  | File data containing font. |
| size | number | 12 | The font size. |
| hinting | [HintingMode](#hintingmode) | 'normal' | True Type hinting mode. |
| dpiscale | number | love.window.getDPIScale() | The font DPI scale. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| rasterizer | [Rasterizer](#rasterizer) | The rasterizer. |

## Types

## GlyphData

A GlyphData represents a drawable symbol of a font Rasterizer.

**Supertypes:** Data, Object

### Methods

#### GlyphData:getAdvance

Gets glyph advance.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| advance | number | Glyph advance. |

#### GlyphData:getBearing

Gets glyph bearing.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| bx | number | Glyph bearing X. |
| by | number | Glyph bearing Y. |

#### GlyphData:getBoundingBox

Gets glyph bounding box.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| x | number | Glyph position x. |
| y | number | Glyph position y. |
| width | number | Glyph width. |
| height | number | Glyph height. |

#### GlyphData:getDimensions

Gets glyph dimensions.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| width | number | Glyph width. |
| height | number | Glyph height. |

#### GlyphData:getFormat

Gets glyph pixel format.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| format | PixelFormat | Glyph pixel format. |

#### GlyphData:getGlyph

Gets glyph number.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| glyph | number | Glyph number. |

#### GlyphData:getGlyphString

Gets glyph string.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| glyph | string | Glyph string. |

#### GlyphData:getHeight

Gets glyph height.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| height | number | Glyph height. |

#### GlyphData:getWidth

Gets glyph width.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| width | number | Glyph width. |

## Rasterizer

A Rasterizer handles font rendering, containing the font data (image or TrueType font) and drawable glyphs.

**Constructors:** [newTrueTypeRasterizer](#lovefontnewtruetyperasterizer), [newRasterizer](#lovefontnewrasterizer), [newImageRasterizer](#lovefontnewimagerasterizer), [newBMFontRasterizer](#lovefontnewbmfontrasterizer)

**Supertypes:** Object

### Methods

#### Rasterizer:getAdvance

Gets font advance.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| advance | number | Font advance. |

#### Rasterizer:getAscent

Gets ascent height.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| height | number | Ascent height. |

#### Rasterizer:getDescent

Gets descent height.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| height | number | Descent height. |

#### Rasterizer:getGlyphCount

Gets number of glyphs in font.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| count | number | Glyphs count. |

#### Rasterizer:getGlyphData

Gets glyph data of a specified glyph.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| glyph | string |  | Glyph |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| glyphData | [GlyphData](#glyphdata) | Glyph data |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| glyphNumber | number |  | Glyph number |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| glyphData | [GlyphData](#glyphdata) | Glyph data |

#### Rasterizer:getHeight

Gets font height.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| height | number | Font height |

#### Rasterizer:getLineHeight

Gets line height of a font.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| height | number | Line height of a font. |

#### Rasterizer:hasGlyphs

Checks if font contains specified glyphs.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| glyph1 | string or number |  | Glyph |
| ... | string or number |  | Additional glyphs |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| hasGlyphs | boolean | Whatever font contains specified glyphs. |

## Enums

## HintingMode

True Type hinting mode.

**Constants:**

| Name | Description |
| --- | --- |
| `normal` | Default hinting. Should be preferred for typical antialiased fonts. |
| `light` | Results in fuzzier text but can sometimes preserve the original glyph shapes of the text better than normal hinting. |
| `mono` | Results in aliased / unsmoothed text with either full opacity or completely transparent pixels. Should be used when antialiasing is not desired for the font. |
| `none` | Disables hinting for the font. Results in fuzzier text. |

