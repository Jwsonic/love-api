# love.graphics

The primary responsibility for the love.graphics module is the drawing of lines, shapes, text, Images and other Drawable objects onto the screen. Its secondary responsibilities include loading external files (including Images and Fonts) into memory, creating specialized objects (such as ParticleSystems or Canvases) and managing screen geometry.

LÖVE's coordinate system is rooted in the upper-left corner of the screen, which is at location (0, 0). The x axis is horizontal: larger values are further to the right. The y axis is vertical: larger values are further towards the bottom.

In many cases, you draw images or shapes in terms of their upper-left corner.

Many of the functions are used to manipulate the graphics coordinate system, which is essentially the way coordinates are mapped to the display. You can change the position, scale, and even rotation in this way.

## Contents

**Functions:**

- [applyTransform](#lovegraphicsapplytransform)
- [arc](#lovegraphicsarc)
- [captureScreenshot](#lovegraphicscapturescreenshot)
- [circle](#lovegraphicscircle)
- [clear](#lovegraphicsclear)
- [discard](#lovegraphicsdiscard)
- [draw](#lovegraphicsdraw)
- [drawInstanced](#lovegraphicsdrawinstanced)
- [drawLayer](#lovegraphicsdrawlayer)
- [ellipse](#lovegraphicsellipse)
- [flushBatch](#lovegraphicsflushbatch)
- [getBackgroundColor](#lovegraphicsgetbackgroundcolor)
- [getBlendMode](#lovegraphicsgetblendmode)
- [getCanvas](#lovegraphicsgetcanvas)
- [getCanvasFormats](#lovegraphicsgetcanvasformats)
- [getColor](#lovegraphicsgetcolor)
- [getColorMask](#lovegraphicsgetcolormask)
- [getDPIScale](#lovegraphicsgetdpiscale)
- [getDefaultFilter](#lovegraphicsgetdefaultfilter)
- [getDepthMode](#lovegraphicsgetdepthmode)
- [getDimensions](#lovegraphicsgetdimensions)
- [getFont](#lovegraphicsgetfont)
- [getFrontFaceWinding](#lovegraphicsgetfrontfacewinding)
- [getHeight](#lovegraphicsgetheight)
- [getImageFormats](#lovegraphicsgetimageformats)
- [getLineJoin](#lovegraphicsgetlinejoin)
- [getLineStyle](#lovegraphicsgetlinestyle)
- [getLineWidth](#lovegraphicsgetlinewidth)
- [getMeshCullMode](#lovegraphicsgetmeshcullmode)
- [getPixelDimensions](#lovegraphicsgetpixeldimensions)
- [getPixelHeight](#lovegraphicsgetpixelheight)
- [getPixelWidth](#lovegraphicsgetpixelwidth)
- [getPointSize](#lovegraphicsgetpointsize)
- [getRendererInfo](#lovegraphicsgetrendererinfo)
- [getScissor](#lovegraphicsgetscissor)
- [getShader](#lovegraphicsgetshader)
- [getStackDepth](#lovegraphicsgetstackdepth)
- [getStats](#lovegraphicsgetstats)
- [getStencilTest](#lovegraphicsgetstenciltest)
- [getSupported](#lovegraphicsgetsupported)
- [getSystemLimits](#lovegraphicsgetsystemlimits)
- [getTextureTypes](#lovegraphicsgettexturetypes)
- [getWidth](#lovegraphicsgetwidth)
- [intersectScissor](#lovegraphicsintersectscissor)
- [inverseTransformPoint](#lovegraphicsinversetransformpoint)
- [isActive](#lovegraphicsisactive)
- [isGammaCorrect](#lovegraphicsisgammacorrect)
- [isWireframe](#lovegraphicsiswireframe)
- [line](#lovegraphicsline)
- [newArrayImage](#lovegraphicsnewarrayimage)
- [newCanvas](#lovegraphicsnewcanvas)
- [newCubeImage](#lovegraphicsnewcubeimage)
- [newFont](#lovegraphicsnewfont)
- [newImage](#lovegraphicsnewimage)
- [newImageFont](#lovegraphicsnewimagefont)
- [newMesh](#lovegraphicsnewmesh)
- [newParticleSystem](#lovegraphicsnewparticlesystem)
- [newQuad](#lovegraphicsnewquad)
- [newShader](#lovegraphicsnewshader)
- [newSpriteBatch](#lovegraphicsnewspritebatch)
- [newText](#lovegraphicsnewtext)
- [newVideo](#lovegraphicsnewvideo)
- [newVolumeImage](#lovegraphicsnewvolumeimage)
- [origin](#lovegraphicsorigin)
- [points](#lovegraphicspoints)
- [polygon](#lovegraphicspolygon)
- [pop](#lovegraphicspop)
- [present](#lovegraphicspresent)
- [print](#lovegraphicsprint)
- [printf](#lovegraphicsprintf)
- [push](#lovegraphicspush)
- [rectangle](#lovegraphicsrectangle)
- [replaceTransform](#lovegraphicsreplacetransform)
- [reset](#lovegraphicsreset)
- [rotate](#lovegraphicsrotate)
- [scale](#lovegraphicsscale)
- [setBackgroundColor](#lovegraphicssetbackgroundcolor)
- [setBlendMode](#lovegraphicssetblendmode)
- [setCanvas](#lovegraphicssetcanvas)
- [setColor](#lovegraphicssetcolor)
- [setColorMask](#lovegraphicssetcolormask)
- [setDefaultFilter](#lovegraphicssetdefaultfilter)
- [setDepthMode](#lovegraphicssetdepthmode)
- [setFont](#lovegraphicssetfont)
- [setFrontFaceWinding](#lovegraphicssetfrontfacewinding)
- [setLineJoin](#lovegraphicssetlinejoin)
- [setLineStyle](#lovegraphicssetlinestyle)
- [setLineWidth](#lovegraphicssetlinewidth)
- [setMeshCullMode](#lovegraphicssetmeshcullmode)
- [setNewFont](#lovegraphicssetnewfont)
- [setPointSize](#lovegraphicssetpointsize)
- [setScissor](#lovegraphicssetscissor)
- [setShader](#lovegraphicssetshader)
- [setStencilTest](#lovegraphicssetstenciltest)
- [setWireframe](#lovegraphicssetwireframe)
- [shear](#lovegraphicsshear)
- [stencil](#lovegraphicsstencil)
- [transformPoint](#lovegraphicstransformpoint)
- [translate](#lovegraphicstranslate)
- [validateShader](#lovegraphicsvalidateshader)

**Types:**

- [Canvas](#canvas)
- [Drawable](#drawable)
- [Font](#font)
- [Image](#image)
- [Mesh](#mesh)
- [ParticleSystem](#particlesystem)
- [Quad](#quad)
- [Shader](#shader)
- [SpriteBatch](#spritebatch)
- [Text](#text)
- [Texture](#texture)
- [Video](#video)

**Enums:**

- [AlignMode](#alignmode)
- [ArcType](#arctype)
- [AreaSpreadDistribution](#areaspreaddistribution)
- [BlendAlphaMode](#blendalphamode)
- [BlendMode](#blendmode)
- [CompareMode](#comparemode)
- [CullMode](#cullmode)
- [DrawMode](#drawmode)
- [FilterMode](#filtermode)
- [GraphicsFeature](#graphicsfeature)
- [GraphicsLimit](#graphicslimit)
- [IndexDataType](#indexdatatype)
- [LineJoin](#linejoin)
- [LineStyle](#linestyle)
- [MeshDrawMode](#meshdrawmode)
- [MipmapMode](#mipmapmode)
- [ParticleInsertMode](#particleinsertmode)
- [SpriteBatchUsage](#spritebatchusage)
- [StackType](#stacktype)
- [StencilAction](#stencilaction)
- [TextureType](#texturetype)
- [VertexAttributeStep](#vertexattributestep)
- [VertexWinding](#vertexwinding)
- [WrapMode](#wrapmode)

---

## Functions

## love.graphics.applyTransform

Applies the given Transform object to the current coordinate transformation.

This effectively multiplies the existing coordinate transformation's matrix with the Transform object's internal matrix to produce the new coordinate transformation.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| transform | Transform |  | The Transform object to apply to the current graphics coordinate transform. |

**Returns:**

*No return values*

## love.graphics.arc

Draws a filled or unfilled arc at position (x, y). The arc is drawn from angle1 to angle2 in radians. The segments parameter determines how many segments are used to draw the arc. The more segments, the smoother the edge.

### Variant 1

Draws an arc using the 'pie' ArcType.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| drawmode | [DrawMode](#drawmode) |  | How to draw the arc. |
| x | number |  | The position of the center along x-axis. |
| y | number |  | The position of the center along y-axis. |
| radius | number |  | Radius of the arc. |
| angle1 | number |  | The angle at which the arc begins. |
| angle2 | number |  | The angle at which the arc terminates. |
| segments | number | 10 | The number of segments used for drawing the arc. |

**Returns:**

*No return values*

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| drawmode | [DrawMode](#drawmode) |  | How to draw the arc. |
| arctype | [ArcType](#arctype) |  | The type of arc to draw. |
| x | number |  | The position of the center along x-axis. |
| y | number |  | The position of the center along y-axis. |
| radius | number |  | Radius of the arc. |
| angle1 | number |  | The angle at which the arc begins. |
| angle2 | number |  | The angle at which the arc terminates. |
| segments | number | 10 | The number of segments used for drawing the arc. |

**Returns:**

*No return values*

## love.graphics.captureScreenshot

Creates a screenshot once the current frame is done (after love.draw has finished).

Since this function enqueues a screenshot capture rather than executing it immediately, it can be called from an input callback or love.update and it will still capture all of what's drawn to the screen in that frame.

### Variant 1

Capture a screenshot and save it to a file at the end of the current frame.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| filename | string |  | The filename to save the screenshot to. The encoded image type is determined based on the extension of the filename, and must be one of the ImageFormats. |

**Returns:**

*No return values*

### Variant 2

Capture a screenshot and call a callback with the generated ImageData at the end of the current frame.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| callback | function |  | Function which gets called once the screenshot has been captured. An ImageData is passed into the function as its only argument. |

**Returns:**

*No return values*

### Variant 3

Capture a screenshot and push the generated ImageData to a Channel at the end of the current frame.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| channel | Channel |  | The Channel to push the generated ImageData to. |

**Returns:**

*No return values*

## love.graphics.circle

Draws a circle.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| mode | [DrawMode](#drawmode) |  | How to draw the circle. |
| x | number |  | The position of the center along x-axis. |
| y | number |  | The position of the center along y-axis. |
| radius | number |  | The radius of the circle. |

**Returns:**

*No return values*

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| mode | [DrawMode](#drawmode) |  | How to draw the circle. |
| x | number |  | The position of the center along x-axis. |
| y | number |  | The position of the center along y-axis. |
| radius | number |  | The radius of the circle. |
| segments | number |  | The number of segments used for drawing the circle. Note: The default variable for the segments parameter varies between different versions of LÖVE. |

**Returns:**

*No return values*

## love.graphics.clear

Clears the screen or active Canvas to the specified color.

This function is called automatically before love.draw in the default love.run function. See the example in love.run for a typical use of this function.

Note that the scissor area bounds the cleared region.

In versions prior to 11.0, color component values were within the range of 0 to 255 instead of 0 to 1.

In versions prior to background color instead.

### Variant 1

Clears the screen to the background color in 0.9.2 and earlier, or to transparent black (0, 0, 0, 0) in LÖVE 0.10.0 and newer.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

### Variant 2

Clears the screen or active Canvas to the specified color.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| r | number |  | The red channel of the color to clear the screen to. |
| g | number |  | The green channel of the color to clear the screen to. |
| b | number |  | The blue channel of the color to clear the screen to. |
| a | number | 1 | The alpha channel of the color to clear the screen to. |
| clearstencil | boolean | true | Whether to clear the active stencil buffer, if present. It can also be an integer between 0 and 255 to clear the stencil buffer to a specific value. |
| cleardepth | boolean | true | Whether to clear the active depth buffer, if present. It can also be a number between 0 and 1 to clear the depth buffer to a specific value. |

**Returns:**

*No return values*

### Variant 3

Clears multiple active Canvases to different colors, if multiple Canvases are active at once via love.graphics.setCanvas.

A color must be specified for each active Canvas, when this function variant is used.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| color | table |  | A table in the form of {r, g, b, a} containing the color to clear the first active Canvas to. |
| ... | table |  | Additional tables for each active Canvas. |
| clearstencil | boolean | true | Whether to clear the active stencil buffer, if present. It can also be an integer between 0 and 255 to clear the stencil buffer to a specific value. |
| cleardepth | boolean | true | Whether to clear the active depth buffer, if present. It can also be a number between 0 and 1 to clear the depth buffer to a specific value. |

**Returns:**

*No return values*

### Variant 4

Clears the stencil or depth buffers without having to clear the color canvas as well.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| clearcolor | boolean |  | Whether to clear the active color canvas to transparent black (0, 0, 0, 0). Typically this should be set to false with this variant of the function. |
| clearstencil | boolean |  | Whether to clear the active stencil buffer, if present. It can also be an integer between 0 and 255 to clear the stencil buffer to a specific value. |
| cleardepth | boolean |  | Whether to clear the active depth buffer, if present. It can also be a number between 0 and 1 to clear the depth buffer to a specific value. |

**Returns:**

*No return values*

## love.graphics.discard

Discards (trashes) the contents of the screen or active Canvas. This is a performance optimization function with niche use cases.

If the active Canvas has just been changed and the 'replace' BlendMode is about to be used to draw something which covers the entire screen, calling love.graphics.discard rather than calling love.graphics.clear or doing nothing may improve performance on mobile devices.

On some desktop systems this function may do nothing.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| discardcolor | boolean | true | Whether to discard the texture(s) of the active Canvas(es) (the contents of the screen if no Canvas is active.) |
| discardstencil | boolean | true | Whether to discard the contents of the stencil buffer of the screen / active Canvas. |

**Returns:**

*No return values*

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| discardcolors | table |  | An array containing boolean values indicating whether to discard the texture of each active Canvas, when multiple simultaneous Canvases are active. |
| discardstencil | boolean | true | Whether to discard the contents of the stencil buffer of the screen / active Canvas. |

**Returns:**

*No return values*

## love.graphics.draw

Draws a Drawable object (an Image, Canvas, SpriteBatch, ParticleSystem, Mesh, Text object, or Video) on the screen with optional rotation, scaling and shearing.

Objects are drawn relative to their local coordinate system. The origin is by default located at the top left corner of Image and Canvas. All scaling, shearing, and rotation arguments transform the object relative to that point. Also, the position of the origin can be specified on the screen coordinate system.

It's possible to rotate an object about its center by offsetting the origin to the center. Angles must be given in radians for rotation. One can also use a negative scaling factor to flip about its centerline. 

Note that the offsets are applied before rotation, scaling, or shearing; scaling and shearing are applied before rotation.

The right and bottom edges of the object are shifted at an angle defined by the shearing factors.

When using the default shader anything drawn with this function will be tinted according to the currently selected color.  Set it to pure white to preserve the object's original colors.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| drawable | [Drawable](#drawable) |  | A drawable object. |
| x | number | 0 | The position to draw the object (x-axis). |
| y | number | 0 | The position to draw the object (y-axis). |
| r | number | 0 | Orientation (radians). |
| sx | number | 1 | Scale factor (x-axis). |
| sy | number | sx | Scale factor (y-axis). |
| ox | number | 0 | Origin offset (x-axis). |
| oy | number | 0 | Origin offset (y-axis). |
| kx | number | 0 | Shearing factor (x-axis). |
| ky | number | 0 | Shearing factor (y-axis). |

**Returns:**

*No return values*

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| texture | [Texture](#texture) |  | A Texture (Image or Canvas) to texture the Quad with. |
| quad | [Quad](#quad) |  | The Quad to draw on screen. |
| x | number |  | The position to draw the object (x-axis). |
| y | number |  | The position to draw the object (y-axis). |
| r | number | 0 | Orientation (radians). |
| sx | number | 1 | Scale factor (x-axis). |
| sy | number | sx | Scale factor (y-axis). |
| ox | number | 0 | Origin offset (x-axis). |
| oy | number | 0 | Origin offset (y-axis). |
| kx | number | 0 | Shearing factor (x-axis). |
| ky | number | 0 | Shearing factor (y-axis). |

**Returns:**

*No return values*

### Variant 3

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| drawable | [Drawable](#drawable) |  | A drawable object. |
| transform | Transform |  | Transformation object. |

**Returns:**

*No return values*

### Variant 4

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| texture | [Texture](#texture) |  | A Texture (Image or Canvas) to texture the Quad with. |
| quad | [Quad](#quad) |  | The Quad to draw on screen. |
| transform | Transform |  | Transformation object. |

**Returns:**

*No return values*

## love.graphics.drawInstanced

Draws many instances of a Mesh with a single draw call, using hardware geometry instancing.

Each instance can have unique properties (positions, colors, etc.) but will not by default unless a custom per-instance vertex attributes or the love_InstanceID GLSL 3 vertex shader variable is used, otherwise they will all render at the same position on top of each other.

Instancing is not supported by some older GPUs that are only capable of using OpenGL ES 2 or OpenGL 2. Use love.graphics.getSupported to check.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| mesh | [Mesh](#mesh) |  | The mesh to render. |
| instancecount | number |  | The number of instances to render. |
| x | number | 0 | The position to draw the instances (x-axis). |
| y | number | 0 | The position to draw the instances (y-axis). |
| r | number | 0 | Orientation (radians). |
| sx | number | 1 | Scale factor (x-axis). |
| sy | number | sx | Scale factor (y-axis). |
| ox | number | 0 | Origin offset (x-axis). |
| oy | number | 0 | Origin offset (y-axis). |
| kx | number | 0 | Shearing factor (x-axis). |
| ky | number | 0 | Shearing factor (y-axis). |

**Returns:**

*No return values*

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| mesh | [Mesh](#mesh) |  | The mesh to render. |
| instancecount | number |  | The number of instances to render. |
| transform | Transform |  | A transform object. |

**Returns:**

*No return values*

## love.graphics.drawLayer

Draws a layer of an Array Texture.

### Variant 1

Draws a layer of an Array Texture.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| texture | [Texture](#texture) |  | The Array Texture to draw. |
| layerindex | number |  | The index of the layer to use when drawing. |
| x | number | 0 | The position to draw the texture (x-axis). |
| y | number | 0 | The position to draw the texture (y-axis). |
| r | number | 0 | Orientation (radians). |
| sx | number | 1 | Scale factor (x-axis). |
| sy | number | sx | Scale factor (y-axis). |
| ox | number | 0 | Origin offset (x-axis). |
| oy | number | 0 | Origin offset (y-axis). |
| kx | number | 0 | Shearing factor (x-axis). |
| ky | number | 0 | Shearing factor (y-axis). |

**Returns:**

*No return values*

### Variant 2

Draws a layer of an Array Texture using the specified Quad.

The specified layer index overrides any layer index set on the Quad via Quad:setLayer.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| texture | [Texture](#texture) |  | The Array Texture to draw. |
| layerindex | number |  | The index of the layer to use when drawing. |
| quad | [Quad](#quad) |  | The subsection of the texture's layer to use when drawing. |
| x | number | 0 | The position to draw the texture (x-axis). |
| y | number | 0 | The position to draw the texture (y-axis). |
| r | number | 0 | Orientation (radians). |
| sx | number | 1 | Scale factor (x-axis). |
| sy | number | sx | Scale factor (y-axis). |
| ox | number | 0 | Origin offset (x-axis). |
| oy | number | 0 | Origin offset (y-axis). |
| kx | number | 0 | Shearing factor (x-axis). |
| ky | number | 0 | Shearing factor (y-axis). |

**Returns:**

*No return values*

### Variant 3

Draws a layer of an Array Texture using the specified Transform.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| texture | [Texture](#texture) |  | The Array Texture to draw. |
| layerindex | number |  | The index of the layer to use when drawing. |
| transform | Transform |  | A transform object. |

**Returns:**

*No return values*

### Variant 4

Draws a layer of an Array Texture using the specified Quad and Transform.

In order to use an Array Texture or other non-2D texture types as the main texture in a custom void effect() variant must be used in the pixel shader, and MainTex must be declared as an ArrayImage or sampler2DArray like so: uniform ArrayImage MainTex;.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| texture | [Texture](#texture) |  | The Array Texture to draw. |
| layerindex | number |  | The index of the layer to use when drawing. |
| quad | [Quad](#quad) |  | The subsection of the texture's layer to use when drawing. |
| transform | Transform |  | A transform object. |

**Returns:**

*No return values*

## love.graphics.ellipse

Draws an ellipse.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| mode | [DrawMode](#drawmode) |  | How to draw the ellipse. |
| x | number |  | The position of the center along x-axis. |
| y | number |  | The position of the center along y-axis. |
| radiusx | number |  | The radius of the ellipse along the x-axis (half the ellipse's width). |
| radiusy | number |  | The radius of the ellipse along the y-axis (half the ellipse's height). |

**Returns:**

*No return values*

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| mode | [DrawMode](#drawmode) |  | How to draw the ellipse. |
| x | number |  | The position of the center along x-axis. |
| y | number |  | The position of the center along y-axis. |
| radiusx | number |  | The radius of the ellipse along the x-axis (half the ellipse's width). |
| radiusy | number |  | The radius of the ellipse along the y-axis (half the ellipse's height). |
| segments | number |  | The number of segments used for drawing the ellipse. |

**Returns:**

*No return values*

## love.graphics.flushBatch

Immediately renders any pending automatically batched draws.

LÖVE will call this function internally as needed when most state is changed, so it is not necessary to manually call it.

The current batch will be automatically flushed by love.graphics state changes (except for the transform stack and the current color), as well as Shader:send and methods on Textures which change their state. Using a different Image in consecutive love.graphics.draw calls will also flush the current batch.

SpriteBatches, ParticleSystems, Meshes, and Text objects do their own batching and do not affect automatic batching of other draws, aside from flushing the current batch when they're drawn.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

## love.graphics.getBackgroundColor

Gets the current background color.

In versions prior to 11.0, color component values were within the range of 0 to 255 instead of 0 to 1.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| r | number | The red component (0-1). |
| g | number | The green component (0-1). |
| b | number | The blue component (0-1). |
| a | number | The alpha component (0-1). |

## love.graphics.getBlendMode

Gets the blending mode.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| mode | [BlendMode](#blendmode) | The current blend mode. |
| alphamode | [BlendAlphaMode](#blendalphamode) | The current blend alpha mode – it determines how the alpha of drawn objects affects blending. |

## love.graphics.getCanvas

Gets the current target Canvas.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| canvas | [Canvas](#canvas) | The Canvas set by setCanvas. Returns nil if drawing to the real screen. |

## love.graphics.getCanvasFormats

Gets the available Canvas formats, and whether each is supported.

### Variant 1

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| formats | table | A table containing CanvasFormats as keys, and a boolean indicating whether the format is supported as values. Not all systems support all formats. |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| readable | boolean |  | If true, the returned formats will only be indicated as supported if readable flag set to true for that format, and vice versa if the parameter is false. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| formats | table | A table containing CanvasFormats as keys, and a boolean indicating whether the format is supported as values (taking into account the readable parameter). Not all systems support all formats. |

## love.graphics.getColor

Gets the current color.

In versions prior to 11.0, color component values were within the range of 0 to 255 instead of 0 to 1.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| r | number | The red component (0-1). |
| g | number | The green component (0-1). |
| b | number | The blue component (0-1). |
| a | number | The alpha component (0-1). |

## love.graphics.getColorMask

Gets the active color components used when drawing. Normally all 4 components are active unless love.graphics.setColorMask has been used.

The color mask determines whether individual components of the colors of drawn objects will affect the color of the screen. They affect love.graphics.clear and Canvas:clear as well.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| r | boolean | Whether the red color component is active when rendering. |
| g | boolean | Whether the green color component is active when rendering. |
| b | boolean | Whether the blue color component is active when rendering. |
| a | boolean | Whether the alpha color component is active when rendering. |

## love.graphics.getDPIScale

Gets the DPI scale factor of the window.

The DPI scale factor represents relative pixel density. The pixel density inside the window might be greater (or smaller) than the 'size' of the window. For example on a retina screen in Mac OS X with the highdpi window flag enabled, the window may take up the same physical size as an 800x600 window, but the area inside the window uses 1600x1200 pixels. love.graphics.getDPIScale() would return 2 in that case.

The love.window.fromPixels and love.window.toPixels functions can also be used to convert between units.

The highdpi window flag must be enabled to use the full pixel density of a Retina screen on Mac OS X and iOS. The flag currently does nothing on Windows and Linux, and on Android it is effectively always enabled.

The units of love.graphics.getWidth, love.graphics.getHeight, love.mouse.getPosition, mouse events, love.touch.getPosition, and touch events are always in DPI-scaled units rather than pixels. In LÖVE 0.10 and older they were in pixels.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| scale | number | The pixel scale factor associated with the window. |

## love.graphics.getDefaultFilter

Returns the default scaling filters used with Images, Canvases, and Fonts.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| min | [FilterMode](#filtermode) | Filter mode used when scaling the image down. |
| mag | [FilterMode](#filtermode) | Filter mode used when scaling the image up. |
| anisotropy | number | Maximum amount of Anisotropic Filtering used. |

## love.graphics.getDepthMode

Gets the current depth test mode and whether writing to the depth buffer is enabled.

This is low-level functionality designed for use with custom vertex shaders and Meshes with custom vertex attributes. No higher level APIs are provided to set the depth of 2D graphics such as shapes, lines, and Images.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| comparemode | [CompareMode](#comparemode) | Depth comparison mode used for depth testing. |
| write | boolean | Whether to write update / write values to the depth buffer when rendering. |

## love.graphics.getDimensions

Gets the width and height in pixels of the window.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| width | number | The width of the window. |
| height | number | The height of the window. |

## love.graphics.getFont

Gets the current Font object.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| font | [Font](#font) | The current Font. Automatically creates and sets the default font, if none is set yet. |

## love.graphics.getFrontFaceWinding

Gets whether triangles with clockwise- or counterclockwise-ordered vertices are considered front-facing.

This is designed for use in combination with Mesh face culling. Other love.graphics shapes, lines, and sprites are not guaranteed to have a specific winding order to their internal vertices.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| winding | [VertexWinding](#vertexwinding) | The winding mode being used. The default winding is counterclockwise ('ccw'). |

## love.graphics.getHeight

Gets the height in pixels of the window.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| height | number | The height of the window. |

## love.graphics.getImageFormats

Gets the raw and compressed pixel formats usable for Images, and whether each is supported.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| formats | table | A table containing PixelFormats as keys, and a boolean indicating whether the format is supported as values. Not all systems support all formats. |

## love.graphics.getLineJoin

Gets the line join style.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| join | [LineJoin](#linejoin) | The LineJoin style. |

## love.graphics.getLineStyle

Gets the line style.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| style | [LineStyle](#linestyle) | The current line style. |

## love.graphics.getLineWidth

Gets the current line width.

This function does not work in 0.8.0, but has been fixed in version 0.9.0. Use the following snippet to circumvent this in 0.8.0;

love.graphics._getLineWidth = love.graphics.getLineWidth

love.graphics._setLineWidth = love.graphics.setLineWidth

function love.graphics.getLineWidth() return love.graphics.varlinewidth or 1 end

function love.graphics.setLineWidth(w) love.graphics.varlinewidth = w; return love.graphics._setLineWidth(w) end

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| width | number | The current line width. |

## love.graphics.getMeshCullMode

Gets whether back-facing triangles in a Mesh are culled.

Mesh face culling is designed for use with low level custom hardware-accelerated 3D rendering via custom vertex attributes on Meshes, custom vertex shaders, and depth testing with a depth buffer.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| mode | [CullMode](#cullmode) | The Mesh face culling mode in use (whether to render everything, cull back-facing triangles, or cull front-facing triangles). |

## love.graphics.getPixelDimensions

Gets the width and height in pixels of the window.

love.graphics.getDimensions gets the dimensions of the window in units scaled by the screen's DPI scale factor, rather than pixels. Use getDimensions for calculations related to drawing to the screen and using the graphics coordinate system (calculating the center of the screen, for example), and getPixelDimensions only when dealing specifically with underlying pixels (pixel-related calculations in a pixel Shader, for example).

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| pixelwidth | number | The width of the window in pixels. |
| pixelheight | number | The height of the window in pixels. |

## love.graphics.getPixelHeight

Gets the height in pixels of the window.

The graphics coordinate system and DPI scale factor, rather than raw pixels. Use getHeight for calculations related to drawing to the screen and using the coordinate system (calculating the center of the screen, for example), and getPixelHeight only when dealing specifically with underlying pixels (pixel-related calculations in a pixel Shader, for example).

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| pixelheight | number | The height of the window in pixels. |

## love.graphics.getPixelWidth

Gets the width in pixels of the window.

The graphics coordinate system and DPI scale factor, rather than raw pixels. Use getWidth for calculations related to drawing to the screen and using the coordinate system (calculating the center of the screen, for example), and getPixelWidth only when dealing specifically with underlying pixels (pixel-related calculations in a pixel Shader, for example).

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| pixelwidth | number | The width of the window in pixels. |

## love.graphics.getPointSize

Gets the point size.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| size | number | The current point size. |

## love.graphics.getRendererInfo

Gets information about the system's video card and drivers.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| name | string | The name of the renderer, e.g. 'OpenGL' or 'OpenGL ES'. |
| version | string | The version of the renderer with some extra driver-dependent version info, e.g. '2.1 INTEL-8.10.44'. |
| vendor | string | The name of the graphics card vendor, e.g. 'Intel Inc'.  |
| device | string | The name of the graphics card, e.g. 'Intel HD Graphics 3000 OpenGL Engine'. |

## love.graphics.getScissor

Gets the current scissor box.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| x | number | The x-component of the top-left point of the box. |
| y | number | The y-component of the top-left point of the box. |
| width | number | The width of the box. |
| height | number | The height of the box. |

## love.graphics.getShader

Gets the current Shader. Returns nil if none is set.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| shader | [Shader](#shader) | The currently active Shader, or nil if none is set. |

## love.graphics.getStackDepth

Gets the current depth of the transform / state stack (the number of pushes without corresponding pops).

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| depth | number | The current depth of the transform and state love.graphics stack. |

## love.graphics.getStats

Gets performance-related rendering statistics. 

### Variant 1

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| stats | table | A table with the following fields: (see table fields below) |

**stats table fields:**

| Name | Type | Description |
| --- | --- | --- |
| drawcalls | number | The number of draw calls made so far during the current frame. |
| canvasswitches | number | The number of times the active Canvas has been switched so far during the current frame. |
| texturememory | number | The estimated total size in bytes of video memory used by all loaded Images, Canvases, and Fonts. |
| images | number | The number of Image objects currently loaded. |
| canvases | number | The number of Canvas objects currently loaded. |
| fonts | number | The number of Font objects currently loaded. |
| shaderswitches | number | The number of times the active Shader has been changed so far during the current frame. |
| drawcallsbatched | number | The number of draw calls that were saved by LÖVE's automatic batching, since the start of the frame. |

### Variant 2

This variant accepts an existing table to fill in, instead of creating a new one.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| stats | table |  | A table which will be filled in with the stat fields below. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| stats | table | The table that was passed in above, now containing the following fields: (see table fields below) |

**stats table fields:**

| Name | Type | Description |
| --- | --- | --- |
| drawcalls | number | The number of draw calls made so far during the current frame. |
| canvasswitches | number | The number of times the active Canvas has been switched so far during the current frame. |
| texturememory | number | The estimated total size in bytes of video memory used by all loaded Images, Canvases, and Fonts. |
| images | number | The number of Image objects currently loaded. |
| canvases | number | The number of Canvas objects currently loaded. |
| fonts | number | The number of Font objects currently loaded. |
| shaderswitches | number | The number of times the active Shader has been changed so far during the current frame. |
| drawcallsbatched | number | The number of draw calls that were saved by LÖVE's automatic batching, since the start of the frame. |

## love.graphics.getStencilTest

Gets the current stencil test configuration.

When stencil testing is enabled, the geometry of everything that is drawn afterward will be clipped / stencilled out based on a comparison between the arguments of this function and the stencil value of each pixel that the geometry touches. The stencil values of pixels are affected via love.graphics.stencil.

Each Canvas has its own per-pixel stencil values.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| comparemode | [CompareMode](#comparemode) | The type of comparison that is made for each pixel. Will be 'always' if stencil testing is disabled. |
| comparevalue | number | The value used when comparing with the stencil value of each pixel. |

## love.graphics.getSupported

Gets the optional graphics features and whether they're supported on the system.

Some older or low-end systems don't always support all graphics features.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| features | table | A table containing GraphicsFeature keys, and boolean values indicating whether each feature is supported. |

## love.graphics.getSystemLimits

Gets the system-dependent maximum values for love.graphics features.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| limits | table | A table containing GraphicsLimit keys, and number values. |

## love.graphics.getTextureTypes

Gets the available texture types, and whether each is supported.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| texturetypes | table | A table containing TextureTypes as keys, and a boolean indicating whether the type is supported as values. Not all systems support all types. |

## love.graphics.getWidth

Gets the width in pixels of the window.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| width | number | The width of the window. |

## love.graphics.intersectScissor

Sets the scissor to the rectangle created by the intersection of the specified rectangle with the existing scissor.  If no scissor is active yet, it behaves like love.graphics.setScissor.

The scissor limits the drawing area to a specified rectangle. This affects all graphics calls, including love.graphics.clear.

The dimensions of the scissor is unaffected by graphical transformations (translate, scale, ...).

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | The x-coordinate of the upper left corner of the rectangle to intersect with the existing scissor rectangle. |
| y | number |  | The y-coordinate of the upper left corner of the rectangle to intersect with the existing scissor rectangle. |
| width | number |  | The width of the rectangle to intersect with the existing scissor rectangle. |
| height | number |  | The height of the rectangle to intersect with the existing scissor rectangle. |

**Returns:**

*No return values*

## love.graphics.inverseTransformPoint

Converts the given 2D position from screen-space into global coordinates.

This effectively applies the reverse of the current graphics transformations to the given position. A similar Transform:inverseTransformPoint method exists for Transform objects.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| screenX | number |  | The x component of the screen-space position. |
| screenY | number |  | The y component of the screen-space position. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| globalX | number | The x component of the position in global coordinates. |
| globalY | number | The y component of the position in global coordinates. |

## love.graphics.isActive

Gets whether the graphics module is able to be used. If it is not active, love.graphics function and method calls will not work correctly and may cause the program to crash.
The graphics module is inactive if a window is not open, or if the app is in the background on iOS. Typically the app's execution will be automatically paused by the system, in the latter case.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| active | boolean | Whether the graphics module is active and able to be used. |

## love.graphics.isGammaCorrect

Gets whether gamma-correct rendering is supported and enabled. It can be enabled by setting t.gammacorrect = true in love.conf.

Not all devices support gamma-correct rendering, in which case it will be automatically disabled and this function will return false. It is supported on desktop systems which have graphics cards that are capable of using OpenGL 3 / DirectX 10, and iOS devices that can use OpenGL ES 3.

When gamma-correct rendering is enabled, many functions and objects perform automatic color conversion between sRGB and linear RGB in order for blending and shader math to be mathematically correct (which they aren't if it's not enabled.)

* The colors passed into converted from sRGB to linear RGB.

* The colors set in text with per-character colors, points with per-point colors, standard custom Meshes which use the 'VertexColor' attribute name will automatically be converted from sRGB to linear RGB when those objects are drawn.

* creating the Image.

* Everything drawn to the screen will be blended in linear RGB and then the result will be converted to sRGB for display.

* Canvases which use the 'normal' or 'srgb' CanvasFormat will have their content blended in linear RGB and the result will be stored in the canvas in sRGB, when drawing to them. When the Canvas itself is drawn, its pixel colors will be converted from sRGB to linear RGB in the same manner as Images. Keeping the canvas pixel data stored as sRGB allows for better precision (less banding) for darker colors compared to 'rgba8'.

Because most conversions are automatically handled, your own code doesn't need to worry about sRGB and linear RGB color conversions when gamma-correct rendering is enabled, except in a couple cases:

* If a Mesh with custom vertex attributes is used and one of the attributes is meant to be used as a color in a Shader, and the attribute isn't named 'VertexColor'.

* If  a Shader is used which has uniform / extern variables or other variables that are meant to be used as colors, and Shader:sendColor isn't used.

In both cases, love.math.gammaToLinear can be used to convert color values to linear RGB in Lua code, or the gammaCorrectColor (or unGammaCorrectColor if necessary) shader functions can be used inside shader code. Those shader functions ''only'' do conversions if gamma-correct rendering is actually enabled. The LOVE_GAMMA_CORRECT shader preprocessor define will be set if so.

Read more about gamma-correct rendering here, here, and here.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| gammacorrect | boolean | True if gamma-correct rendering is supported and was enabled in love.conf, false otherwise. |

## love.graphics.isWireframe

Gets whether wireframe mode is used when drawing.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| wireframe | boolean | True if wireframe lines are used when drawing, false if it's not. |

## love.graphics.line

Draws lines between points.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x1 | number |  | The position of first point on the x-axis. |
| y1 | number |  | The position of first point on the y-axis. |
| x2 | number |  | The position of second point on the x-axis. |
| y2 | number |  | The position of second point on the y-axis. |
| ... | number |  | You can continue passing point positions to draw a polyline. |

**Returns:**

*No return values*

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| points | table |  | A table of point positions, as described above. |

**Returns:**

*No return values*

## love.graphics.newArrayImage

Creates a new array Image.

An array image / array texture is a single object which contains multiple 'layers' or 'slices' of 2D sub-images. It can be thought of similarly to a texture atlas or sprite sheet, but it doesn't suffer from the same tile / quad bleeding artifacts that texture atlases do – although every sub-image must have the same dimensions.

A specific layer of an array image can be drawn with love.graphics.drawLayer / SpriteBatch:addLayer, or with the Quad variant of love.graphics.draw and Quad:setLayer, or via a custom Shader.

To use an array image in a Shader, it must be declared as a ArrayImage or sampler2DArray type (instead of Image or sampler2D). The Texel(ArrayImage image, vec3 texturecoord) shader function must be used to get pixel colors from a slice of the array image. The vec3 argument contains the texture coordinate in the first two components, and the 0-based slice index in the third component.

Creates an array Image given a different image file for each slice of the resulting array image object.

Illustration of how an array image works: [http://codeflow.org/entries/2010/dec/09/minecraft-like-rendering-experiments-in-opengl-4/illustrations/textures.jpg]

A DPI scale of 2 (double the normal pixel density) will result in the image taking up the same space on-screen as an image with half its pixel dimensions that has a DPI scale of 1. This allows for easily swapping out image assets that take the same space on-screen but have different pixel densities, which makes supporting high-dpi / retina resolution require less code logic.

In order to use an Array Texture or other non-2D texture types as the main texture in a custom void effect() variant must be used in the pixel shader, and MainTex must be declared as an ArrayImage or sampler2DArray like so: uniform ArrayImage MainTex;.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| slices | table |  | A table containing filepaths to images (or File, FileData, ImageData, or CompressedImageData objects), in an array. Each sub-image must have the same dimensions. A table of tables can also be given, where each sub-table contains all mipmap levels for the slice index of that sub-table. |
| settings | table | nil | Optional table of settings to configure the array image, containing the following fields: (see table fields below) |

**settings table fields:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| mipmaps | boolean | false | True to make the image use mipmaps, false to disable them. Mipmaps will be automatically generated if the image isn't a compressed texture format. |
| linear | boolean | false | True to treat the image's pixels as linear instead of sRGB, when gamma correct rendering is enabled. Most images are authored as sRGB. |
| dpiscale | number | 1 | The DPI scale to use when drawing the array image and calling getWidth/getHeight. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| image | [Image](#image) | An Array Image object. |

## love.graphics.newCanvas

Creates a new Canvas object for offscreen rendering.

### Variant 1

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| canvas | [Canvas](#canvas) | A new Canvas with dimensions equal to the window's size in pixels. |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| width | number |  | The desired width of the Canvas. |
| height | number |  | The desired height of the Canvas. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| canvas | [Canvas](#canvas) | A new Canvas with specified width and height. |

### Variant 3

Creates a 2D or cubemap Canvas using the given settings.

Some Canvas formats have higher system requirements than the default format. Use love.graphics.getCanvasFormats to check for support.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| width | number |  | The desired width of the Canvas. |
| height | number |  | The desired height of the Canvas. |
| settings | table | nil | A table containing the given fields: (see table fields below) |

**settings table fields:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| type | [TextureType](#texturetype) | '2d' | The type of Canvas to create. |
| format | PixelFormat | 'normal' | The format of the Canvas. |
| readable | boolean |  | Whether the Canvas is readable (drawable and accessible in a Shader). True by default for regular formats, false by default for depth/stencil formats. |
| msaa | number | 0 | The desired number of multisample antialiasing (MSAA) samples used when drawing to the Canvas. |
| dpiscale | number | love.graphics.getDPIScale() | The DPI scale factor of the Canvas, used when drawing to the Canvas as well as when drawing the Canvas to the screen. |
| mipmaps | [MipmapMode](#mipmapmode) | 'none' | Whether the Canvas has mipmaps, and whether to automatically regenerate them if so. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| canvas | [Canvas](#canvas) | A new Canvas with specified width and height. |

### Variant 4

Creates a volume or array texture-type Canvas.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| width | number |  | The desired width of the Canvas. |
| height | number |  | The desired height of the Canvas. |
| layers | number |  | The number of array layers (if the Canvas is an Array Texture), or the volume depth (if the Canvas is a Volume Texture). |
| settings | table | nil | A table containing the given fields: (see table fields below) |

**settings table fields:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| type | [TextureType](#texturetype) | 'array' | The type of Canvas to create. |
| format | PixelFormat | 'normal' | The format of the Canvas. |
| readable | boolean | nil | Whether the Canvas is readable (drawable and accessible in a Shader). True by default for regular formats, false by default for depth/stencil formats. |
| msaa | number | 0 | The desired number of multisample antialiasing (MSAA) samples used when drawing to the Canvas. |
| dpiscale | number | love.graphics.getDPIScale() | The DPI scale factor of the Canvas, used when drawing to the Canvas as well as when drawing the Canvas to the screen. |
| mipmaps | [MipmapMode](#mipmapmode) | 'none' | Whether the Canvas has mipmaps, and whether to automatically regenerate them if so. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| canvas | [Canvas](#canvas) | A new Canvas with specified width and height. |

## love.graphics.newCubeImage

Creates a new cubemap Image.

Cubemap images have 6 faces (sides) which represent a cube. They can't be rendered directly, they can only be used in Shader code (and sent to the shader via Shader:send).

To use a cubemap image in a Shader, it must be declared as a CubeImage or samplerCube type (instead of Image or sampler2D). The Texel(CubeImage image, vec3 direction) shader function must be used to get pixel colors from the cubemap. The vec3 argument is a normalized direction from the center of the cube, rather than explicit texture coordinates.

Each face in a cubemap image must have square dimensions.

For variants of this function which accept a single image containing multiple cubemap faces, they must be laid out in one of the following forms in the image:

   +y

+z +x -z

   -y

   -x

or:

   +y

-x +z +x -z

   -y

or:

+x

-x

+y

-y

+z

-z

or:

+x -x +y -y +z -z

### Variant 1

Creates a cubemap Image given a single image file containing multiple cube faces.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| filename | string |  | The filepath to a cubemap image file (or a File, FileData, or ImageData). |
| settings | table | nil | Optional table of settings to configure the cubemap image, containing the following fields: (see table fields below) |

**settings table fields:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| mipmaps | boolean | false | True to make the image use mipmaps, false to disable them. Mipmaps will be automatically generated if the image isn't a compressed texture format. |
| linear | boolean | false | True to treat the image's pixels as linear instead of sRGB, when gamma correct rendering is enabled. Most images are authored as sRGB. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| image | [Image](#image) | An cubemap Image object. |

### Variant 2

Creates a cubemap Image given a different image file for each cube face.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| faces | table |  | A table containing 6 filepaths to images (or File, FileData, ImageData, or CompressedImageData objects), in an array. Each face image must have the same dimensions. A table of tables can also be given, where each sub-table contains all mipmap levels for the cube face index of that sub-table. |
| settings | table | nil | Optional table of settings to configure the cubemap image, containing the following fields: (see table fields below) |

**settings table fields:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| mipmaps | boolean | false | True to make the image use mipmaps, false to disable them. Mipmaps will be automatically generated if the image isn't a compressed texture format. |
| linear | boolean | false | True to treat the image's pixels as linear instead of sRGB, when gamma correct rendering is enabled. Most images are authored as sRGB. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| image | [Image](#image) | An cubemap Image object. |

## love.graphics.newFont

Creates a new Font from a TrueType Font or BMFont file. Created fonts are not cached, in that calling this function with the same arguments will always create a new Font object.

All variants which accept a filename can also accept a Data object instead.

### Variant 1

Create a new BMFont or TrueType font.

If the file is a TrueType font, it will be size 12. Use the variant below to create a TrueType font with a custom size.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| filename | string |  | The filepath to the BMFont or TrueType font file. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| font | [Font](#font) | A Font object which can be used to draw text on screen. |

### Variant 2

Create a new TrueType font.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| filename | string |  | The filepath to the TrueType font file. |
| size | number |  | The size of the font in pixels. |
| hinting | HintingMode | 'normal' | True Type hinting mode. |
| dpiscale | number | love.graphics.getDPIScale() | The DPI scale factor of the font. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| font | [Font](#font) | A Font object which can be used to draw text on screen. |

### Variant 3

Create a new BMFont.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| filename | string |  | The filepath to the BMFont file. |
| imagefilename | string |  | The filepath to the BMFont's image file. If this argument is omitted, the path specified inside the BMFont file will be used. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| font | [Font](#font) | A Font object which can be used to draw text on screen. |

### Variant 4

Create a new instance of the default font (Vera Sans) with a custom size.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| size | number | 12 | The size of the font in pixels. |
| hinting | HintingMode | 'normal' | True Type hinting mode. |
| dpiscale | number | love.graphics.getDPIScale() | The DPI scale factor of the font. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| font | [Font](#font) | A Font object which can be used to draw text on screen. |

## love.graphics.newImage

Creates a new Image from a filepath, FileData, an ImageData, or a CompressedImageData, and optionally generates or specifies mipmaps for the image.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| filename | string |  | The filepath to the image file. |
| settings | table | nil | A table containing the following fields: (see table fields below) |

**settings table fields:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| dpiscale | number | 1 | The DPI scale to use when drawing the image and calling getWidth/getHeight. |
| linear | boolean | false | True to treat the image's pixels as linear instead of sRGB, when gamma correct rendering is enabled. Most images are authored as sRGB. |
| mipmaps | boolean | false | If true, mipmaps for the image will be automatically generated (or taken from the images's file if possible, if the image originated from a CompressedImageData). |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| image | [Image](#image) | A new Image object which can be drawn on screen. |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| fileData | FileData |  | The FileData containing image file. |
| settings | table | nil | A table containing the following fields: (see table fields below) |

**settings table fields:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| dpiscale | number | 1 | The DPI scale to use when drawing the image and calling getWidth/getHeight. |
| linear | boolean | false | True to treat the image's pixels as linear instead of sRGB, when gamma correct rendering is enabled. Most images are authored as sRGB. |
| mipmaps | boolean | false | If true, mipmaps for the image will be automatically generated (or taken from the images's file if possible, if the image originated from a CompressedImageData). |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| image | [Image](#image) | A new Image object which can be drawn on screen. |

### Variant 3

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| imageData | ImageData |  | The ImageData containing image. |
| settings | table | nil | A table containing the following fields: (see table fields below) |

**settings table fields:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| dpiscale | number | 1 | The DPI scale to use when drawing the image and calling getWidth/getHeight. |
| linear | boolean | false | True to treat the image's pixels as linear instead of sRGB, when gamma correct rendering is enabled. Most images are authored as sRGB. |
| mipmaps | boolean | false | If true, mipmaps for the image will be automatically generated (or taken from the images's file if possible, if the image originated from a CompressedImageData). |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| image | [Image](#image) | A new Image object which can be drawn on screen. |

### Variant 4

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| compressedImageData | CompressedImageData |  | A CompressedImageData object. The Image will use this CompressedImageData to reload itself when love.window.setMode is called. |
| settings | table | nil | A table containing the following fields: (see table fields below) |

**settings table fields:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| dpiscale | number | 1 | The DPI scale to use when drawing the image and calling getWidth/getHeight. |
| linear | boolean | false | True to treat the image's pixels as linear instead of sRGB, when gamma correct rendering is enabled. Most images are authored as sRGB. |
| mipmaps | boolean | false | If true, mipmaps for the image will be automatically generated (or taken from the images's file if possible, if the image originated from a CompressedImageData). |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| image | [Image](#image) | A new Image object which can be drawn on screen. |

## love.graphics.newImageFont

Creates a new specifically formatted image.

In versions prior to 0.9.0, LÖVE expects ISO 8859-1 encoding for the glyphs string.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| filename | string |  | The filepath to the image file. |
| glyphs | string |  | A string of the characters in the image in order from left to right. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| font | [Font](#font) | A Font object which can be used to draw text on screen. |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| imageData | ImageData |  | The ImageData object to create the font from. |
| glyphs | string |  | A string of the characters in the image in order from left to right. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| font | [Font](#font) | A Font object which can be used to draw text on screen. |

### Variant 3

Instead of using this function, consider using a BMFont generator such as bmfont, littera, or bmGlyph with love.graphics.newFont. Because slime said it was better.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| filename | string |  | The filepath to the image file. |
| glyphs | string |  | A string of the characters in the image in order from left to right. |
| extraspacing | number |  | Additional spacing (positive or negative) to apply to each glyph in the Font. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| font | [Font](#font) | A Font object which can be used to draw text on screen. |

## love.graphics.newMesh

Creates a new Mesh.

Use Mesh:setTexture if the Mesh should be textured with an Image or Canvas when it's drawn.

In versions prior to 11.0, color and byte component values were within the range of 0 to 255 instead of 0 to 1.

### Variant 1

Creates a standard Mesh with the specified vertices.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| vertices | table |  | The table filled with vertex information tables for each vertex as follows: (see table fields below) |
| mode | [MeshDrawMode](#meshdrawmode) | 'fan' | How the vertices are used when drawing. The default mode 'fan' is sufficient for simple convex polygons. |
| usage | [SpriteBatchUsage](#spritebatchusage) | 'dynamic' | The expected usage of the Mesh. The specified usage mode affects the Mesh's memory usage and performance. |

**vertices table fields:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| 1 | number |  | The position of the vertex on the x-axis. |
| 2 | number |  | The position of the vertex on the y-axis. |
| 3 | number | 0 | The u texture coordinate of the vertex. Texture coordinates are normally in the range of 1, but can be greater or less (see WrapMode.) |
| 4 | number | 0 | The v texture coordinate of the vertex. Texture coordinates are normally in the range of 1, but can be greater or less (see WrapMode.) |
| 5 | number | 1 | The red component of the vertex color. |
| 6 | number | 1 | The green component of the vertex color. |
| 7 | number | 1 | The blue component of the vertex color. |
| 8 | number | 1 | The alpha component of the vertex color. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| mesh | [Mesh](#mesh) | The new mesh. |

### Variant 2

Creates a standard Mesh with the specified number of vertices.

Mesh:setVertices or Mesh:setVertex and Mesh:setDrawRange can be used to specify vertex information once the Mesh is created.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| vertexcount | number |  | The total number of vertices the Mesh will use. Each vertex is initialized to {0,0, 0,0, 1,1,1,1}. |
| mode | [MeshDrawMode](#meshdrawmode) | 'fan' | How the vertices are used when drawing. The default mode 'fan' is sufficient for simple convex polygons. |
| usage | [SpriteBatchUsage](#spritebatchusage) | 'dynamic' | The expected usage of the Mesh. The specified usage mode affects the Mesh's memory usage and performance. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| mesh | [Mesh](#mesh) | The new mesh. |

### Variant 3

Creates a Mesh with custom vertex attributes and the specified vertex data.

The values in each vertex table are in the same order as the vertex attributes in the specified vertex format. If no value is supplied for a specific vertex attribute component, it will be set to a default value of 0 if its data type is 'float', or 1 if its data type is 'byte'.

If the data type of an attribute is 'float', components can be in the range 1 to 4, if the data type is 'byte' it must be 4.

If a custom vertex attribute uses the name 'VertexPosition', 'VertexTexCoord', or 'VertexColor', then the vertex data for that vertex attribute will be used for the standard vertex positions, texture coordinates, or vertex colors respectively, when drawing the Mesh. Otherwise a Vertex Shader is required in order to make use of the vertex attribute when the Mesh is drawn.

A Mesh '''must''' have a 'VertexPosition' attribute in order to be drawn, but it can be attached from a different Mesh via Mesh:attachAttribute.

To use a custom named vertex attribute in a Vertex Shader, it must be declared as an attribute variable of the same name. Variables can be sent from Vertex Shader code to Pixel Shader code by making a varying variable. For example:

''Vertex Shader code''

attribute vec2 CoolVertexAttribute;

varying vec2 CoolVariable;

vec4 position(mat4 transform_projection, vec4 vertex_position)

{

    CoolVariable = CoolVertexAttribute;

    return transform_projection * vertex_position;

}

''Pixel Shader code''

varying vec2 CoolVariable;

vec4 effect(vec4 color, Image tex, vec2 texcoord, vec2 pixcoord)

{

    vec4 texcolor = Texel(tex, texcoord + CoolVariable);

    return texcolor * color;

}

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| vertexformat | table |  | A table in the form of {attribute, ...}. Each attribute is a table which specifies a custom vertex attribute used for each vertex. (see table fields below) |
| vertices | table |  | The table filled with vertex information tables for each vertex, in the form of {vertex, ...} where each vertex is a table in the form of {attributecomponent, ...}. (see table fields below) |
| mode | [MeshDrawMode](#meshdrawmode) | 'fan' | How the vertices are used when drawing. The default mode 'fan' is sufficient for simple convex polygons. |
| usage | [SpriteBatchUsage](#spritebatchusage) | 'dynamic' | The expected usage of the Mesh. The specified usage mode affects the Mesh's memory usage and performance. |

**vertexformat table fields:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| attribute | table |  | A table containing the attribute's name, it's data type, and the number of components in the attribute, in the form of {name, datatype, components}. |
| ... | table |  | Additional vertex attribute format tables. |

**vertices table fields:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| attributecomponent | number |  | The first component of the first vertex attribute in the vertex. |
| ... | number |  | Additional components of all vertex attributes in the vertex. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| mesh | [Mesh](#mesh) | The new mesh. |

### Variant 4

Creates a Mesh with custom vertex attributes and the specified number of vertices.

Each vertex attribute component is initialized to 0 if its data type is 'float', or 1 if its data type is 'byte'. Vertex Shader is required in order to make use of the vertex attribute when the Mesh is drawn.

A Mesh '''must''' have a 'VertexPosition' attribute in order to be drawn, but it can be attached from a different Mesh via Mesh:attachAttribute.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| vertexformat | table |  | A table in the form of {attribute, ...}. Each attribute is a table which specifies a custom vertex attribute used for each vertex. (see table fields below) |
| vertexcount | number |  | The total number of vertices the Mesh will use. |
| mode | [MeshDrawMode](#meshdrawmode) | 'fan' | How the vertices are used when drawing. The default mode 'fan' is sufficient for simple convex polygons. |
| usage | [SpriteBatchUsage](#spritebatchusage) | 'dynamic' | The expected usage of the Mesh. The specified usage mode affects the Mesh's memory usage and performance. |

**vertexformat table fields:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| attribute | table |  | A table containing the attribute's name, it's data type, and the number of components in the attribute, in the form of {name, datatype, components}. |
| ... | table |  | Additional vertex attribute format tables. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| mesh | [Mesh](#mesh) | The new mesh. |

### Variant 5

Mesh:setVertices or Mesh:setVertex and Mesh:setDrawRange can be used to specify vertex information once the Mesh is created.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| vertexcount | number |  | The total number of vertices the Mesh will use. Each vertex is initialized to {0,0, 0,0, 255,255,255,255}. |
| texture | [Texture](#texture) | nil | The Image or Canvas to use when drawing the Mesh. May be nil to use no texture. |
| mode | [MeshDrawMode](#meshdrawmode) | 'fan' | How the vertices are used when drawing. The default mode 'fan' is sufficient for simple convex polygons. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| mesh | [Mesh](#mesh) | The new mesh. |

## love.graphics.newParticleSystem

Creates a new ParticleSystem.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| image | [Image](#image) |  | The image to use. |
| buffer | number | 1000 | The max number of particles at the same time. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| system | [ParticleSystem](#particlesystem) | A new ParticleSystem. |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| texture | [Texture](#texture) |  | The texture (Image or Canvas) to use. |
| buffer | number | 1000 | The max number of particles at the same time. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| system | [ParticleSystem](#particlesystem) | A new ParticleSystem. |

## love.graphics.newQuad

Creates a new Quad.

The purpose of a Quad is to use a fraction of an image to draw objects, as opposed to drawing entire image. It is most useful for sprite sheets and atlases: in a sprite atlas, multiple sprites reside in same image, quad is used to draw a specific sprite from that image; in animated sprites with all frames residing in the same image, quad is used to draw specific frame from the animation.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | The top-left position in the Image along the x-axis. |
| y | number |  | The top-left position in the Image along the y-axis. |
| width | number |  | The width of the Quad in the Image. (Must be greater than 0.) |
| height | number |  | The height of the Quad in the Image. (Must be greater than 0.) |
| sw | number |  | The reference width, the width of the Image. (Must be greater than 0.) |
| sh | number |  | The reference height, the height of the Image. (Must be greater than 0.) |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| quad | [Quad](#quad) | The new Quad. |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | The top-left position in the Image along the x-axis. |
| y | number |  | The top-left position in the Image along the y-axis. |
| width | number |  | The width of the Quad in the Image. (Must be greater than 0.) |
| height | number |  | The height of the Quad in the Image. (Must be greater than 0.) |
| texture | [Texture](#texture) |  | The texture whose width and height will be used as the reference width and height. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| quad | [Quad](#quad) | The new Quad. |

## love.graphics.newShader

Creates a new Shader object for hardware-accelerated vertex and pixel effects. A Shader contains either vertex shader code, pixel shader code, or both.

Shaders are small programs which are run on the graphics card when drawing. Vertex shaders are run once for each vertex (for example, an image has 4 vertices - one at each corner. A Mesh might have many more.) Pixel shaders are run once for each pixel on the screen which the drawn object touches. Pixel shader code is executed after all the object's vertices have been processed by the vertex shader.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| code | string |  | The pixel shader or vertex shader code, or a filename pointing to a file with the code. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| shader | [Shader](#shader) | A Shader object for use in drawing operations. |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| pixelcode | string |  | The pixel shader code, or a filename pointing to a file with the code. |
| vertexcode | string |  | The vertex shader code, or a filename pointing to a file with the code. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| shader | [Shader](#shader) | A Shader object for use in drawing operations. |

## love.graphics.newSpriteBatch

Creates a new SpriteBatch object.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| image | [Image](#image) |  | The Image to use for the sprites. |
| maxsprites | number | 1000 | The maximum number of sprites that the SpriteBatch can contain at any given time. Since version 11.0, additional sprites added past this number will automatically grow the spritebatch. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| spriteBatch | [SpriteBatch](#spritebatch) | The new SpriteBatch. |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| image | [Image](#image) |  | The Image to use for the sprites. |
| maxsprites | number | 1000 | The maximum number of sprites that the SpriteBatch can contain at any given time. Since version 11.0, additional sprites added past this number will automatically grow the spritebatch. |
| usage | [SpriteBatchUsage](#spritebatchusage) | 'dynamic' | The expected usage of the SpriteBatch. The specified usage mode affects the SpriteBatch's memory usage and performance. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| spriteBatch | [SpriteBatch](#spritebatch) | The new SpriteBatch. |

### Variant 3

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| texture | [Texture](#texture) |  | The Image or Canvas to use for the sprites. |
| maxsprites | number | 1000 | The maximum number of sprites that the SpriteBatch can contain at any given time. Since version 11.0, additional sprites added past this number will automatically grow the spritebatch. |
| usage | [SpriteBatchUsage](#spritebatchusage) | 'dynamic' | The expected usage of the SpriteBatch. The specified usage mode affects the SpriteBatch's memory usage and performance. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| spriteBatch | [SpriteBatch](#spritebatch) | The new SpriteBatch. |

## love.graphics.newText

Creates a new drawable Text object.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| font | [Font](#font) |  | The font to use for the text. |
| textstring | string | nil | The initial string of text that the new Text object will contain. May be nil. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| text | [Text](#text) | The new drawable Text object. |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| font | [Font](#font) |  | The font to use for the text. |
| coloredtext | table |  | A table containing colors and strings to add to the object, in the form of {color1, string1, color2, string2, ...}. (see table fields below) |

**coloredtext table fields:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| color1 | table |  | A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}. |
| string1 | string |  | A string of text which has a color specified by the previous color. |
| color2 | table |  | A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}. |
| string2 | string |  | A string of text which has a color specified by the previous color. |
| ... | Variant |  | Additional colors and strings. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| text | [Text](#text) | The new drawable Text object. |

## love.graphics.newVideo

Creates a new drawable Video. Currently only Ogg Theora video files are supported.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| filename | string |  | The file path to the Ogg Theora video file. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| video | [Video](#video) | A new Video. |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| videostream | VideoStream |  | A video stream object. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| video | [Video](#video) | A new Video. |

### Variant 3

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| filename | string |  | The file path to the Ogg Theora video file (or VideoStream). |
| settings | table | nil | A table containing the following fields: (see table fields below) |

**settings table fields:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| audio | boolean | false | Whether to try to load the video's audio into an audio Source. If not explicitly set to true or false, it will try without causing an error if the video has no audio. |
| dpiscale | number | love.graphics.getDPIScale() | The DPI scale factor of the video. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| video | [Video](#video) | A new Video. |

### Variant 4

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| filename | string |  | The file path to the Ogg Theora video file. |
| loadaudio | boolean | nil | Whether to try to load the video's audio into an audio Source. If not explicitly set to true or false, it will try without causing an error if the video has no audio. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| video | [Video](#video) | A new Video. |

### Variant 5

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| videostream | VideoStream |  | A video stream object. |
| loadaudio | boolean | nil | Whether to try to load the video's audio into an audio Source. If not explicitly set to true or false, it will try without causing an error if the video has no audio. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| video | [Video](#video) | A new Video. |

## love.graphics.newVolumeImage

Creates a new volume (3D) Image.

Volume images are 3D textures with width, height, and depth. They can't be rendered directly, they can only be used in Shader code (and sent to the shader via Shader:send).

To use a volume image in a Shader, it must be declared as a VolumeImage or sampler3D type (instead of Image or sampler2D). The Texel(VolumeImage image, vec3 texcoords) shader function must be used to get pixel colors from the volume image. The vec3 argument is a normalized texture coordinate with the z component representing the depth to sample at (ranging from 1).

Volume images are typically used as lookup tables in shaders for color grading, for example, because sampling using a texture coordinate that is partway in between two pixels can interpolate across all 3 dimensions in the volume image, resulting in a smooth gradient even when a small-sized volume image is used as the lookup table.

Array images are a much better choice than volume images for storing multiple different sprites in a single array image for directly drawing them.

Creates a volume Image given multiple image files with matching dimensions.

Volume images are not supported on some older mobile devices. Use love.graphics.getTextureTypes to check at runtime.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| layers | table |  | A table containing filepaths to images (or File, FileData, ImageData, or CompressedImageData objects), in an array. A table of tables can also be given, where each sub-table represents a single mipmap level and contains all layers for that mipmap. |
| settings | table | nil | Optional table of settings to configure the volume image, containing the following fields: (see table fields below) |

**settings table fields:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| mipmaps | boolean | false | True to make the image use mipmaps, false to disable them. Mipmaps will be automatically generated if the image isn't a compressed texture format. |
| linear | boolean | false | True to treat the image's pixels as linear instead of sRGB, when gamma correct rendering is enabled. Most images are authored as sRGB. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| image | [Image](#image) | A volume Image object. |

## love.graphics.origin

Resets the current coordinate transformation.

This function is always used to reverse any previous calls to love.graphics.rotate, love.graphics.scale, love.graphics.shear or love.graphics.translate. It returns the current transformation state to its defaults.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

## love.graphics.points

Draws one or more points.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | The position of the first point on the x-axis. |
| y | number |  | The position of the first point on the y-axis. |
| ... | number |  | The x and y coordinates of additional points. |

**Returns:**

*No return values*

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| points | table |  | A table containing multiple point positions, in the form of {x, y, ...}. |

**Returns:**

*No return values*

### Variant 3

Draws one or more individually colored points.

In versions prior to 11.0, color component values were within the range of 0 to 255 instead of 0 to 1.

The pixel grid is actually offset to the center of each pixel. So to get clean pixels drawn use 0.5 + integer increments.

Points are not affected by size is always in pixels.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| points | table |  | A table containing multiple individually colored points, in the form of {point, ...}. (see table fields below) |

**points table fields:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| point | table |  | A table containing the position and color of the first point, in the form of {x, y, r, g, b, a}. The color components are optional. |
| ... | table |  | Additional tables containing the position and color of more points, in the form of {x, y, r, g, b, a}. The color components are optional. |

**Returns:**

*No return values*

## love.graphics.polygon

Draw a polygon.

Following the mode argument, this function can accept multiple numeric arguments or a single table of numeric arguments. In either case the arguments are interpreted as alternating x and y coordinates of the polygon's vertices.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| mode | [DrawMode](#drawmode) |  | How to draw the polygon. |
| ... | number |  | The vertices of the polygon. |

**Returns:**

*No return values*

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| mode | [DrawMode](#drawmode) |  | How to draw the polygon. |
| vertices | table |  | The vertices of the polygon as a table. |

**Returns:**

*No return values*

## love.graphics.pop

Pops the current coordinate transformation from the transformation stack.

This function is always used to reverse a previous push operation. It returns the current transformation state to what it was before the last preceding push.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

## love.graphics.present

Displays the results of drawing operations on the screen.

This function is used when writing your own love.run function. It presents all the results of your drawing operations on the screen. See the example in love.run for a typical use of this function.

* If love.window.setMode has vsync equal to true, this function can't run more frequently than the refresh rate (e.g. 60 Hz), and will halt the program until ready if necessary.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

## love.graphics.print

Draws text on screen. If no Font is set, one will be created and set (once) if needed.

As of LOVE 0.7.1, when using translation and scaling functions while drawing text, this function assumes the scale occurs first.  If you don't script with this in mind, the text won't be in the right position, or possibly even on screen.

love.graphics.print and love.graphics.printf both support UTF-8 encoding. You'll also need a proper Font for special characters.

In versions prior to 11.0, color and byte component values were within the range of 0 to 255 instead of 0 to 1.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| text | string |  | The text to draw. |
| x | number | 0 | The position to draw the object (x-axis). |
| y | number | 0 | The position to draw the object (y-axis). |
| r | number | 0 | Orientation (radians). |
| sx | number | 1 | Scale factor (x-axis). |
| sy | number | sx | Scale factor (y-axis). |
| ox | number | 0 | Origin offset (x-axis). |
| oy | number | 0 | Origin offset (y-axis). |
| kx | number | 0 | Shearing factor (x-axis). |
| ky | number | 0 | Shearing factor (y-axis). |

**Returns:**

*No return values*

### Variant 2

The color set by love.graphics.setColor will be combined (multiplied) with the colors of the text.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| coloredtext | table |  | A table containing colors and strings to add to the object, in the form of {color1, string1, color2, string2, ...}. (see table fields below) |
| x | number | 0 | The position of the text on the x-axis. |
| y | number | 0 | The position of the text on the y-axis. |
| angle | number | 0 | The orientation of the text in radians. |
| sx | number | 1 | Scale factor on the x-axis. |
| sy | number | sx | Scale factor on the y-axis. |
| ox | number | 0 | Origin offset on the x-axis. |
| oy | number | 0 | Origin offset on the y-axis. |
| kx | number | 0 | Shearing / skew factor on the x-axis. |
| ky | number | 0 | Shearing / skew factor on the y-axis. |

**coloredtext table fields:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| color1 | table |  | A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}. |
| string1 | string |  | A string of text which has a color specified by the previous color. |
| color2 | table |  | A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}. |
| string2 | string |  | A string of text which has a color specified by the previous color. |
| ... | tables and strings |  | Additional colors and strings. |

**Returns:**

*No return values*

### Variant 3

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| text | string |  | The text to draw. |
| transform | Transform |  | Transformation object. |

**Returns:**

*No return values*

### Variant 4

The color set by love.graphics.setColor will be combined (multiplied) with the colors of the text.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| coloredtext | table |  | A table containing colors and strings to add to the object, in the form of {color1, string1, color2, string2, ...}. (see table fields below) |
| transform | Transform |  | Transformation object. |

**coloredtext table fields:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| color1 | table |  | A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}. |
| string1 | string |  | A string of text which has a color specified by the previous color. |
| color2 | table |  | A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}. |
| string2 | string |  | A string of text which has a color specified by the previous color. |
| ... | tables and strings |  | Additional colors and strings. |

**Returns:**

*No return values*

### Variant 5

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| text | string |  | The text to draw. |
| font | [Font](#font) |  | The Font object to use. |
| transform | Transform |  | Transformation object. |

**Returns:**

*No return values*

### Variant 6

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| coloredtext | table |  | A table containing colors and strings to add to the object, in the form of {color1, string1, color2, string2, ...}. (see table fields below) |
| font | [Font](#font) |  | The Font object to use. |
| transform | Transform |  | Transformation object. |

**coloredtext table fields:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| color1 | table |  | A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}. |
| string1 | string |  | A string of text which has a color specified by the previous color. |
| color2 | table |  | A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}. |
| string2 | string |  | A string of text which has a color specified by the previous color. |
| ... | tables and strings |  | Additional colors and strings. |

**Returns:**

*No return values*

## love.graphics.printf

Draws formatted text, with word wrap and alignment.

See additional notes in love.graphics.print.

The word wrap limit is applied before any scaling, rotation, and other coordinate transformations. Therefore the amount of text per line stays constant given the same wrap limit, even if the scale arguments change.

In version 0.9.2 and earlier, wrapping was implemented by breaking up words by spaces and putting them back together to make sure things fit nicely within the limit provided. However, due to the way this is done, extra spaces between words would end up missing when printed on the screen, and some lines could overflow past the provided wrap limit. In version 0.10.0 and newer this is no longer the case.

In versions prior to 11.0, color and byte component values were within the range of 0 to 255 instead of 0 to 1.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| text | string |  | A text string. |
| x | number |  | The position on the x-axis. |
| y | number |  | The position on the y-axis. |
| limit | number |  | Wrap the line after this many horizontal pixels. |
| align | [AlignMode](#alignmode) | 'left' | The alignment. |
| r | number | 0 | Orientation (radians). |
| sx | number | 1 | Scale factor (x-axis). |
| sy | number | sx | Scale factor (y-axis). |
| ox | number | 0 | Origin offset (x-axis). |
| oy | number | 0 | Origin offset (y-axis). |
| kx | number | 0 | Shearing factor (x-axis). |
| ky | number | 0 | Shearing factor (y-axis). |

**Returns:**

*No return values*

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| text | string |  | A text string. |
| font | [Font](#font) |  | The Font object to use. |
| x | number |  | The position on the x-axis. |
| y | number |  | The position on the y-axis. |
| limit | number |  | Wrap the line after this many horizontal pixels. |
| align | [AlignMode](#alignmode) | 'left' | The alignment. |
| r | number | 0 | Orientation (radians). |
| sx | number | 1 | Scale factor (x-axis). |
| sy | number | sx | Scale factor (y-axis). |
| ox | number | 0 | Origin offset (x-axis). |
| oy | number | 0 | Origin offset (y-axis). |
| kx | number | 0 | Shearing factor (x-axis). |
| ky | number | 0 | Shearing factor (y-axis). |

**Returns:**

*No return values*

### Variant 3

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| text | string |  | A text string. |
| transform | Transform |  | Transformation object. |
| limit | number |  | Wrap the line after this many horizontal pixels. |
| align | [AlignMode](#alignmode) | 'left' | The alignment. |

**Returns:**

*No return values*

### Variant 4

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| text | string |  | A text string. |
| font | [Font](#font) |  | The Font object to use. |
| transform | Transform |  | Transformation object. |
| limit | number |  | Wrap the line after this many horizontal pixels. |
| align | [AlignMode](#alignmode) | 'left' | The alignment. |

**Returns:**

*No return values*

### Variant 5

The color set by love.graphics.setColor will be combined (multiplied) with the colors of the text.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| coloredtext | table |  | A table containing colors and strings to add to the object, in the form of {color1, string1, color2, string2, ...}. (see table fields below) |
| x | number |  | The position of the text (x-axis). |
| y | number |  | The position of the text (y-axis). |
| limit | number |  | The maximum width in pixels of the text before it gets automatically wrapped to a new line. |
| align | [AlignMode](#alignmode) |  | The alignment of the text. |
| angle | number | 0 | Orientation (radians). |
| sx | number | 1 | Scale factor (x-axis). |
| sy | number | sx | Scale factor (y-axis). |
| ox | number | 0 | Origin offset (x-axis). |
| oy | number | 0 | Origin offset (y-axis). |
| kx | number | 0 | Shearing / skew factor (x-axis). |
| ky | number | 0 | Shearing / skew factor (y-axis). |

**coloredtext table fields:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| color1 | table |  | A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}. |
| string1 | string |  | A string of text which has a color specified by the previous color. |
| color2 | table |  | A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}. |
| string2 | string |  | A string of text which has a color specified by the previous color. |
| ... | tables and strings |  | Additional colors and strings. |

**Returns:**

*No return values*

### Variant 6

The color set by love.graphics.setColor will be combined (multiplied) with the colors of the text.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| coloredtext | table |  | A table containing colors and strings to add to the object, in the form of {color1, string1, color2, string2, ...}. (see table fields below) |
| font | [Font](#font) |  | The Font object to use. |
| x | number |  | The position on the x-axis. |
| y | number |  | The position on the y-axis. |
| limit | number |  | Wrap the line after this many horizontal pixels. |
| align | [AlignMode](#alignmode) | 'left' | The alignment. |
| angle | number | 0 | Orientation (radians). |
| sx | number | 1 | Scale factor (x-axis). |
| sy | number | sx | Scale factor (y-axis). |
| ox | number | 0 | Origin offset (x-axis). |
| oy | number | 0 | Origin offset (y-axis). |
| kx | number | 0 | Shearing factor (x-axis). |
| ky | number | 0 | Shearing factor (y-axis). |

**coloredtext table fields:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| color1 | table |  | A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}. |
| string1 | string |  | A string of text which has a color specified by the previous color. |
| color2 | table |  | A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}. |
| string2 | string |  | A string of text which has a color specified by the previous color. |
| ... | tables and strings |  | Additional colors and strings. |

**Returns:**

*No return values*

### Variant 7

The color set by love.graphics.setColor will be combined (multiplied) with the colors of the text.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| coloredtext | table |  | A table containing colors and strings to add to the object, in the form of {color1, string1, color2, string2, ...}. (see table fields below) |
| transform | Transform |  | Transformation object. |
| limit | number |  | Wrap the line after this many horizontal pixels. |
| align | [AlignMode](#alignmode) | 'left' | The alignment. |

**coloredtext table fields:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| color1 | table |  | A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}. |
| string1 | string |  | A string of text which has a color specified by the previous color. |
| color2 | table |  | A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}. |
| string2 | string |  | A string of text which has a color specified by the previous color. |
| ... | tables and strings |  | Additional colors and strings. |

**Returns:**

*No return values*

### Variant 8

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| coloredtext | table |  | A table containing colors and strings to add to the object, in the form of {color1, string1, color2, string2, ...}. (see table fields below) |
| font | [Font](#font) |  | The Font object to use. |
| transform | Transform |  | Transformation object. |
| limit | number |  | Wrap the line after this many horizontal pixels. |
| align | [AlignMode](#alignmode) | 'left' | The alignment. |

**coloredtext table fields:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| color1 | table |  | A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}. |
| string1 | string |  | A string of text which has a color specified by the previous color. |
| color2 | table |  | A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}. |
| string2 | string |  | A string of text which has a color specified by the previous color. |
| ... | tables and strings |  | Additional colors and strings. |

**Returns:**

*No return values*

## love.graphics.push

Copies and pushes the current coordinate transformation to the transformation stack.

This function is always used to prepare for a corresponding pop operation later. It stores the current coordinate transformation state into the transformation stack and keeps it active. Later changes to the transformation can be undone by using the pop operation, which returns the coordinate transform to the state it was in before calling push.

### Variant 1

Pushes the current transformation to the transformation stack.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

### Variant 2

Pushes a specific type of state to the stack.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| stack | [StackType](#stacktype) |  | The type of stack to push (e.g. just transformation state, or all love.graphics state). |

**Returns:**

*No return values*

## love.graphics.rectangle

Draws a rectangle.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| mode | [DrawMode](#drawmode) |  | How to draw the rectangle. |
| x | number |  | The position of top-left corner along the x-axis. |
| y | number |  | The position of top-left corner along the y-axis. |
| width | number |  | Width of the rectangle. |
| height | number |  | Height of the rectangle. |

**Returns:**

*No return values*

### Variant 2

Draws a rectangle with rounded corners.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| mode | [DrawMode](#drawmode) |  | How to draw the rectangle. |
| x | number |  | The position of top-left corner along the x-axis. |
| y | number |  | The position of top-left corner along the y-axis. |
| width | number |  | Width of the rectangle. |
| height | number |  | Height of the rectangle. |
| rx | number |  | The x-axis radius of each round corner. Cannot be greater than half the rectangle's width. |
| ry | number | rx | The y-axis radius of each round corner. Cannot be greater than half the rectangle's height. |
| segments | number | nil | The number of segments used for drawing the round corners. A default amount will be chosen if no number is given. |

**Returns:**

*No return values*

## love.graphics.replaceTransform

Replaces the current coordinate transformation with the given Transform object.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| transform | Transform |  | The Transform object to replace the current graphics coordinate transform with. |

**Returns:**

*No return values*

## love.graphics.reset

Resets the current graphics settings.

Calling reset makes the current drawing color white, the current background color black, disables any active color component masks, disables wireframe mode and resets the current graphics transformation to the origin. It also sets both the point and line drawing modes to smooth and their sizes to 1.0.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

## love.graphics.rotate

Rotates the coordinate system in two dimensions.

Calling this function affects all future drawing operations by rotating the coordinate system around the origin by the given amount of radians. This change lasts until love.draw() exits.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| angle | number |  | The amount to rotate the coordinate system in radians. |

**Returns:**

*No return values*

## love.graphics.scale

Scales the coordinate system in two dimensions.

By default the coordinate system in LÖVE corresponds to the display pixels in horizontal and vertical directions one-to-one, and the x-axis increases towards the right while the y-axis increases downwards. Scaling the coordinate system changes this relation.

After scaling by sx and sy, all coordinates are treated as if they were multiplied by sx and sy. Every result of a drawing operation is also correspondingly scaled, so scaling by (2, 2) for example would mean making everything twice as large in both x- and y-directions. Scaling by a negative value flips the coordinate system in the corresponding direction, which also means everything will be drawn flipped or upside down, or both. Scaling by zero is not a useful operation.

Scale and translate are not commutative operations, therefore, calling them in different orders will change the outcome.

Scaling lasts until love.draw() exits.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| sx | number |  | The scaling in the direction of the x-axis. |
| sy | number | sx | The scaling in the direction of the y-axis. If omitted, it defaults to same as parameter sx. |

**Returns:**

*No return values*

## love.graphics.setBackgroundColor

Sets the background color.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| red | number |  | The red component (0-1). |
| green | number |  | The green component (0-1). |
| blue | number |  | The blue component (0-1). |
| alpha | number | 1 | The alpha component (0-1). |

**Returns:**

*No return values*

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| rgba | table |  | A numerical indexed table with the red, green, blue and alpha values as numbers. The alpha is optional and defaults to 1 if it is left out. |

**Returns:**

*No return values*

## love.graphics.setBlendMode

Sets the blending mode.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| mode | [BlendMode](#blendmode) |  | The blend mode to use. |

**Returns:**

*No return values*

### Variant 2

The default 'alphamultiply' alpha mode should normally be preferred except when drawing content with pre-multiplied alpha. If content is drawn to a Canvas using the 'alphamultiply' mode, the Canvas texture will have pre-multiplied alpha afterwards, so the 'premultiplied' alpha mode should generally be used when drawing a Canvas to the screen.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| mode | [BlendMode](#blendmode) |  | The blend mode to use. |
| alphamode | [BlendAlphaMode](#blendalphamode) | 'alphamultiply' | What to do with the alpha of drawn objects when blending. |

**Returns:**

*No return values*

## love.graphics.setCanvas

Captures drawing operations to a Canvas.

### Variant 1

Sets the render target to a specified stencil or depth testing with an active Canvas, the stencil buffer or depth buffer must be explicitly enabled in setCanvas via the variants below.

Note that no canvas should be active when ''love.graphics.present'' is called. ''love.graphics.present'' is called at the end of love.draw in the default love.run, hence if you activate a canvas using this function, you normally need to deactivate it at some point before ''love.draw'' finishes.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| canvas | [Canvas](#canvas) |  | The new target. |
| mipmap | number | 1 | The mipmap level to render to, for Canvases with mipmaps. |

**Returns:**

*No return values*

### Variant 2

Resets the render target to the screen, i.e. re-enables drawing to the screen.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

### Variant 3

Sets the render target to multiple simultaneous 2D Canvases. All drawing operations until the next ''love.graphics.setCanvas'' call will be redirected to the specified canvases and not shown on the screen.

Normally all drawing operations will draw only to the first canvas passed to the function, but that can be changed if a pixel shader is used with the void effect function instead of the regular vec4 effect.

All canvas arguments must have the same widths and heights and the same texture type. Not all computers which support Canvases will support multiple render targets. If love.graphics.isSupported('multicanvas') returns true, at least 4 simultaneously active canvases are supported.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| canvas1 | [Canvas](#canvas) |  | The first render target. |
| canvas2 | [Canvas](#canvas) |  | The second render target. |
| ... | [Canvas](#canvas) |  | More canvases. |

**Returns:**

*No return values*

### Variant 4

Sets the render target to the specified layer/slice and mipmap level of the given non-2D Canvas. All drawing operations until the next ''love.graphics.setCanvas'' call will be redirected to the Canvas and not shown on the screen.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| canvas | [Canvas](#canvas) |  | The new render target. |
| slice | number |  | For cubemaps this is the cube face index to render to (between 1 and 6). For Array textures this is the array layer. For volume textures this is the depth slice. 2D canvases should use a value of 1. |
| mipmap | number | 1 | The mipmap level to render to, for Canvases with mipmaps. |

**Returns:**

*No return values*

### Variant 5

Sets the active render target(s) and active stencil and depth buffers based on the specified setup information. All drawing operations until the next ''love.graphics.setCanvas'' call will be redirected to the specified Canvases and not shown on the screen.

The RenderTargetSetup parameters can either be a Canvas|[1]|The Canvas to use for this active render target.}}

{{param|number|mipmap (1)|The mipmap level to render to, for Canvases with [[Texture:getMipmapCount|mipmaps.}}

{{param|number|layer (1)|Only used for Volume and Array-type Canvases. For Array textures this is the array layer to render to. For volume textures this is the depth slice.}}

{{param|number|face (1)|Only used for Cubemap-type Canvases. The cube face index to render to (between 1 and 6)}}

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| setup | table |  | A table specifying the active Canvas(es), their mipmap levels and active layers if applicable, and whether to use a stencil and/or depth buffer. (see table fields below) |

**setup table fields:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| 1 | RenderTargetSetup |  | The Canvas to render to. |
| 2 | RenderTargetSetup | nil | An additional Canvas to render to, if multiple simultaneous render targets are wanted. |
| ... | RenderTargetSetup |  | Additional Canvases to render to, if multiple simultaneous render targets are wanted. |
| stencil | boolean | false | Whether an internally managed stencil buffer should be used, if the depthstencil field isn't set. |
| depth | boolean | false | Whether an internally managed depth buffer should be used, if the depthstencil field isn't set. |
| depthstencil | RenderTargetSetup | nil | An optional custom depth/stencil formatted Canvas to use for the depth and/or stencil buffer. |

**Returns:**

*No return values*

## love.graphics.setColor

Sets the color used for drawing.

In versions prior to 11.0, color component values were within the range of 0 to 255 instead of 0 to 1.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| red | number |  | The amount of red. |
| green | number |  | The amount of green. |
| blue | number |  | The amount of blue. |
| alpha | number | 1 | The amount of alpha.  The alpha value will be applied to all subsequent draw operations, even the drawing of an image. |

**Returns:**

*No return values*

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| rgba | table |  | A numerical indexed table with the red, green, blue and alpha values as numbers. The alpha is optional and defaults to 1 if it is left out. |

**Returns:**

*No return values*

## love.graphics.setColorMask

Sets the color mask. Enables or disables specific color components when rendering and clearing the screen. For example, if '''red''' is set to '''false''', no further changes will be made to the red component of any pixels.

### Variant 1

Enables color masking for the specified color components.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| red | boolean |  | Render red component. |
| green | boolean |  | Render green component. |
| blue | boolean |  | Render blue component. |
| alpha | boolean |  | Render alpha component. |

**Returns:**

*No return values*

### Variant 2

Disables color masking.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

## love.graphics.setDefaultFilter

Sets the default scaling filters used with Images, Canvases, and Fonts.

This function does not apply retroactively to loaded images.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| min | [FilterMode](#filtermode) |  | Filter mode used when scaling the image down. |
| mag | [FilterMode](#filtermode) | min | Filter mode used when scaling the image up. |
| anisotropy | number | 1 | Maximum amount of Anisotropic Filtering used. |

**Returns:**

*No return values*

## love.graphics.setDepthMode

Configures depth testing and writing to the depth buffer.

This is low-level functionality designed for use with custom vertex shaders and Meshes with custom vertex attributes. No higher level APIs are provided to set the depth of 2D graphics such as shapes, lines, and Images.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| comparemode | [CompareMode](#comparemode) |  | Depth comparison mode used for depth testing. |
| write | boolean |  | Whether to write update / write values to the depth buffer when rendering. |

**Returns:**

*No return values*

### Variant 2

Disables depth testing and depth writes.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

## love.graphics.setFont

Set an already-loaded Font as the current font or create and load a new one from the file and size.

It's recommended that Font objects are created with love.graphics.newFont in the loading stage and then passed to this function in the drawing stage.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| font | [Font](#font) |  | The Font object to use. |

**Returns:**

*No return values*

## love.graphics.setFrontFaceWinding

Sets whether triangles with clockwise- or counterclockwise-ordered vertices are considered front-facing.

This is designed for use in combination with Mesh face culling. Other love.graphics shapes, lines, and sprites are not guaranteed to have a specific winding order to their internal vertices.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| winding | [VertexWinding](#vertexwinding) |  | The winding mode to use. The default winding is counterclockwise ('ccw'). |

**Returns:**

*No return values*

## love.graphics.setLineJoin

Sets the line join style. See LineJoin for the possible options.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| join | [LineJoin](#linejoin) |  | The LineJoin to use. |

**Returns:**

*No return values*

## love.graphics.setLineStyle

Sets the line style.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| style | [LineStyle](#linestyle) |  | The LineStyle to use. Line styles include smooth and rough. |

**Returns:**

*No return values*

## love.graphics.setLineWidth

Sets the line width.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| width | number |  | The width of the line. |

**Returns:**

*No return values*

## love.graphics.setMeshCullMode

Sets whether back-facing triangles in a Mesh are culled.

This is designed for use with low level custom hardware-accelerated 3D rendering via custom vertex attributes on Meshes, custom vertex shaders, and depth testing with a depth buffer.

By default, both front- and back-facing triangles in Meshes are rendered.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| mode | [CullMode](#cullmode) |  | The Mesh face culling mode to use (whether to render everything, cull back-facing triangles, or cull front-facing triangles). |

**Returns:**

*No return values*

## love.graphics.setNewFont

Creates and sets a new Font.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| size | number | 12 | The size of the font. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| font | [Font](#font) | The new font. |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| filename | string |  | The path and name of the file with the font. |
| size | number | 12 | The size of the font. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| font | [Font](#font) | The new font. |

### Variant 3

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| file | File |  | A File with the font. |
| size | number | 12 | The size of the font. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| font | [Font](#font) | The new font. |

### Variant 4

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| data | Data |  | A Data with the font. |
| size | number | 12 | The size of the font. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| font | [Font](#font) | The new font. |

### Variant 5

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| rasterizer | Rasterizer |  | A rasterizer. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| font | [Font](#font) | The new font. |

## love.graphics.setPointSize

Sets the point size.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| size | number |  | The new point size. |

**Returns:**

*No return values*

## love.graphics.setScissor

Sets or disables scissor.

The scissor limits the drawing area to a specified rectangle. This affects all graphics calls, including love.graphics.clear. 

The dimensions of the scissor is unaffected by graphical transformations (translate, scale, ...).

### Variant 1

Limits the drawing area to a specified rectangle. 

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | x coordinate of upper left corner. |
| y | number |  | y coordinate of upper left corner. |
| width | number |  | width of clipping rectangle. |
| height | number |  | height of clipping rectangle. |

**Returns:**

*No return values*

### Variant 2

Disables scissor.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

## love.graphics.setShader

Sets or resets a Shader as the current pixel effect or vertex shaders. All drawing operations until the next ''love.graphics.setShader'' will be drawn using the Shader object specified.

### Variant 1

Sets the current shader to a specified Shader. All drawing operations until the next ''love.graphics.setShader'' will be drawn using the Shader object specified.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| shader | [Shader](#shader) |  | The new shader. |

**Returns:**

*No return values*

### Variant 2

Disables shaders, allowing unfiltered drawing operations.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

## love.graphics.setStencilTest

Configures or disables stencil testing.

When stencil testing is enabled, the geometry of everything that is drawn afterward will be clipped / stencilled out based on a comparison between the arguments of this function and the stencil value of each pixel that the geometry touches. The stencil values of pixels are affected via love.graphics.stencil.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| comparemode | [CompareMode](#comparemode) |  | The type of comparison to make for each pixel. |
| comparevalue | number |  | The value to use when comparing with the stencil value of each pixel. Must be between 0 and 255. |

**Returns:**

*No return values*

### Variant 2

Disables stencil testing.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

## love.graphics.setWireframe

Sets whether wireframe lines will be used when drawing.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| enable | boolean |  | True to enable wireframe mode when drawing, false to disable it. |

**Returns:**

*No return values*

## love.graphics.shear

Shears the coordinate system.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| kx | number |  | The shear factor on the x-axis. |
| ky | number |  | The shear factor on the y-axis. |

**Returns:**

*No return values*

## love.graphics.stencil

Draws geometry as a stencil.

The geometry drawn by the supplied function sets invisible stencil values of pixels, instead of setting pixel colors. The stencil buffer (which contains those stencil values) can act like a mask / stencil - love.graphics.setStencilTest can be used afterward to determine how further rendering is affected by the stencil values in each pixel.

Stencil values are integers within the range of 255.

It is possible to draw to the screen and to the stencil values of pixels at the same time, by using love.graphics.setColorMask inside the stencil function to enable drawing to all color components.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| stencilfunction | function |  | Function which draws geometry. The stencil values of pixels, rather than the color of each pixel, will be affected by the geometry. |
| action | [StencilAction](#stencilaction) | 'replace' | How to modify any stencil values of pixels that are touched by what's drawn in the stencil function. |
| value | number | 1 | The new stencil value to use for pixels if the 'replace' stencil action is used. Has no effect with other stencil actions. Must be between 0 and 255. |
| keepvalues | boolean | false | True to preserve old stencil values of pixels, false to re-set every pixel's stencil value to 0 before executing the stencil function. love.graphics.clear will also re-set all stencil values. |

**Returns:**

*No return values*

## love.graphics.transformPoint

Converts the given 2D position from global coordinates into screen-space.

This effectively applies the current graphics transformations to the given position. A similar Transform:transformPoint method exists for Transform objects.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| globalX | number |  | The x component of the position in global coordinates. |
| globalY | number |  | The y component of the position in global coordinates. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| screenX | number | The x component of the position with graphics transformations applied. |
| screenY | number | The y component of the position with graphics transformations applied. |

## love.graphics.translate

Translates the coordinate system in two dimensions.

When this function is called with two numbers, dx, and dy, all the following drawing operations take effect as if their x and y coordinates were x+dx and y+dy. 

Scale and translate are not commutative operations, therefore, calling them in different orders will change the outcome.

This change lasts until love.draw() exits or else a love.graphics.pop reverts to a previous love.graphics.push.

Translating using whole numbers will prevent tearing/blurring of images and fonts draw after translating.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| dx | number |  | The translation relative to the x-axis. |
| dy | number |  | The translation relative to the y-axis. |

**Returns:**

*No return values*

## love.graphics.validateShader

Validates shader code. Check if specified shader code does not contain any errors.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| gles | boolean |  | Validate code as GLSL ES shader. |
| code | string |  | The pixel shader or vertex shader code, or a filename pointing to a file with the code. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| status | boolean | true if specified shader code doesn't contain any errors. false otherwise. |
| message | string | Reason why shader code validation failed (or nil if validation succeded). |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| gles | boolean |  | Validate code as GLSL ES shader. |
| pixelcode | string |  | The pixel shader code, or a filename pointing to a file with the code. |
| vertexcode | string |  | The vertex shader code, or a filename pointing to a file with the code. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| status | boolean | true if specified shader code doesn't contain any errors. false otherwise. |
| message | string | Reason why shader code validation failed (or nil if validation succeded). |

## Types

## Canvas

A Canvas is used for off-screen rendering. Think of it as an invisible screen that you can draw to, but that will not be visible until you draw it to the actual visible screen. It is also known as "render to texture".

By drawing things that do not change position often (such as background items) to the Canvas, and then drawing the entire Canvas instead of each item,  you can reduce the number of draw operations performed each frame.

In versions prior to love.graphics.isSupported("canvas") could be used to check for support at runtime.

**Constructors:** [newCanvas](#lovegraphicsnewcanvas), [getCanvas](#lovegraphicsgetcanvas)

**Supertypes:** Texture, Drawable, Object

### Methods

#### Canvas:generateMipmaps

Generates mipmaps for the Canvas, based on the contents of the highest-resolution mipmap level.

The Canvas must be created with mipmaps set to a MipmapMode other than 'none' for this function to work. It should only be called while the Canvas is not the active render target.

If the mipmap mode is set to 'auto', this function is automatically called inside love.graphics.setCanvas when switching from this Canvas to another Canvas or to the main screen.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

#### Canvas:getMSAA

Gets the number of multisample antialiasing (MSAA) samples used when drawing to the Canvas.

This may be different than the number used as an argument to love.graphics.newCanvas if the system running LÖVE doesn't support that number.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| samples | number | The number of multisample antialiasing samples used by the canvas when drawing to it. |

#### Canvas:getMipmapMode

Gets the MipmapMode this Canvas was created with.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| mode | [MipmapMode](#mipmapmode) | The mipmap mode this Canvas was created with. |

#### Canvas:newImageData

Generates ImageData from the contents of the Canvas.

### Variant 1

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| data | ImageData | The new ImageData made from the Canvas' contents. |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| slice | number |  | The cubemap face index, array index, or depth layer for cubemap, array, or volume type Canvases, respectively. This argument is ignored for regular 2D canvases. |
| mipmap | number | 1 | The mipmap index to use, for Canvases with mipmaps. |
| x | number |  | The x-axis of the top-left corner (in pixels) of the area within the Canvas to capture. |
| y | number |  | The y-axis of the top-left corner (in pixels) of the area within the Canvas to capture. |
| width | number |  | The width in pixels of the area within the Canvas to capture. |
| height | number |  | The height in pixels of the area within the Canvas to capture. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| data | ImageData | The new ImageData made from the Canvas' contents. |

#### Canvas:renderTo

Render to the Canvas using a function.

This is a shortcut to love.graphics.setCanvas:

canvas:renderTo( func )

is the same as

love.graphics.setCanvas( canvas )

func()

love.graphics.setCanvas()

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| func | function |  | A function performing drawing operations. |
| ... | any |  | Additional arguments to call the function with. |

**Returns:**

*No return values*

## Drawable

Superclass for all things that can be drawn on screen. This is an abstract type that can't be created directly.

**Supertypes:** Object

## Font

Defines the shape of characters that can be drawn onto the screen.

**Constructors:** [getFont](#lovegraphicsgetfont), [newFont](#lovegraphicsnewfont), [setNewFont](#lovegraphicssetnewfont), [newImageFont](#lovegraphicsnewimagefont)

**Supertypes:** Object

### Methods

#### Font:getAscent

Gets the ascent of the Font.

The ascent spans the distance between the baseline and the top of the glyph that reaches farthest from the baseline.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| ascent | number | The ascent of the Font in pixels. |

#### Font:getBaseline

Gets the baseline of the Font.

Most scripts share the notion of a baseline: an imaginary horizontal line on which characters rest. In some scripts, parts of glyphs lie below the baseline.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| baseline | number | The baseline of the Font in pixels. |

#### Font:getDPIScale

Gets the DPI scale factor of the Font.

The DPI scale factor represents relative pixel density. A DPI scale factor of 2 means the font's glyphs have twice the pixel density in each dimension (4 times as many pixels in the same area) compared to a font with a DPI scale factor of 1.

The font size of TrueType fonts is scaled internally by the font's specified DPI scale factor. By default, LÖVE uses the screen's DPI scale factor when creating TrueType fonts.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| dpiscale | number | The DPI scale factor of the Font. |

#### Font:getDescent

Gets the descent of the Font.

The descent spans the distance between the baseline and the lowest descending glyph in a typeface.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| descent | number | The descent of the Font in pixels. |

#### Font:getFilter

Gets the filter mode for a font.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| min | [FilterMode](#filtermode) | Filter mode used when minifying the font. |
| mag | [FilterMode](#filtermode) | Filter mode used when magnifying the font. |
| anisotropy | number | Maximum amount of anisotropic filtering used. |

#### Font:getHeight

Gets the height of the Font.

The height of the font is the size including any spacing; the height which it will need.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| height | number | The height of the Font in pixels. |

#### Font:getKerning

Gets the kerning between two characters in the Font.

Kerning is normally handled automatically in love.graphics.print, Text objects, Font:getWidth, Font:getWrap, etc. This function is useful when stitching text together manually.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| leftchar | string |  | The left character. |
| rightchar | string |  | The right character. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| kerning | number | The kerning amount to add to the spacing between the two characters. May be negative. |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| leftglyph | number |  | The unicode number for the left glyph. |
| rightglyph | number |  | The unicode number for the right glyph. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| kerning | number | The kerning amount to add to the spacing between the two characters. May be negative. |

#### Font:getLineHeight

Gets the line height.

This will be the value previously set by Font:setLineHeight, or 1.0 by default.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| height | number | The current line height. |

#### Font:getWidth

Determines the maximum width (accounting for newlines) taken by the given string.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| text | string |  | A string. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| width | number | The width of the text. |

#### Font:getWrap

Gets formatting information for text, given a wrap limit.

This function accounts for newlines correctly (i.e. '\n').

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| text | string |  | The text that will be wrapped. |
| wraplimit | number |  | The maximum width in pixels of each line that ''text'' is allowed before wrapping. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| width | number | The maximum width of the wrapped text. |
| wrappedtext | table | A sequence containing each line of text that was wrapped. |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| coloredtext | table |  | A table containing colors and strings to add to the object, in the form of {color1, string1, color2, string2, ...}. (see table fields below) |
| wraplimit | number |  | The maximum width in pixels of each line that ''text'' is allowed before wrapping. |

**coloredtext table fields:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| color1 | table |  | A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}. |
| string1 | string |  | A string of text which has a color specified by the previous color. |
| color2 | table |  | A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}. |
| string2 | string |  | A string of text which has a color specified by the previous color. |
| ... | tables and strings |  | Additional colors and strings. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| width | number | The maximum width of the wrapped text. |
| wrappedtext | table | A sequence containing each line of text that was wrapped. |

#### Font:hasGlyphs

Gets whether the Font can render a character or string.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| text | string |  | A UTF-8 encoded unicode string. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| hasglyph | boolean | Whether the font can render all the UTF-8 characters in the string. |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| character1 | string |  | A unicode character. |
| character2 | string |  | Another unicode character. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| hasglyph | boolean | Whether the font can render all the glyphs represented by the characters. |

### Variant 3

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| codepoint1 | number |  | A unicode codepoint number. |
| codepoint2 | number |  | Another unicode codepoint number. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| hasglyph | boolean | Whether the font can render all the glyphs represented by the codepoint numbers. |

#### Font:setFallbacks

Sets the fallback fonts. When the Font doesn't contain a glyph, it will substitute the glyph from the next subsequent fallback Fonts. This is akin to setting a 'font stack' in Cascading Style Sheets (CSS).

If this is called it should be before love.graphics.print, Font:getWrap, and other Font methods which use glyph positioning information are called.

Every fallback Font must be created from the same file type as the primary Font. For example, a Font created from a .ttf file can only use fallback Fonts that were created from .ttf files.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| fallbackfont1 | [Font](#font) |  | The first fallback Font to use. |
| ... | [Font](#font) |  | Additional fallback Fonts. |

**Returns:**

*No return values*

#### Font:setFilter

Sets the filter mode for a font.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| min | [FilterMode](#filtermode) |  | How to scale a font down. |
| mag | [FilterMode](#filtermode) |  | How to scale a font up. |
| anisotropy | number | 1 | Maximum amount of anisotropic filtering used. |

**Returns:**

*No return values*

#### Font:setLineHeight

Sets the line height.

When rendering the font in lines the actual height will be determined by the line height multiplied by the height of the font. The default is 1.0.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| height | number |  | The new line height. |

**Returns:**

*No return values*

## Image

Drawable image type.

**Constructors:** [newImage](#lovegraphicsnewimage), [newVolumeImage](#lovegraphicsnewvolumeimage), [newCubeImage](#lovegraphicsnewcubeimage), [newArrayImage](#lovegraphicsnewarrayimage)

**Supertypes:** Texture, Drawable, Object

### Methods

#### Image:isCompressed

Gets whether the Image was created from CompressedData.

Compressed images take up less space in VRAM, and drawing a compressed image will generally be more efficient than drawing one created from raw pixel data.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| compressed | boolean | Whether the Image is stored as a compressed texture on the GPU. |

#### Image:isFormatLinear

Gets whether the Image was created with the linear (non-gamma corrected) flag set to true.

This method always returns false when gamma-correct rendering is not enabled.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| linear | boolean | Whether the Image's internal pixel format is linear (not gamma corrected), when gamma-correct rendering is enabled. |

#### Image:replacePixels

Replace the contents of an Image.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| data | ImageData |  | The new ImageData to replace the contents with. |
| slice | number | 1 | Which cubemap face, array index, or volume layer to replace, if applicable. |
| mipmap | number | 1 | The mimap level to replace, if the Image has mipmaps. |
| x | number | 0 | The x-offset in pixels from the top-left of the image to replace. The given ImageData's width plus this value must not be greater than the pixel width of the Image's specified mipmap level. |
| y | number | 0 | The y-offset in pixels from the top-left of the image to replace. The given ImageData's height plus this value must not be greater than the pixel height of the Image's specified mipmap level. |
| reloadmipmaps | boolean | false | Whether to generate new mipmaps after replacing the Image's pixels. True by default if the Image was created with automatically generated mipmaps, false by default otherwise. |

**Returns:**

*No return values*

## Mesh

A 2D polygon mesh used for drawing arbitrary textured shapes.

**Constructors:** [newMesh](#lovegraphicsnewmesh)

**Supertypes:** Drawable, Object

### Methods

#### Mesh:attachAttribute

Attaches a vertex attribute from a different Mesh onto this Mesh, for use when drawing. This can be used to share vertex attribute data between several different Meshes.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| name | string |  | The name of the vertex attribute to attach. |
| mesh | [Mesh](#mesh) |  | The Mesh to get the vertex attribute from. |

**Returns:**

*No return values*

### Variant 2

If a Mesh wasn't created with a custom vertex format, it will have 3 vertex attributes named VertexPosition, VertexTexCoord, and VertexColor.

Custom named attributes can be accessed in a vertex shader by declaring them as attribute vec4 MyCustomAttributeName; at the top-level of the vertex shader code. The name must match what was specified in the Mesh's vertex format and in the name argument of Mesh:attachAttribute.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| name | string |  | The name of the vertex attribute to attach. |
| mesh | [Mesh](#mesh) |  | The Mesh to get the vertex attribute from. |
| step | [VertexAttributeStep](#vertexattributestep) | 'pervertex' | Whether the attribute will be per-vertex or per-instance when the mesh is drawn. |
| attachname | string | name | The name of the attribute to use in shader code. Defaults to the name of the attribute in the given mesh. Can be used to use a different name for this attribute when rendering. |

**Returns:**

*No return values*

#### Mesh:detachAttribute

Removes a previously attached vertex attribute from this Mesh.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| name | string |  | The name of the attached vertex attribute to detach. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| success | boolean | Whether the attribute was successfully detached. |

#### Mesh:flush

Immediately sends all modified vertex data in the Mesh to the graphics card.

Normally it isn't necessary to call this method as love.graphics.draw(mesh, ...) will do it automatically if needed, but explicitly using **Mesh:flush** gives more control over when the work happens.

If this method is used, it generally shouldn't be called more than once (at most) between love.graphics.draw(mesh, ...) calls.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

#### Mesh:getDrawMode

Gets the mode used when drawing the Mesh.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| mode | [MeshDrawMode](#meshdrawmode) | The mode used when drawing the Mesh. |

#### Mesh:getDrawRange

Gets the range of vertices used when drawing the Mesh.

If the Mesh's draw range has not been set previously with Mesh:setDrawRange, this function will return nil.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| min | number | The index of the first vertex used when drawing, or the index of the first value in the vertex map used if one is set for this Mesh. |
| max | number | The index of the last vertex used when drawing, or the index of the last value in the vertex map used if one is set for this Mesh. |

#### Mesh:getTexture

Gets the texture (Image or Canvas) used when drawing the Mesh.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| texture | [Texture](#texture) | The Image or Canvas to texture the Mesh with when drawing, or nil if none is set. |

#### Mesh:getVertex

Gets the properties of a vertex in the Mesh.

In versions prior to 11.0, color and byte component values were within the range of 0 to 255 instead of 0 to 1.

### Variant 1

The values are returned in the same order as the vertex attributes in the Mesh's vertex format. A standard Mesh that wasn't created with a custom vertex format will return two position numbers, two texture coordinate numbers, and four color components: x, y, u, v, r, g, b, a.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| index | number |  | The one-based index of the vertex you want to retrieve the information for. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| attributecomponent | number | The first component of the first vertex attribute in the specified vertex. |
| ... | number | Additional components of all vertex attributes in the specified vertex. |

### Variant 2

Gets the vertex components of a Mesh that wasn't created with a custom vertex format.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| index | number |  | The index of the vertex you want to retrieve the information for. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| x | number | The position of the vertex on the x-axis. |
| y | number | The position of the vertex on the y-axis. |
| u | number | The horizontal component of the texture coordinate. |
| v | number | The vertical component of the texture coordinate. |
| r | number | The red component of the vertex's color. |
| g | number | The green component of the vertex's color. |
| b | number | The blue component of the vertex's color. |
| a | number | The alpha component of the vertex's color. |

#### Mesh:getVertexAttribute

Gets the properties of a specific attribute within a vertex in the Mesh.

Meshes without a custom vertex format specified in love.graphics.newMesh have position as their first attribute, texture coordinates as their second attribute, and color as their third attribute.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| vertexindex | number |  | The index of the the vertex you want to retrieve the attribute for (one-based). |
| attributeindex | number |  | The index of the attribute within the vertex to be retrieved (one-based). |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| value1 | number | The value of the first component of the attribute. |
| value2 | number | The value of the second component of the attribute. |
| ... | number | Any additional vertex attribute components. |

#### Mesh:getVertexCount

Gets the total number of vertices in the Mesh.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| count | number | The total number of vertices in the mesh. |

#### Mesh:getVertexFormat

Gets the vertex format that the Mesh was created with.

If a Mesh wasn't created with a custom vertex format, it will have the following vertex format:

defaultformat = {

    {'VertexPosition', 'float', 2}, -- The x,y position of each vertex.

    {'VertexTexCoord', 'float', 2}, -- The u,v texture coordinates of each vertex.

    {'VertexColor', 'byte', 4} -- The r,g,b,a color of each vertex.

}

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| format | table | The vertex format of the Mesh, which is a table containing tables for each vertex attribute the Mesh was created with, in the form of {attribute, ...}. (see table fields below) |

**format table fields:**

| Name | Type | Description |
| --- | --- | --- |
| attribute | table | A table containing the attribute's name, it's data type, and the number of components in the attribute, in the form of {name, datatype, components}. |
| ... | table | Additional vertex attributes in the Mesh. |

#### Mesh:getVertexMap

Gets the vertex map for the Mesh. The vertex map describes the order in which the vertices are used when the Mesh is drawn. The vertices, vertex map, and mesh draw mode work together to determine what exactly is displayed on the screen.

If no vertex map has been set previously via Mesh:setVertexMap, then this function will return nil in LÖVE 0.10.0+, or an empty table in 0.9.2 and older.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| map | table | A table containing the list of vertex indices used when drawing. |

#### Mesh:isAttributeEnabled

Gets whether a specific vertex attribute in the Mesh is enabled. Vertex data from disabled attributes is not used when drawing the Mesh.

If a Mesh wasn't created with a custom vertex format, it will have 3 vertex attributes named VertexPosition, VertexTexCoord, and VertexColor. Otherwise the attribute name must either match one of the vertex attributes specified in the vertex format when creating the Mesh, 

or must match a vertex attribute from another Mesh attached to this Mesh via Mesh:attachAttribute.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| name | string |  | The name of the vertex attribute to be checked. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| enabled | boolean | Whether the vertex attribute is used when drawing this Mesh. |

#### Mesh:setAttributeEnabled

Enables or disables a specific vertex attribute in the Mesh. Vertex data from disabled attributes is not used when drawing the Mesh.

If a Mesh wasn't created with a custom vertex format, it will have 3 vertex attributes named VertexPosition, VertexTexCoord, and VertexColor. Otherwise the attribute name must either match one of the vertex attributes specified in the vertex format when creating the Mesh, 

or must match a vertex attribute from another Mesh attached to this Mesh via Mesh:attachAttribute.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| name | string |  | The name of the vertex attribute to enable or disable. |
| enable | boolean |  | Whether the vertex attribute is used when drawing this Mesh. |

**Returns:**

*No return values*

#### Mesh:setDrawMode

Sets the mode used when drawing the Mesh.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| mode | [MeshDrawMode](#meshdrawmode) |  | The mode to use when drawing the Mesh. |

**Returns:**

*No return values*

#### Mesh:setDrawRange

Restricts the drawn vertices of the Mesh to a subset of the total.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| start | number |  | The index of the first vertex to use when drawing, or the index of the first value in the vertex map to use if one is set for this Mesh. |
| count | number |  | The number of vertices to use when drawing, or number of values in the vertex map to use if one is set for this Mesh. |

**Returns:**

*No return values*

### Variant 2

Allows all vertices in the Mesh to be drawn.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

#### Mesh:setTexture

Sets the texture (Image or Canvas) used when drawing the Mesh.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| texture | [Texture](#texture) |  | The Image or Canvas to texture the Mesh with when drawing. |

**Returns:**

*No return values*

### Variant 2

Disables any texture from being used when drawing the Mesh. Untextured meshes have a white color by default.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

#### Mesh:setVertex

Sets the properties of a vertex in the Mesh.

In versions prior to 11.0, color and byte component values were within the range of 0 to 255 instead of 0 to 1.

### Variant 1

The arguments are in the same order as the vertex attributes in the Mesh's vertex format. A standard Mesh that wasn't created with a custom vertex format will use two position numbers, two texture coordinate numbers, and four color components per vertex: x, y, u, v, r, g, b, a.

If no value is supplied for a specific vertex attribute component, it will be set to a default value of 0 if its data type is 'float', or 1 if its data type is 'byte'.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| index | number |  | The index of the the vertex you want to modify (one-based). |
| attributecomponent | number |  | The first component of the first vertex attribute in the specified vertex. |
| ... | number |  | Additional components of all vertex attributes in the specified vertex. |

**Returns:**

*No return values*

### Variant 2

The table indices are in the same order as the vertex attributes in the Mesh's vertex format. A standard Mesh that wasn't created with a custom vertex format will use two position numbers, two texture coordinate numbers, and four color components per vertex: x, y, u, v, r, g, b, a.

If no value is supplied for a specific vertex attribute component, it will be set to a default value of 0 if its data type is 'float', or 1 if its data type is 'byte'.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| index | number |  | The index of the the vertex you want to modify (one-based). |
| vertex | table |  | A table with vertex information, in the form of {attributecomponent, ...}. (see table fields below) |

**vertex table fields:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| attributecomponent | number |  | The first component of the first vertex attribute in the specified vertex. |
| ... | number |  | Additional components of all vertex attributes in the specified vertex. |

**Returns:**

*No return values*

### Variant 3

Sets the vertex components of a Mesh that wasn't created with a custom vertex format.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| index | number |  | The index of the the vertex you want to modify (one-based). |
| x | number |  | The position of the vertex on the x-axis. |
| y | number |  | The position of the vertex on the y-axis. |
| u | number |  | The horizontal component of the texture coordinate. |
| v | number |  | The vertical component of the texture coordinate. |
| r | number | 1 | The red component of the vertex's color. |
| g | number | 1 | The green component of the vertex's color. |
| b | number | 1 | The blue component of the vertex's color. |
| a | number | 1 | The alpha component of the vertex's color. |

**Returns:**

*No return values*

### Variant 4

Sets the vertex components of a Mesh that wasn't created with a custom vertex format.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| index | number |  | The index of the the vertex you want to modify (one-based). |
| vertex | table |  | A table with vertex information. (see table fields below) |

**vertex table fields:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| 1 | number |  | The position of the vertex on the x-axis. |
| 2 | number |  | The position of the vertex on the y-axis. |
| 3 | number |  | The u texture coordinate. Texture coordinates are normally in the range of 1, but can be greater or less (see WrapMode.) |
| 4 | number |  | The v texture coordinate. Texture coordinates are normally in the range of 1, but can be greater or less (see WrapMode.) |
| 5 | number | 1 | The red color component. |
| 6 | number | 1 | The green color component. |
| 7 | number | 1 | The blue color component. |
| 8 | number | 1 | The alpha color component. |

**Returns:**

*No return values*

#### Mesh:setVertexAttribute

Sets the properties of a specific attribute within a vertex in the Mesh.

Meshes without a custom vertex format specified in love.graphics.newMesh have position as their first attribute, texture coordinates as their second attribute, and color as their third attribute.

Attribute components which exist within the attribute but are not specified as arguments default to 0 for attributes with the float data type, and 255 for the byte data type.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| vertexindex | number |  | The index of the the vertex to be modified (one-based). |
| attributeindex | number |  | The index of the attribute within the vertex to be modified (one-based). |
| value1 | number |  | The new value for the first component of the attribute. |
| value2 | number |  | The new value for the second component of the attribute. |
| ... | number |  | Any additional vertex attribute components. |

**Returns:**

*No return values*

#### Mesh:setVertexMap

Sets the vertex map for the Mesh. The vertex map describes the order in which the vertices are used when the Mesh is drawn. The vertices, vertex map, and mesh draw mode work together to determine what exactly is displayed on the screen.

The vertex map allows you to re-order or reuse vertices when drawing without changing the actual vertex parameters or duplicating vertices. It is especially useful when combined with different Mesh Draw Modes.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| map | table |  | A table containing a list of vertex indices to use when drawing. Values must be in the range of Mesh:getVertexCount(). |

**Returns:**

*No return values*

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| vi1 | number |  | The index of the first vertex to use when drawing. Must be in the range of Mesh:getVertexCount(). |
| vi2 | number |  | The index of the second vertex to use when drawing. |
| vi3 | number |  | The index of the third vertex to use when drawing. |

**Returns:**

*No return values*

### Variant 3

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| data | Data |  | Array of vertex indices to use when drawing. Values must be in the range of Mesh:getVertexCount()-1 |
| datatype | [IndexDataType](#indexdatatype) |  | Datatype of the vertex indices array above. |

**Returns:**

*No return values*

#### Mesh:setVertices

Replaces a range of vertices in the Mesh with new ones. The total number of vertices in a Mesh cannot be changed after it has been created. This is often more efficient than calling Mesh:setVertex in a loop.

### Variant 1

The values in each vertex table are in the same order as the vertex attributes in the Mesh's vertex format. A standard Mesh that wasn't created with a custom vertex format will use two position numbers, two texture coordinate numbers, and four color components per vertex: x, y, u, v, r, g, b, a.

If no value is supplied for a specific vertex attribute component, it will be set to a default value of 0 if its data type is 'float', or 255 if its data type is 'byte'.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| vertices | table |  | The table filled with vertex information tables for each vertex, in the form of {vertex, ...} where each vertex is a table in the form of {attributecomponent, ...}. (see table fields below) |
| startvertex | number | 1 | The index of the first vertex to replace. |
| count | number | all | Amount of vertices to replace. |

**vertices table fields:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| attributecomponent | number |  | The first component of the first vertex attribute in the vertex. |
| ... | number |  | Additional components of all vertex attributes in the vertex. |

**Returns:**

*No return values*

### Variant 2

Sets the vertex components of the Mesh by copying directly from the memory of a Data object.

If LuaJIT's FFI is used to populate the Data object via Data:getPointer and ffi.cast, this variant can be drastically more efficient than other methods of setting Mesh vertex data.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| data | Data |  | A Data object to copy from. The contents of the Data must match the layout of this Mesh's vertex format. |
| startvertex | number | 1 | The index of the first vertex to replace. |

**Returns:**

*No return values*

### Variant 3

Sets the vertex components of a Mesh that wasn't created with a custom vertex format.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| vertices | table |  | The table filled with vertex information tables for each vertex as follows: (see table fields below) |

**vertices table fields:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| 1 | number |  | The position of the vertex on the x-axis. |
| 2 | number |  | The position of the vertex on the y-axis. |
| 3 | number |  | The horizontal component of the texture coordinate. Texture coordinates are normally in the range of 1, but can be greater or less (see WrapMode). |
| 4 | number |  | The vertical component of the texture coordinate. Texture coordinates are normally in the range of 1, but can be greater or less (see WrapMode). |
| 5 | number | 1 | The red color component. |
| 6 | number | 1 | The green color component. |
| 7 | number | 1 | The blue color component. |
| 8 | number | 1 | The alpha color component. |

**Returns:**

*No return values*

## ParticleSystem

A ParticleSystem can be used to create particle effects like fire or smoke.

The particle system has to be created using update it in the update callback to see any changes in the particles emitted.

The particle system won't create any particles unless you call setParticleLifetime and setEmissionRate.

**Constructors:** [newParticleSystem](#lovegraphicsnewparticlesystem)

**Supertypes:** Drawable, Object

### Methods

#### ParticleSystem:clone

Creates an identical copy of the ParticleSystem in the stopped state.

Cloned ParticleSystem inherit all the set-able state of the original ParticleSystem, but they are initialized stopped.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| particlesystem | [ParticleSystem](#particlesystem) | The new identical copy of this ParticleSystem. |

#### ParticleSystem:emit

Emits a burst of particles from the particle emitter.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| numparticles | number |  | The amount of particles to emit. The number of emitted particles will be truncated if the particle system's max buffer size is reached. |

**Returns:**

*No return values*

#### ParticleSystem:getBufferSize

Gets the maximum number of particles the ParticleSystem can have at once.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| size | number | The maximum number of particles. |

#### ParticleSystem:getColors

Gets the series of colors applied to the particle sprite.

In versions prior to 11.0, color component values were within the range of 0 to 255 instead of 0 to 1.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| r1 | number | First color, red component (0-1). |
| g1 | number | First color, green component (0-1). |
| b1 | number | First color, blue component (0-1). |
| a1 | number | First color, alpha component (0-1). |
| r2 | number | Second color, red component (0-1). |
| g2 | number | Second color, green component (0-1). |
| b2 | number | Second color, blue component (0-1). |
| a2 | number | Second color, alpha component (0-1). |
| r8 | number | Eighth color, red component (0-1). |
| g8 | number | Eighth color, green component (0-1). |
| b8 | number | Eighth color, blue component (0-1). |
| a8 | number | Eighth color, alpha component (0-1). |

#### ParticleSystem:getCount

Gets the number of particles that are currently in the system.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| count | number | The current number of live particles. |

#### ParticleSystem:getDirection

Gets the direction of the particle emitter (in radians).

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| direction | number | The direction of the emitter (radians). |

#### ParticleSystem:getEmissionArea

Gets the area-based spawn parameters for the particles.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| distribution | [AreaSpreadDistribution](#areaspreaddistribution) | The type of distribution for new particles. |
| dx | number | The maximum spawn distance from the emitter along the x-axis for uniform distribution, or the standard deviation along the x-axis for normal distribution. |
| dy | number | The maximum spawn distance from the emitter along the y-axis for uniform distribution, or the standard deviation along the y-axis for normal distribution. |
| angle | number | The angle in radians of the emission area. |
| directionRelativeToCenter | boolean | True if newly spawned particles will be oriented relative to the center of the emission area, false otherwise. |

#### ParticleSystem:getEmissionRate

Gets the amount of particles emitted per second.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| rate | number | The amount of particles per second. |

#### ParticleSystem:getEmitterLifetime

Gets how long the particle system will emit particles (if -1 then it emits particles forever).

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| life | number | The lifetime of the emitter (in seconds). |

#### ParticleSystem:getInsertMode

Gets the mode used when the ParticleSystem adds new particles.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| mode | [ParticleInsertMode](#particleinsertmode) | The mode used when the ParticleSystem adds new particles. |

#### ParticleSystem:getLinearAcceleration

Gets the linear acceleration (acceleration along the x and y axes) for particles.

Every particle created will accelerate along the x and y axes between xmin,ymin and xmax,ymax.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| xmin | number | The minimum acceleration along the x axis. |
| ymin | number | The minimum acceleration along the y axis. |
| xmax | number | The maximum acceleration along the x axis. |
| ymax | number | The maximum acceleration along the y axis. |

#### ParticleSystem:getLinearDamping

Gets the amount of linear damping (constant deceleration) for particles.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| min | number | The minimum amount of linear damping applied to particles. |
| max | number | The maximum amount of linear damping applied to particles. |

#### ParticleSystem:getOffset

Gets the particle image's draw offset.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| ox | number | The x coordinate of the particle image's draw offset. |
| oy | number | The y coordinate of the particle image's draw offset. |

#### ParticleSystem:getParticleLifetime

Gets the lifetime of the particles.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| min | number | The minimum life of the particles (in seconds). |
| max | number | The maximum life of the particles (in seconds). |

#### ParticleSystem:getPosition

Gets the position of the emitter.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| x | number | Position along x-axis. |
| y | number | Position along y-axis. |

#### ParticleSystem:getQuads

Gets the series of Quads used for the particle sprites.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| quads | table | A table containing the Quads used. |

#### ParticleSystem:getRadialAcceleration

Gets the radial acceleration (away from the emitter).

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| min | number | The minimum acceleration. |
| max | number | The maximum acceleration. |

#### ParticleSystem:getRotation

Gets the rotation of the image upon particle creation (in radians).

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| min | number | The minimum initial angle (radians). |
| max | number | The maximum initial angle (radians). |

#### ParticleSystem:getSizeVariation

Gets the amount of size variation (0 meaning no variation and 1 meaning full variation between start and end).

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| variation | number | The amount of variation (0 meaning no variation and 1 meaning full variation between start and end). |

#### ParticleSystem:getSizes

Gets the series of sizes by which the sprite is scaled. 1.0 is normal size. The particle system will interpolate between each size evenly over the particle's lifetime.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| size1 | number | The first size. |
| size2 | number | The second size. |
| size8 | number | The eighth size. |

#### ParticleSystem:getSpeed

Gets the speed of the particles.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| min | number | The minimum linear speed of the particles. |
| max | number | The maximum linear speed of the particles. |

#### ParticleSystem:getSpin

Gets the spin of the sprite.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| min | number | The minimum spin (radians per second). |
| max | number | The maximum spin (radians per second). |
| variation | number | The degree of variation (0 meaning no variation and 1 meaning full variation between start and end). |

#### ParticleSystem:getSpinVariation

Gets the amount of spin variation (0 meaning no variation and 1 meaning full variation between start and end).

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| variation | number | The amount of variation (0 meaning no variation and 1 meaning full variation between start and end). |

#### ParticleSystem:getSpread

Gets the amount of directional spread of the particle emitter (in radians).

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| spread | number | The spread of the emitter (radians). |

#### ParticleSystem:getTangentialAcceleration

Gets the tangential acceleration (acceleration perpendicular to the particle's direction).

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| min | number | The minimum acceleration. |
| max | number | The maximum acceleration. |

#### ParticleSystem:getTexture

Gets the texture (Image or Canvas) used for the particles.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| texture | [Texture](#texture) | The Image or Canvas used for the particles. |

#### ParticleSystem:hasRelativeRotation

Gets whether particle angles and rotations are relative to their velocities. If enabled, particles are aligned to the angle of their velocities and rotate relative to that angle.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| enable | boolean | True if relative particle rotation is enabled, false if it's disabled. |

#### ParticleSystem:isActive

Checks whether the particle system is actively emitting particles.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| active | boolean | True if system is active, false otherwise. |

#### ParticleSystem:isPaused

Checks whether the particle system is paused.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| paused | boolean | True if system is paused, false otherwise. |

#### ParticleSystem:isStopped

Checks whether the particle system is stopped.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| stopped | boolean | True if system is stopped, false otherwise. |

#### ParticleSystem:moveTo

Moves the position of the emitter. This results in smoother particle spawning behaviour than if ParticleSystem:setPosition is used every frame.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | Position along x-axis. |
| y | number |  | Position along y-axis. |

**Returns:**

*No return values*

#### ParticleSystem:pause

Pauses the particle emitter.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

#### ParticleSystem:reset

Resets the particle emitter, removing any existing particles and resetting the lifetime counter.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

#### ParticleSystem:setBufferSize

Sets the size of the buffer (the max allowed amount of particles in the system).

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| size | number |  | The buffer size. |

**Returns:**

*No return values*

#### ParticleSystem:setColors

Sets a series of colors to apply to the particle sprite. The particle system will interpolate between each color evenly over the particle's lifetime.

Arguments can be passed in groups of four, representing the components of the desired RGBA value, or as tables of RGBA component values, with a default alpha value of 1 if only three values are given. At least one color must be specified. A maximum of eight may be used.

In versions prior to 11.0, color component values were within the range of 0 to 255 instead of 0 to 1.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| r1 | number |  | First color, red component (0-1). |
| g1 | number |  | First color, green component (0-1). |
| b1 | number |  | First color, blue component (0-1). |
| a1 | number | 1 | First color, alpha component (0-1). |
| ... | number |  | Additional colors. |

**Returns:**

*No return values*

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| rgba1 | table |  | First color, a numerical indexed table with the red, green, blue and alpha values as numbers (0-1). The alpha is optional and defaults to 1 if it is left out. |
| ... | table |  | Additional color, a numerical indexed table with the red, green, blue and alpha values as numbers (0-1). The alpha is optional and defaults to 1 if it is left out. |

**Returns:**

*No return values*

#### ParticleSystem:setDirection

Sets the direction the particles will be emitted in.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| direction | number |  | The direction of the particles (in radians). |

**Returns:**

*No return values*

#### ParticleSystem:setEmissionArea

Sets area-based spawn parameters for the particles. Newly created particles will spawn in an area around the emitter based on the parameters to this function.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| distribution | [AreaSpreadDistribution](#areaspreaddistribution) |  | The type of distribution for new particles. |
| dx | number |  | The maximum spawn distance from the emitter along the x-axis for uniform distribution, or the standard deviation along the x-axis for normal distribution. |
| dy | number |  | The maximum spawn distance from the emitter along the y-axis for uniform distribution, or the standard deviation along the y-axis for normal distribution. |
| angle | number | 0 | The angle in radians of the emission area. |
| directionRelativeToCenter | boolean | false | True if newly spawned particles will be oriented relative to the center of the emission area, false otherwise. |

**Returns:**

*No return values*

#### ParticleSystem:setEmissionRate

Sets the amount of particles emitted per second.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| rate | number |  | The amount of particles per second. |

**Returns:**

*No return values*

#### ParticleSystem:setEmitterLifetime

Sets how long the particle system should emit particles (if -1 then it emits particles forever).

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| life | number |  | The lifetime of the emitter (in seconds). |

**Returns:**

*No return values*

#### ParticleSystem:setInsertMode

Sets the mode to use when the ParticleSystem adds new particles.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| mode | [ParticleInsertMode](#particleinsertmode) |  | The mode to use when the ParticleSystem adds new particles. |

**Returns:**

*No return values*

#### ParticleSystem:setLinearAcceleration

Sets the linear acceleration (acceleration along the x and y axes) for particles.

Every particle created will accelerate along the x and y axes between xmin,ymin and xmax,ymax.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| xmin | number |  | The minimum acceleration along the x axis. |
| ymin | number |  | The minimum acceleration along the y axis. |
| xmax | number | xmin | The maximum acceleration along the x axis. |
| ymax | number | ymin | The maximum acceleration along the y axis. |

**Returns:**

*No return values*

#### ParticleSystem:setLinearDamping

Sets the amount of linear damping (constant deceleration) for particles.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| min | number |  | The minimum amount of linear damping applied to particles. |
| max | number | min | The maximum amount of linear damping applied to particles. |

**Returns:**

*No return values*

#### ParticleSystem:setOffset

Set the offset position which the particle sprite is rotated around.

If this function is not used, the particles rotate around their center.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | The x coordinate of the rotation offset. |
| y | number |  | The y coordinate of the rotation offset. |

**Returns:**

*No return values*

#### ParticleSystem:setParticleLifetime

Sets the lifetime of the particles.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| min | number |  | The minimum life of the particles (in seconds). |
| max | number | min | The maximum life of the particles (in seconds). |

**Returns:**

*No return values*

#### ParticleSystem:setPosition

Sets the position of the emitter.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | Position along x-axis. |
| y | number |  | Position along y-axis. |

**Returns:**

*No return values*

#### ParticleSystem:setQuads

Sets a series of Quads to use for the particle sprites. Particles will choose a Quad from the list based on the particle's current lifetime, allowing for the use of animated sprite sheets with ParticleSystems.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| quad1 | [Quad](#quad) |  | The first Quad to use. |
| ... | [Quad](#quad) |  | Additional Quads to use. |

**Returns:**

*No return values*

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| quads | table |  | A table containing the Quads to use. |

**Returns:**

*No return values*

#### ParticleSystem:setRadialAcceleration

Set the radial acceleration (away from the emitter).

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| min | number |  | The minimum acceleration. |
| max | number | min | The maximum acceleration. |

**Returns:**

*No return values*

#### ParticleSystem:setRelativeRotation

Sets whether particle angles and rotations are relative to their velocities. If enabled, particles are aligned to the angle of their velocities and rotate relative to that angle.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| enable | boolean |  | True to enable relative particle rotation, false to disable it. |

**Returns:**

*No return values*

#### ParticleSystem:setRotation

Sets the rotation of the image upon particle creation (in radians).

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| min | number |  | The minimum initial angle (radians). |
| max | number | min | The maximum initial angle (radians). |

**Returns:**

*No return values*

#### ParticleSystem:setSizeVariation

Sets the amount of size variation (0 meaning no variation and 1 meaning full variation between start and end).

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| variation | number |  | The amount of variation (0 meaning no variation and 1 meaning full variation between start and end). |

**Returns:**

*No return values*

#### ParticleSystem:setSizes

Sets a series of sizes by which to scale a particle sprite. 1.0 is normal size. The particle system will interpolate between each size evenly over the particle's lifetime.

At least one size must be specified. A maximum of eight may be used.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| size1 | number |  | The first size. |
| size2 | number | nil | The second size. |
| size8 | number | nil | The eighth size. |

**Returns:**

*No return values*

#### ParticleSystem:setSpeed

Sets the speed of the particles.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| min | number |  | The minimum linear speed of the particles. |
| max | number | min | The maximum linear speed of the particles. |

**Returns:**

*No return values*

#### ParticleSystem:setSpin

Sets the spin of the sprite.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| min | number |  | The minimum spin (radians per second). |
| max | number | min | The maximum spin (radians per second). |

**Returns:**

*No return values*

#### ParticleSystem:setSpinVariation

Sets the amount of spin variation (0 meaning no variation and 1 meaning full variation between start and end).

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| variation | number |  | The amount of variation (0 meaning no variation and 1 meaning full variation between start and end). |

**Returns:**

*No return values*

#### ParticleSystem:setSpread

Sets the amount of spread for the system.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| spread | number |  | The amount of spread (radians). |

**Returns:**

*No return values*

#### ParticleSystem:setTangentialAcceleration

Sets the tangential acceleration (acceleration perpendicular to the particle's direction).

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| min | number |  | The minimum acceleration. |
| max | number | min | The maximum acceleration. |

**Returns:**

*No return values*

#### ParticleSystem:setTexture

Sets the texture (Image or Canvas) to be used for the particles.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| texture | [Texture](#texture) |  | An Image or Canvas to use for the particles. |

**Returns:**

*No return values*

#### ParticleSystem:start

Starts the particle emitter.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

#### ParticleSystem:stop

Stops the particle emitter, resetting the lifetime counter.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

#### ParticleSystem:update

Updates the particle system; moving, creating and killing particles.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| dt | number |  | The time (seconds) since last frame. |

**Returns:**

*No return values*

## Quad

A quadrilateral (a polygon with four sides and four corners) with texture coordinate information.

Quads can be used to select part of a texture to draw. In this way, one large texture atlas can be loaded, and then split up into sub-images.

**Constructors:** [newQuad](#lovegraphicsnewquad)

**Supertypes:** Object

### Methods

#### Quad:getTextureDimensions

Gets reference texture dimensions initially specified in love.graphics.newQuad.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| sw | number | The Texture width used by the Quad. |
| sh | number | The Texture height used by the Quad. |

#### Quad:getViewport

Gets the current viewport of this Quad.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| x | number | The top-left corner along the x-axis. |
| y | number | The top-left corner along the y-axis. |
| w | number | The width of the viewport. |
| h | number | The height of the viewport. |

#### Quad:setViewport

Sets the texture coordinates according to a viewport.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | The top-left corner along the x-axis. |
| y | number |  | The top-left corner along the y-axis. |
| w | number |  | The width of the viewport. |
| h | number |  | The height of the viewport. |
| sw | number | nil | Optional new reference width, the width of the Texture. Must be greater than 0 if set. |
| sh | number | nil | Optional new reference height, the height of the Texture. Must be greater than 0 if set. |

**Returns:**

*No return values*

## Shader

A Shader is used for advanced hardware-accelerated pixel or vertex manipulation. These effects are written in a language based on GLSL (OpenGL Shading Language) with a few things simplified for easier coding.

Potential uses for shaders include HDR/bloom, motion blur, grayscale/invert/sepia/any kind of color effect, reflection/refraction, distortions, bump mapping, and much more! Here is a collection of basic shaders and good starting point to learn: https://github.com/vrld/moonshine

**Constructors:** [getShader](#lovegraphicsgetshader), [newShader](#lovegraphicsnewshader)

**Supertypes:** Object

### Methods

#### Shader:getWarnings

Returns any warning and error messages from compiling the shader code. This can be used for debugging your shaders if there's anything the graphics hardware doesn't like.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| warnings | string | Warning and error messages (if any). |

#### Shader:hasUniform

Gets whether a uniform / extern variable exists in the Shader.

If a graphics driver's shader compiler determines that a uniform / extern variable doesn't affect the final output of the shader, it may optimize the variable out. This function will return false in that case.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| name | string |  | The name of the uniform variable. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| hasuniform | boolean | Whether the uniform exists in the shader and affects its final output. |

#### Shader:send

Sends one or more values to a special (''uniform'') variable inside the shader. Uniform variables have to be marked using the ''uniform'' or ''extern'' keyword, e.g.

uniform float time;  // 'float' is the typical number type used in GLSL shaders.

uniform float varsvec2 light_pos;

uniform vec4 colors[4;

The corresponding send calls would be

shader:send('time', t)

shader:send('vars',a,b)

shader:send('light_pos', {light_x, light_y})

shader:send('colors', {r1, g1, b1, a1},  {r2, g2, b2, a2},  {r3, g3, b3, a3},  {r4, g4, b4, a4})

Uniform / extern variables are read-only in the shader code and remain constant until modified by a Shader:send call. Uniform variables can be accessed in both the Vertex and Pixel components of a shader, as long as the variable is declared in each.

### Variant 1

Because all numbers in Lua are floating point, in versions prior to 0.10.2 you must use the function Shader:sendInt to send values to uniform int variables in the shader's code.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| name | string |  | Name of the number to send to the shader. |
| number | number |  | Number to send to store in the uniform variable. |
| ... | number |  | Additional numbers to send if the uniform variable is an array. |

**Returns:**

*No return values*

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| name | string |  | Name of the vector to send to the shader. |
| vector | table |  | Numbers to send to the uniform variable as a vector. The number of elements in the table determines the type of the vector (e.g. two numbers -&gt; vec2). At least two and at most four numbers can be used. |
| ... | table |  | Additional vectors to send if the uniform variable is an array. All vectors need to be of the same size (e.g. only vec3's). |

**Returns:**

*No return values*

### Variant 3

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| name | string |  | Name of the matrix to send to the shader. |
| matrix | table |  | 2x2, 3x3, or 4x4 matrix to send to the uniform variable. Using table form: {{a,b,c,d}, {e,f,g,h}, ... } or (since version 0.10.2) {a,b,c,d, e,f,g,h, ...}. The order in 0.10.2 is column-major; starting in 11.0 it's row-major instead. |
| ... | table |  | Additional matrices of the same type as ''matrix'' to store in a uniform array. |

**Returns:**

*No return values*

### Variant 4

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| name | string |  | Name of the Texture to send to the shader. |
| texture | [Texture](#texture) |  | Texture (Image or Canvas) to send to the uniform variable. |

**Returns:**

*No return values*

### Variant 5

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| name | string |  | Name of the boolean to send to the shader. |
| boolean | boolean |  | Boolean to send to store in the uniform variable. |
| ... | boolean |  | Additional booleans to send if the uniform variable is an array. |

**Returns:**

*No return values*

### Variant 6

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| name | string |  | Name of the matrix to send to the shader. |
| matrixlayout | MatrixLayout |  | The layout (row- or column-major) of the matrix. |
| matrix | table |  | 2x2, 3x3, or 4x4 matrix to send to the uniform variable. Using table form: {{a,b,c,d}, {e,f,g,h}, ... } or {a,b,c,d, e,f,g,h, ...}. |
| ... | table |  | Additional matrices of the same type as ''matrix'' to store in a uniform array. |

**Returns:**

*No return values*

### Variant 7

Sends uniform values to the Shader sourced from the contents of a Data object. This directly copies the bytes of the data.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| name | string |  | Name of the uniform to send to the shader. |
| data | Data |  | Data object containing the values to send. |
| offset | number | 0 | Offset in bytes from the start of the Data object. |
| size | number | all | Size in bytes of the data to send. If nil, as many bytes as the specified uniform uses will be copied. |

**Returns:**

*No return values*

### Variant 8

Sends uniform matrices to the Shader sourced from the contents of a Data object. This directly copies the bytes of the data.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| name | string |  | Name of the uniform matrix to send to the shader. |
| data | Data |  | Data object containing the values to send. |
| matrixlayout | MatrixLayout |  | The layout (row- or column-major) of the matrix in memory. |
| offset | number | 0 | Offset in bytes from the start of the Data object. |
| size | number | all | Size in bytes of the data to send. If nil, as many bytes as the specified uniform uses will be copied. |

**Returns:**

*No return values*

### Variant 9

Sends uniform matrices to the Shader sourced from the contents of a Data object. This directly copies the bytes of the data.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| name | string |  | Name of the uniform matrix to send to the shader. |
| matrixlayout | MatrixLayout |  | The layout (row- or column-major) of the matrix in memory. |
| data | Data |  | Data object containing the values to send. |
| offset | number | 0 | Offset in bytes from the start of the Data object. |
| size | number | all | Size in bytes of the data to send. If nil, as many bytes as the specified uniform uses will be copied. |

**Returns:**

*No return values*

#### Shader:sendColor

Sends one or more colors to a special (''extern'' / ''uniform'') vec3 or vec4 variable inside the shader. The color components must be in the range of 1. The colors are gamma-corrected if global gamma-correction is enabled.

Extern variables must be marked using the ''extern'' keyword, e.g.

extern vec4 Color;

The corresponding sendColor call would be

shader:sendColor('Color', {r, g, b, a})

Extern variables can be accessed in both the Vertex and Pixel stages of a shader, as long as the variable is declared in each.

In versions prior to 11.0, color component values were within the range of 0 to 255 instead of 0 to 1.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| name | string |  | The name of the color extern variable to send to in the shader. |
| color | table |  | A table with red, green, blue, and optional alpha color components in the range of 1 to send to the extern as a vector. |
| ... | table |  | Additional colors to send in case the extern is an array. All colors need to be of the same size (e.g. only vec3's). |

**Returns:**

*No return values*

## SpriteBatch

Using a single image, draw any number of identical copies of the image using a single call to love.graphics.draw(). This can be used, for example, to draw repeating copies of a single background image with high performance.

A SpriteBatch can be even more useful when the underlying image is a texture atlas (a single image file containing many independent images); by adding Quads to the batch, different sub-images from within the atlas can be drawn.

**Constructors:** [newSpriteBatch](#lovegraphicsnewspritebatch)

**Supertypes:** Drawable, Object

### Methods

#### SpriteBatch:add

Adds a sprite to the batch. Sprites are drawn in the order they are added.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | The position to draw the object (x-axis). |
| y | number |  | The position to draw the object (y-axis). |
| r | number | 0 | Orientation (radians). |
| sx | number | 1 | Scale factor (x-axis). |
| sy | number | sx | Scale factor (y-axis). |
| ox | number | 0 | Origin offset (x-axis). |
| oy | number | 0 | Origin offset (y-axis). |
| kx | number | 0 | Shear factor (x-axis). |
| ky | number | 0 | Shear factor (y-axis). |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| id | number | An identifier for the added sprite. |

### Variant 2

Adds a Quad to the batch.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| quad | [Quad](#quad) |  | The Quad to add. |
| x | number |  | The position to draw the object (x-axis). |
| y | number |  | The position to draw the object (y-axis). |
| r | number | 0 | Orientation (radians). |
| sx | number | 1 | Scale factor (x-axis). |
| sy | number | sx | Scale factor (y-axis). |
| ox | number | 0 | Origin offset (x-axis). |
| oy | number | 0 | Origin offset (y-axis). |
| kx | number | 0 | Shear factor (x-axis). |
| ky | number | 0 | Shear factor (y-axis). |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| id | number | An identifier for the added sprite. |

#### SpriteBatch:addLayer

Adds a sprite to a batch created with an Array Texture.

### Variant 1

Adds a layer of the SpriteBatch's Array Texture.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| layerindex | number |  | The index of the layer to use for this sprite. |
| x | number | 0 | The position to draw the sprite (x-axis). |
| y | number | 0 | The position to draw the sprite (y-axis). |
| r | number | 0 | Orientation (radians). |
| sx | number | 1 | Scale factor (x-axis). |
| sy | number | sx | Scale factor (y-axis). |
| ox | number | 0 | Origin offset (x-axis). |
| oy | number | 0 | Origin offset (y-axis). |
| kx | number | 0 | Shearing factor (x-axis). |
| ky | number | 0 | Shearing factor (y-axis). |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| spriteindex | number | The index of the added sprite, for use with SpriteBatch:set or SpriteBatch:setLayer. |

### Variant 2

Adds a layer of the SpriteBatch's Array Texture using the specified Quad.

The specified layer index overrides any layer index set on the Quad via Quad:setLayer.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| layerindex | number |  | The index of the layer to use for this sprite. |
| quad | [Quad](#quad) |  | The subsection of the texture's layer to use when drawing the sprite. |
| x | number | 0 | The position to draw the sprite (x-axis). |
| y | number | 0 | The position to draw the sprite (y-axis). |
| r | number | 0 | Orientation (radians). |
| sx | number | 1 | Scale factor (x-axis). |
| sy | number | sx | Scale factor (y-axis). |
| ox | number | 0 | Origin offset (x-axis). |
| oy | number | 0 | Origin offset (y-axis). |
| kx | number | 0 | Shearing factor (x-axis). |
| ky | number | 0 | Shearing factor (y-axis). |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| spriteindex | number | The index of the added sprite, for use with SpriteBatch:set or SpriteBatch:setLayer. |

### Variant 3

Adds a layer of the SpriteBatch's Array Texture using the specified Transform.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| layerindex | number |  | The index of the layer to use for this sprite. |
| transform | Transform |  | A transform object. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| spriteindex | number | The index of the added sprite, for use with SpriteBatch:set or SpriteBatch:setLayer. |

### Variant 4

Adds a layer of the SpriteBatch's Array Texture using the specified Quad and Transform.

In order to use an Array Texture or other non-2D texture types as the main texture in a custom void effect() variant must be used in the pixel shader, and MainTex must be declared as an ArrayImage or sampler2DArray like so: uniform ArrayImage MainTex;.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| layerindex | number |  | The index of the layer to use for this sprite. |
| quad | [Quad](#quad) |  | The subsection of the texture's layer to use when drawing the sprite. |
| transform | Transform |  | A transform object. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| spriteindex | number | The index of the added sprite, for use with SpriteBatch:set or SpriteBatch:setLayer. |

#### SpriteBatch:attachAttribute

Attaches a per-vertex attribute from a Mesh onto this SpriteBatch, for use when drawing. This can be combined with a Shader to augment a SpriteBatch with per-vertex or additional per-sprite information instead of just having per-sprite colors.

Each sprite in a SpriteBatch has 4 vertices in the following order: top-left, bottom-left, top-right, bottom-right. The index returned by SpriteBatch:add (and used by SpriteBatch:set) can used to determine the first vertex of a specific sprite with the formula 1 + 4 * ( id - 1 ).

If a created with a custom vertex format, it will have 3 vertex attributes named VertexPosition, VertexTexCoord, and VertexColor. If vertex attributes with those names are attached to the SpriteBatch, it will override the SpriteBatch's sprite positions, texture coordinates, and sprite colors, respectively.

Custom named attributes can be accessed in a vertex shader by declaring them as attribute vec4 MyCustomAttributeName; at the top-level of the vertex shader code. The name must match what was specified in the Mesh's vertex format and in the name argument of SpriteBatch:attachAttribute.

A Mesh must have at least 4 * SpriteBatch:getBufferSize vertices in order to be attachable to a SpriteBatch.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| name | string |  | The name of the vertex attribute to attach. |
| mesh | [Mesh](#mesh) |  | The Mesh to get the vertex attribute from. |

**Returns:**

*No return values*

#### SpriteBatch:clear

Removes all sprites from the buffer.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

#### SpriteBatch:flush

Immediately sends all new and modified sprite data in the batch to the graphics card.

Normally it isn't necessary to call this method as love.graphics.draw(spritebatch, ...) will do it automatically if needed, but explicitly using SpriteBatch:flush gives more control over when the work happens.

If this method is used, it generally shouldn't be called more than once (at most) between love.graphics.draw(spritebatch, ...) calls.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

#### SpriteBatch:getBufferSize

Gets the maximum number of sprites the SpriteBatch can hold.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| size | number | The maximum number of sprites the batch can hold. |

#### SpriteBatch:getColor

Gets the color that will be used for the next add and set operations.

If no color has been set with SpriteBatch:setColor or the current SpriteBatch color has been cleared, this method will return nil.

In versions prior to 11.0, color component values were within the range of 0 to 255 instead of 0 to 1.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| r | number | The red component (0-1). |
| g | number | The green component (0-1). |
| b | number | The blue component (0-1). |
| a | number | The alpha component (0-1). |

#### SpriteBatch:getCount

Gets the number of sprites currently in the SpriteBatch.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| count | number | The number of sprites currently in the batch. |

#### SpriteBatch:getTexture

Gets the texture (Image or Canvas) used by the SpriteBatch.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| texture | [Texture](#texture) | The Image or Canvas used by the SpriteBatch. |

#### SpriteBatch:set

Changes a sprite in the batch. This requires the sprite index returned by SpriteBatch:add or SpriteBatch:addLayer.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| spriteindex | number |  | The index of the sprite that will be changed. |
| x | number |  | The position to draw the object (x-axis). |
| y | number |  | The position to draw the object (y-axis). |
| r | number | 0 | Orientation (radians). |
| sx | number | 1 | Scale factor (x-axis). |
| sy | number | sx | Scale factor (y-axis). |
| ox | number | 0 | Origin offset (x-axis). |
| oy | number | 0 | Origin offset (y-axis). |
| kx | number | 0 | Shear factor (x-axis). |
| ky | number | 0 | Shear factor (y-axis). |

**Returns:**

*No return values*

### Variant 2

Changes a sprite with a Quad in the batch. This requires the index returned by SpriteBatch:add or SpriteBatch:addLayer.

SpriteBatches do not support removing individual sprites. One can do a pseudo removal (instead of clearing and re-adding everything) by:

SpriteBatch:set(id, 0, 0, 0, 0, 0)

This makes all the sprite's vertices equal (because the x and y scales are 0), which prevents the GPU from fully processing the sprite when drawing the SpriteBatch.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| spriteindex | number |  | The index of the sprite that will be changed. |
| quad | [Quad](#quad) |  | The Quad used on the image of the batch. |
| x | number |  | The position to draw the object (x-axis). |
| y | number |  | The position to draw the object (y-axis). |
| r | number | 0 | Orientation (radians). |
| sx | number | 1 | Scale factor (x-axis). |
| sy | number | sx | Scale factor (y-axis). |
| ox | number | 0 | Origin offset (x-axis). |
| oy | number | 0 | Origin offset (y-axis). |
| kx | number | 0 | Shear factor (x-axis). |
| ky | number | 0 | Shear factor (y-axis). |

**Returns:**

*No return values*

#### SpriteBatch:setColor

Sets the color that will be used for the next add and set operations. Calling the function without arguments will disable all per-sprite colors for the SpriteBatch.

In versions prior to 11.0, color component values were within the range of 0 to 255 instead of 0 to 1.

In version 0.9.2 and older, the global color set with love.graphics.setColor will not work on the SpriteBatch if any of the sprites has its own color.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| r | number |  | The amount of red. |
| g | number |  | The amount of green. |
| b | number |  | The amount of blue. |
| a | number | 1 | The amount of alpha. |

**Returns:**

*No return values*

### Variant 2

Disables all per-sprite colors for this SpriteBatch.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

#### SpriteBatch:setDrawRange

Restricts the drawn sprites in the SpriteBatch to a subset of the total.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| start | number |  | The index of the first sprite to draw. Index 1 corresponds to the first sprite added with SpriteBatch:add. |
| count | number |  | The number of sprites to draw. |

**Returns:**

*No return values*

### Variant 2

Allows all sprites in the SpriteBatch to be drawn.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

#### SpriteBatch:setLayer

Changes a sprite previously added with add or addLayer, in a batch created with an Array Texture.

### Variant 1

Changes the sprite in the SpriteBatch.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| spriteindex | number |  | The index of the existing sprite to replace. |
| layerindex | number |  | The index of the layer in the Array Texture to use for this sprite. |
| x | number | 0 | The position to draw the sprite (x-axis). |
| y | number | 0 | The position to draw the sprite (y-axis). |
| r | number | 0 | Orientation (radians). |
| sx | number | 1 | Scale factor (x-axis). |
| sy | number | sx | Scale factor (y-axis). |
| ox | number | 0 | Origin offset (x-axis). |
| oy | number | 0 | Origin offset (y-axis). |
| kx | number | 0 | Shearing factor (x-axis). |
| ky | number | 0 | Shearing factor (y-axis). |

**Returns:**

*No return values*

### Variant 2

Adds a layer of the SpriteBatch's Array Texture using the specified Quad.

The specified layer index overrides any layer index set on the Quad via Quad:setLayer.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| spriteindex | number |  | The index of the existing sprite to replace. |
| layerindex | number |  | The index of the layer to use for this sprite. |
| quad | [Quad](#quad) |  | The subsection of the texture's layer to use when drawing the sprite. |
| x | number | 0 | The position to draw the sprite (x-axis). |
| y | number | 0 | The position to draw the sprite (y-axis). |
| r | number | 0 | Orientation (radians). |
| sx | number | 1 | Scale factor (x-axis). |
| sy | number | sx | Scale factor (y-axis). |
| ox | number | 0 | Origin offset (x-axis). |
| oy | number | 0 | Origin offset (y-axis). |
| kx | number | 0 | Shearing factor (x-axis). |
| ky | number | 0 | Shearing factor (y-axis). |

**Returns:**

*No return values*

### Variant 3

Adds a layer of the SpriteBatch's Array Texture using the specified Transform.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| spriteindex | number |  | The index of the existing sprite to replace. |
| layerindex | number |  | The index of the layer to use for the sprite. |
| transform | Transform |  | A transform object. |

**Returns:**

*No return values*

### Variant 4

Adds a layer of the SpriteBatch's Array Texture using the specified Quad and Transform.

The specified layer index overrides any layer index set on the Quad via Quad:setLayer.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| spriteindex | number |  | The index of the existing sprite to replace. |
| layerindex | number |  | The index of the layer to use for the sprite. |
| quad | [Quad](#quad) |  | The subsection of the texture's layer to use when drawing the sprite. |
| transform | Transform |  | A transform object. |

**Returns:**

*No return values*

#### SpriteBatch:setTexture

Sets the texture (Image or Canvas) used for the sprites in the batch, when drawing.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| texture | [Texture](#texture) |  | The new Image or Canvas to use for the sprites in the batch. |

**Returns:**

*No return values*

## Text

Drawable text.

**Constructors:** [newText](#lovegraphicsnewtext)

**Supertypes:** Drawable, Object

### Methods

#### Text:add

Adds additional colored text to the Text object at the specified position.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| textstring | string |  | The text to add to the object. |
| x | number | 0 | The position of the new text on the x-axis. |
| y | number | 0 | The position of the new text on the y-axis. |
| angle | number | 0 | The orientation of the new text in radians. |
| sx | number | 1 | Scale factor on the x-axis. |
| sy | number | sx | Scale factor on the y-axis. |
| ox | number | 0 | Origin offset on the x-axis. |
| oy | number | 0 | Origin offset on the y-axis. |
| kx | number | 0 | Shearing / skew factor on the x-axis. |
| ky | number | 0 | Shearing / skew factor on the y-axis. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| index | number | An index number that can be used with Text:getWidth or Text:getHeight. |

### Variant 2

The color set by love.graphics.setColor will be combined (multiplied) with the colors of the text, when drawing the Text object.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| coloredtext | table |  | A table containing colors and strings to add to the object, in the form of {color1, string1, color2, string2, ...}. (see table fields below) |
| x | number | 0 | The position of the new text on the x-axis. |
| y | number | 0 | The position of the new text on the y-axis. |
| angle | number | 0 | The orientation of the new text in radians. |
| sx | number | 1 | Scale factor on the x-axis. |
| sy | number | sx | Scale factor on the y-axis. |
| ox | number | 0 | Origin offset on the x-axis. |
| oy | number | 0 | Origin offset on the y-axis. |
| kx | number | 0 | Shearing / skew factor on the x-axis. |
| ky | number | 0 | Shearing / skew factor on the y-axis. |

**coloredtext table fields:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| color1 | table |  | A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}. |
| string1 | string |  | A string of text which has a color specified by the previous color. |
| color2 | table |  | A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}. |
| string2 | string |  | A string of text which has a color specified by the previous color. |
| ... | tables and strings |  | Additional colors and strings. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| index | number | An index number that can be used with Text:getWidth or Text:getHeight. |

#### Text:addf

Adds additional formatted / colored text to the Text object at the specified position.

The word wrap limit is applied before any scaling, rotation, and other coordinate transformations. Therefore the amount of text per line stays constant given the same wrap limit, even if the scale arguments change.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| textstring | string |  | The text to add to the object. |
| wraplimit | number |  | The maximum width in pixels of the text before it gets automatically wrapped to a new line. |
| align | [AlignMode](#alignmode) |  | The alignment of the text. |
| x | number |  | The position of the new text (x-axis). |
| y | number |  | The position of the new text (y-axis). |
| angle | number | 0 | Orientation (radians). |
| sx | number | 1 | Scale factor (x-axis). |
| sy | number | sx | Scale factor (y-axis). |
| ox | number | 0 | Origin offset (x-axis). |
| oy | number | 0 | Origin offset (y-axis). |
| kx | number | 0 | Shearing / skew factor (x-axis). |
| ky | number | 0 | Shearing / skew factor (y-axis). |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| index | number | An index number that can be used with Text:getWidth or Text:getHeight. |

### Variant 2

The color set by love.graphics.setColor will be combined (multiplied) with the colors of the text, when drawing the Text object.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| coloredtext | table |  | A table containing colors and strings to add to the object, in the form of {color1, string1, color2, string2, ...}. (see table fields below) |
| wraplimit | number |  | The maximum width in pixels of the text before it gets automatically wrapped to a new line. |
| align | [AlignMode](#alignmode) |  | The alignment of the text. |
| x | number |  | The position of the new text (x-axis). |
| y | number |  | The position of the new text (y-axis). |
| angle | number | 0 | Orientation (radians). |
| sx | number | 1 | Scale factor (x-axis). |
| sy | number | sx | Scale factor (y-axis). |
| ox | number | 0 | Origin offset (x-axis). |
| oy | number | 0 | Origin offset (y-axis). |
| kx | number | 0 | Shearing / skew factor (x-axis). |
| ky | number | 0 | Shearing / skew factor (y-axis). |

**coloredtext table fields:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| color1 | table |  | A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}. |
| string1 | string |  | A string of text which has a color specified by the previous color. |
| color2 | table |  | A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}. |
| string2 | string |  | A string of text which has a color specified by the previous color. |
| ... | tables and strings |  | Additional colors and strings. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| index | number | An index number that can be used with Text:getWidth or Text:getHeight. |

#### Text:clear

Clears the contents of the Text object.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

#### Text:getDimensions

Gets the width and height of the text in pixels.

### Variant 1

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| width | number | The width of the text. If multiple sub-strings have been added with Text:add, the width of the last sub-string is returned. |
| height | number | The height of the text. If multiple sub-strings have been added with Text:add, the height of the last sub-string is returned. |

### Variant 2

Gets the width and height of a specific sub-string that was previously added to the Text object.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| index | number |  | An index number returned by Text:add or Text:addf. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| width | number | The width of the sub-string (before scaling and other transformations). |
| height | number | The height of the sub-string (before scaling and other transformations). |

#### Text:getFont

Gets the Font used with the Text object.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| font | [Font](#font) | The font used with this Text object. |

#### Text:getHeight

Gets the height of the text in pixels.

### Variant 1

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
|  height  | number | The height of the text. If multiple sub-strings have been added with Text:add, the height of the last sub-string is returned. |

### Variant 2

Gets the height of a specific sub-string that was previously added to the Text object.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| index | number |  | An index number returned by Text:add or Text:addf. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| height | number | The height of the sub-string (before scaling and other transformations). |

#### Text:getWidth

Gets the width of the text in pixels.

### Variant 1

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| width | number | The width of the text. If multiple sub-strings have been added with Text:add, the width of the last sub-string is returned. |

### Variant 2

Gets the width of a specific sub-string that was previously added to the Text object.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| index | number |  | An index number returned by Text:add or Text:addf. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| width | number | The width of the sub-string (before scaling and other transformations). |

#### Text:set

Replaces the contents of the Text object with a new unformatted string.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| textstring | string |  | The new string of text to use. |

**Returns:**

*No return values*

### Variant 2

The color set by love.graphics.setColor will be combined (multiplied) with the colors of the text, when drawing the Text object.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| coloredtext | table |  | A table containing colors and strings to use as the new text, in the form of {color1, string1, color2, string2, ...}. (see table fields below) |

**coloredtext table fields:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| color1 | table |  | A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}. |
| string1 | string |  | A string of text which has a color specified by the previous color. |
| color2 | table |  | A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}. |
| string2 | string |  | A string of text which has a color specified by the previous color. |
| ... | tables and strings |  | Additional colors and strings. |

**Returns:**

*No return values*

#### Text:setFont

Replaces the Font used with the text.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| font | [Font](#font) |  | The new font to use with this Text object. |

**Returns:**

*No return values*

#### Text:setf

Replaces the contents of the Text object with a new formatted string.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| textstring | string |  | The new string of text to use. |
| wraplimit | number |  | The maximum width in pixels of the text before it gets automatically wrapped to a new line. |
| align | [AlignMode](#alignmode) |  | The alignment of the text. |

**Returns:**

*No return values*

### Variant 2

The color set by love.graphics.setColor will be combined (multiplied) with the colors of the text, when drawing the Text object.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| coloredtext | table |  | A table containing colors and strings to use as the new text, in the form of {color1, string1, color2, string2, ...}. (see table fields below) |
| wraplimit | number |  | The maximum width in pixels of the text before it gets automatically wrapped to a new line. |
| align | [AlignMode](#alignmode) |  | The alignment of the text. |

**coloredtext table fields:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| color1 | table |  | A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}. |
| string1 | string |  | A string of text which has a color specified by the previous color. |
| color2 | table |  | A table containing red, green, blue, and optional alpha components to use as a color for the next string in the table, in the form of {red, green, blue, alpha}. |
| string2 | string |  | A string of text which has a color specified by the previous color. |
| ... | tables and strings |  | Additional colors and strings. |

**Returns:**

*No return values*

## Texture

Superclass for drawable objects which represent a texture. All Textures can be drawn with Quads. This is an abstract type that can't be created directly.

**Supertypes:** Drawable, Object

### Methods

#### Texture:getDPIScale

Gets the DPI scale factor of the Texture.

The DPI scale factor represents relative pixel density. A DPI scale factor of 2 means the texture has twice the pixel density in each dimension (4 times as many pixels in the same area) compared to a texture with a DPI scale factor of 1.

For example, a texture with pixel dimensions of 100x100 with a DPI scale factor of 2 will be drawn as if it was 50x50. This is useful with high-dpi /  retina displays to easily allow swapping out higher or lower pixel density Images and Canvases without needing any extra manual scaling logic.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| dpiscale | number | The DPI scale factor of the Texture. |

#### Texture:getDepth

Gets the depth of a Volume Texture. Returns 1 for 2D, Cubemap, and Array textures.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| depth | number | The depth of the volume Texture. |

#### Texture:getDepthSampleMode

Gets the comparison mode used when sampling from a depth texture in a shader.

Depth texture comparison modes are advanced low-level functionality typically used with shadow mapping in 3D.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| compare | [CompareMode](#comparemode) | The comparison mode used when sampling from this texture in a shader, or nil if setDepthSampleMode has not been called on this Texture. |

#### Texture:getDimensions

Gets the width and height of the Texture.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| width | number | The width of the Texture. |
| height | number | The height of the Texture. |

#### Texture:getFilter

Gets the filter mode of the Texture.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| min | [FilterMode](#filtermode) | Filter mode to use when minifying the texture (rendering it at a smaller size on-screen than its size in pixels). |
| mag | [FilterMode](#filtermode) | Filter mode to use when magnifying the texture (rendering it at a smaller size on-screen than its size in pixels). |
| anisotropy | number | Maximum amount of anisotropic filtering used. |

#### Texture:getFormat

Gets the pixel format of the Texture.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| format | PixelFormat | The pixel format the Texture was created with. |

#### Texture:getHeight

Gets the height of the Texture.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| height | number | The height of the Texture. |

#### Texture:getLayerCount

Gets the number of layers / slices in an Array Texture. Returns 1 for 2D, Cubemap, and Volume textures.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| layers | number | The number of layers in the Array Texture. |

#### Texture:getMipmapCount

Gets the number of mipmaps contained in the Texture. If the texture was not created with mipmaps, it will return 1.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| mipmaps | number | The number of mipmaps in the Texture. |

#### Texture:getMipmapFilter

Gets the mipmap filter mode for a Texture. Prior to 11.0 this method only worked on Images.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| mode | [FilterMode](#filtermode) | The filter mode used in between mipmap levels. nil if mipmap filtering is not enabled. |
| sharpness | number | Value used to determine whether the image should use more or less detailed mipmap levels than normal when drawing. |

#### Texture:getPixelDimensions

Gets the width and height in pixels of the Texture.

Texture:getDimensions gets the dimensions of the texture in units scaled by the texture's DPI scale factor, rather than pixels. Use getDimensions for calculations related to drawing the texture (calculating an origin offset, for example), and getPixelDimensions only when dealing specifically with pixels, for example when using Canvas:newImageData.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| pixelwidth | number | The width of the Texture, in pixels. |
| pixelheight | number | The height of the Texture, in pixels. |

#### Texture:getPixelHeight

Gets the height in pixels of the Texture.

DPI scale factor, rather than pixels. Use getHeight for calculations related to drawing the texture (calculating an origin offset, for example), and getPixelHeight only when dealing specifically with pixels, for example when using Canvas:newImageData.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| pixelheight | number | The height of the Texture, in pixels. |

#### Texture:getPixelWidth

Gets the width in pixels of the Texture.

DPI scale factor, rather than pixels. Use getWidth for calculations related to drawing the texture (calculating an origin offset, for example), and getPixelWidth only when dealing specifically with pixels, for example when using Canvas:newImageData.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| pixelwidth | number | The width of the Texture, in pixels. |

#### Texture:getTextureType

Gets the type of the Texture.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| texturetype | [TextureType](#texturetype) | The type of the Texture. |

#### Texture:getWidth

Gets the width of the Texture.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| width | number | The width of the Texture. |

#### Texture:getWrap

Gets the wrapping properties of a Texture.

This function returns the currently set horizontal and vertical wrapping modes for the texture.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| horiz | [WrapMode](#wrapmode) | Horizontal wrapping mode of the texture. |
| vert | [WrapMode](#wrapmode) | Vertical wrapping mode of the texture. |
| depth | [WrapMode](#wrapmode) | Wrapping mode for the z-axis of a Volume texture. |

#### Texture:isReadable

Gets whether the Texture can be drawn and sent to a Shader.

Canvases created with stencil and/or depth PixelFormats are not readable by default, unless readable=true is specified in the settings table passed into love.graphics.newCanvas.

Non-readable Canvases can still be rendered to.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| readable | boolean | Whether the Texture is readable. |

#### Texture:setDepthSampleMode

Sets the comparison mode used when sampling from a depth texture in a shader. Depth texture comparison modes are advanced low-level functionality typically used with shadow mapping in 3D.

When using a depth texture with a comparison mode set in a shader, it must be declared as a sampler2DShadow and used in a GLSL 3 Shader. The result of accessing the texture in the shader will return a float between 0 and 1, proportional to the number of samples (up to 4 samples will be used if bilinear filtering is enabled) that passed the test set by the comparison operation.

Depth texture comparison can only be used with readable depth-formatted Canvases.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| compare | [CompareMode](#comparemode) |  | The comparison mode used when sampling from this texture in a shader. |

**Returns:**

*No return values*

#### Texture:setFilter

Sets the filter mode of the Texture.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| min | [FilterMode](#filtermode) |  | Filter mode to use when minifying the texture (rendering it at a smaller size on-screen than its size in pixels). |
| mag | [FilterMode](#filtermode) | min | Filter mode to use when magnifying the texture (rendering it at a larger size on-screen than its size in pixels). |
| anisotropy | number | 1 | Maximum amount of anisotropic filtering to use. |

**Returns:**

*No return values*

#### Texture:setMipmapFilter

Sets the mipmap filter mode for a Texture. Prior to 11.0 this method only worked on Images.

Mipmapping is useful when drawing a texture at a reduced scale. It can improve performance and reduce aliasing issues.

In created with the mipmaps flag enabled for the mipmap filter to have any effect. In versions prior to 0.10.0 it's best to call this method directly after creating the image with love.graphics.newImage, to avoid bugs in certain graphics drivers.

Due to hardware restrictions and driver bugs, in versions prior to 0.10.0 images that weren't loaded from a CompressedData must have power-of-two dimensions (64x64, 512x256, etc.) to use mipmaps.

### Variant 1

On mobile devices (Android and iOS), the sharpness parameter is not supported and will do nothing. You can use a custom compressed and its CompressedData has mipmap data included, it will use that.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| filtermode | [FilterMode](#filtermode) |  | The filter mode to use in between mipmap levels. 'nearest' will often give better performance. |
| sharpness | number | 0 | A positive sharpness value makes the texture use a more detailed mipmap level when drawing, at the expense of performance. A negative value does the reverse. |

**Returns:**

*No return values*

### Variant 2

Disables mipmap filtering.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

#### Texture:setWrap

Sets the wrapping properties of a Texture.

This function sets the way a Texture is repeated when it is drawn with a Quad that is larger than the texture's extent, or when a custom Shader is used which uses texture coordinates outside of [0, 1]. A texture may be clamped or set to repeat in both horizontal and vertical directions.

Clamped textures appear only once (with the edges of the texture stretching to fill the extent of the Quad), whereas repeated ones repeat as many times as there is room in the Quad.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| horiz | [WrapMode](#wrapmode) |  | Horizontal wrapping mode of the texture. |
| vert | [WrapMode](#wrapmode) | horiz | Vertical wrapping mode of the texture. |
| depth | [WrapMode](#wrapmode) | horiz | Wrapping mode for the z-axis of a Volume texture. |

**Returns:**

*No return values*

## Video

A drawable video.

**Constructors:** [newVideo](#lovegraphicsnewvideo)

**Supertypes:** Drawable, Object

### Methods

#### Video:getDimensions

Gets the width and height of the Video in pixels.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| width | number | The width of the Video. |
| height | number | The height of the Video. |

#### Video:getFilter

Gets the scaling filters used when drawing the Video.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| min | [FilterMode](#filtermode) | The filter mode used when scaling the Video down. |
| mag | [FilterMode](#filtermode) | The filter mode used when scaling the Video up. |
| anisotropy | number | Maximum amount of anisotropic filtering used. |

#### Video:getHeight

Gets the height of the Video in pixels.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| height | number | The height of the Video. |

#### Video:getSource

Gets the audio Source used for playing back the video's audio. May return nil if the video has no audio, or if Video:setSource is called with a nil argument.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| source | Source | The audio Source used for audio playback, or nil if the video has no audio. |

#### Video:getStream

Gets the VideoStream object used for decoding and controlling the video.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| stream | VideoStream | The VideoStream used for decoding and controlling the video. |

#### Video:getWidth

Gets the width of the Video in pixels.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| width | number | The width of the Video. |

#### Video:isPlaying

Gets whether the Video is currently playing.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| playing | boolean | Whether the video is playing. |

#### Video:pause

Pauses the Video.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

#### Video:play

Starts playing the Video. In order for the video to appear onscreen it must be drawn with love.graphics.draw.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

#### Video:rewind

Rewinds the Video to the beginning.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

#### Video:seek

Sets the current playback position of the Video.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| offset | number |  | The time in seconds since the beginning of the Video. |

**Returns:**

*No return values*

#### Video:setFilter

Sets the scaling filters used when drawing the Video.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| min | [FilterMode](#filtermode) |  | The filter mode used when scaling the Video down. |
| mag | [FilterMode](#filtermode) |  | The filter mode used when scaling the Video up. |
| anisotropy | number | 1 | Maximum amount of anisotropic filtering used. |

**Returns:**

*No return values*

#### Video:setSource

Sets the audio Source used for playing back the video's audio. The audio Source also controls playback speed and synchronization.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| source | Source | nil | The audio Source used for audio playback, or nil to disable audio synchronization. |

**Returns:**

*No return values*

#### Video:tell

Gets the current playback position of the Video.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| seconds | number | The time in seconds since the beginning of the Video. |

## Enums

## AlignMode

Text alignment.

**Constants:**

| Name | Description |
| --- | --- |
| `center` | Align text center. |
| `left` | Align text left. |
| `right` | Align text right. |
| `justify` | Align text both left and right. |

## ArcType

Different types of arcs that can be drawn.

**Constants:**

| Name | Description |
| --- | --- |
| `pie` | The arc is drawn like a slice of pie, with the arc circle connected to the center at its end-points. |
| `open` | The arc circle's two end-points are unconnected when the arc is drawn as a line. Behaves like the "closed" arc type when the arc is drawn in filled mode. |
| `closed` | The arc circle's two end-points are connected to each other. |

## AreaSpreadDistribution

Types of particle area spread distribution.

**Constants:**

| Name | Description |
| --- | --- |
| `uniform` | Uniform distribution. |
| `normal` | Normal (gaussian) distribution. |
| `ellipse` | Uniform distribution in an ellipse. |
| `borderellipse` | Distribution in an ellipse with particles spawning at the edges of the ellipse. |
| `borderrectangle` | Distribution in a rectangle with particles spawning at the edges of the rectangle. |
| `none` | No distribution - area spread is disabled. |

## BlendAlphaMode

Different ways alpha affects color blending. See BlendMode and the BlendMode Formulas for additional notes.

**Constants:**

| Name | Description |
| --- | --- |
| `alphamultiply` | The RGB values of what's drawn are multiplied by the alpha values of those colors during blending. This is the default alpha mode. |
| `premultiplied` | The RGB values of what's drawn are '''not''' multiplied by the alpha values of those colors during blending. For most blend modes to work correctly with this alpha mode, the colors of a drawn object need to have had their RGB values multiplied by their alpha values at some point previously ("premultiplied alpha"). |

## BlendMode

Different ways to do color blending. See BlendAlphaMode and the BlendMode Formulas for additional notes.

**Constants:**

| Name | Description |
| --- | --- |
| `alpha` | Alpha blending (normal). The alpha of what's drawn determines its opacity. |
| `replace` | The colors of what's drawn completely replace what was on the screen, with no additional blending. The BlendAlphaMode specified in love.graphics.setBlendMode still affects what happens. |
| `screen` | 'Screen' blending. |
| `add` | The pixel colors of what's drawn are added to the pixel colors already on the screen. The alpha of the screen is not modified. |
| `subtract` | The pixel colors of what's drawn are subtracted from the pixel colors already on the screen. The alpha of the screen is not modified. |
| `multiply` | The pixel colors of what's drawn are multiplied with the pixel colors already on the screen (darkening them). The alpha of drawn objects is multiplied with the alpha of the screen rather than determining how much the colors on the screen are affected, even when the "alphamultiply" BlendAlphaMode is used. |
| `lighten` | The pixel colors of what's drawn are compared to the existing pixel colors, and the larger of the two values for each color component is used. Only works when the "premultiplied" BlendAlphaMode is used in love.graphics.setBlendMode. |
| `darken` | The pixel colors of what's drawn are compared to the existing pixel colors, and the smaller of the two values for each color component is used. Only works when the "premultiplied" BlendAlphaMode is used in love.graphics.setBlendMode. |
| `additive` | Additive blend mode. |
| `subtractive` | Subtractive blend mode. |
| `multiplicative` | Multiply blend mode. |
| `premultiplied` | Premultiplied alpha blend mode. |

## CompareMode

Different types of per-pixel stencil test and depth test comparisons. The pixels of an object will be drawn if the comparison succeeds, for each pixel that the object touches.

**Constants:**

| Name | Description |
| --- | --- |
| `equal` | * stencil tests: the stencil value of the pixel must be equal to the supplied value.
* depth tests: the depth value of the drawn object at that pixel must be equal to the existing depth value of that pixel. |
| `notequal` | * stencil tests: the stencil value of the pixel must not be equal to the supplied value.
* depth tests: the depth value of the drawn object at that pixel must not be equal to the existing depth value of that pixel. |
| `less` | * stencil tests: the stencil value of the pixel must be less than the supplied value.
* depth tests: the depth value of the drawn object at that pixel must be less than the existing depth value of that pixel. |
| `lequal` | * stencil tests: the stencil value of the pixel must be less than or equal to the supplied value.
* depth tests: the depth value of the drawn object at that pixel must be less than or equal to the existing depth value of that pixel. |
| `gequal` | * stencil tests: the stencil value of the pixel must be greater than or equal to the supplied value.
* depth tests: the depth value of the drawn object at that pixel must be greater than or equal to the existing depth value of that pixel. |
| `greater` | * stencil tests: the stencil value of the pixel must be greater than the supplied value.
* depth tests: the depth value of the drawn object at that pixel must be greater than the existing depth value of that pixel. |
| `never` | Objects will never be drawn. |
| `always` | Objects will always be drawn. Effectively disables the depth or stencil test. |

## CullMode

How Mesh geometry is culled when rendering.

**Constants:**

| Name | Description |
| --- | --- |
| `back` | Back-facing triangles in Meshes are culled (not rendered). The vertex order of a triangle determines whether it is back- or front-facing. |
| `front` | Front-facing triangles in Meshes are culled. |
| `none` | Both back- and front-facing triangles in Meshes are rendered. |

## DrawMode

Controls whether shapes are drawn as an outline, or filled.

**Constants:**

| Name | Description |
| --- | --- |
| `fill` | Draw filled shape. |
| `line` | Draw outlined shape. |

## FilterMode

How the image is filtered when scaling.

**Constants:**

| Name | Description |
| --- | --- |
| `linear` | Scale image with linear interpolation. |
| `nearest` | Scale image with nearest neighbor interpolation. |

## GraphicsFeature

Graphics features that can be checked for with love.graphics.getSupported.

**Constants:**

| Name | Description |
| --- | --- |
| `clampzero` | Whether the "clampzero" WrapMode is supported. |
| `lighten` | Whether the "lighten" and "darken" BlendModes are supported. |
| `multicanvasformats` | Whether multiple formats can be used in the same love.graphics.setCanvas call. |
| `glsl3` | Whether GLSL 3 Shaders can be used. |
| `instancing` | Whether mesh instancing is supported. |
| `fullnpot` | Whether textures with non-power-of-two dimensions can use mipmapping and the 'repeat' WrapMode. |
| `pixelshaderhighp` | Whether pixel shaders can use "highp" 32 bit floating point numbers (as opposed to just 16 bit or lower precision). |
| `shaderderivatives` | Whether shaders can use the dFdx, dFdy, and fwidth functions for computing derivatives. |

## GraphicsLimit

Types of system-dependent graphics limits checked for using love.graphics.getSystemLimits.

**Constants:**

| Name | Description |
| --- | --- |
| `pointsize` | The maximum size of points. |
| `texturesize` | The maximum width or height of Images and Canvases. |
| `multicanvas` | The maximum number of simultaneously active canvases (via love.graphics.setCanvas.) |
| `canvasmsaa` | The maximum number of antialiasing samples for a Canvas. |
| `texturelayers` | The maximum number of layers in an Array texture. |
| `volumetexturesize` | The maximum width, height, or depth of a Volume texture. |
| `cubetexturesize` | The maximum width or height of a Cubemap texture. |
| `anisotropy` | The maximum amount of anisotropic filtering. Texture:setMipmapFilter internally clamps the given anisotropy value to the system's limit. |

## IndexDataType

Vertex map datatype for Data variant of Mesh:setVertexMap.

**Constants:**

| Name | Description |
| --- | --- |
| `uint16` | The vertex map is array of unsigned word (16-bit). |
| `uint32` | The vertex map is array of unsigned dword (32-bit). |

## LineJoin

Line join style.

**Constants:**

| Name | Description |
| --- | --- |
| `miter` | The ends of the line segments beveled in an angle so that they join seamlessly. |
| `none` | No cap applied to the ends of the line segments. |
| `bevel` | Flattens the point where line segments join together. |

## LineStyle

The styles in which lines are drawn.

**Constants:**

| Name | Description |
| --- | --- |
| `rough` | Draw rough lines. |
| `smooth` | Draw smooth lines. |

## MeshDrawMode

How a Mesh's vertices are used when drawing.

**Constants:**

| Name | Description |
| --- | --- |
| `fan` | The vertices create a "fan" shape with the first vertex acting as the hub point. Can be easily used to draw simple convex polygons. |
| `strip` | The vertices create a series of connected triangles using vertices 1, 2, 3, then 3, 2, 4 (note the order), then 3, 4, 5, and so on. |
| `triangles` | The vertices create unconnected triangles. |
| `points` | The vertices are drawn as unconnected points (see love.graphics.setPointSize.) |

## MipmapMode

Controls whether a Canvas has mipmaps, and its behaviour when it does.

**Constants:**

| Name | Description |
| --- | --- |
| `none` | The Canvas has no mipmaps. |
| `auto` | The Canvas has mipmaps. love.graphics.setCanvas can be used to render to a specific mipmap level, or Canvas:generateMipmaps can (re-)compute all mipmap levels based on the base level. |
| `manual` | The Canvas has mipmaps, and all mipmap levels will automatically be recomputed when switching away from the Canvas with love.graphics.setCanvas. |

## ParticleInsertMode

How newly created particles are added to the ParticleSystem.

**Constants:**

| Name | Description |
| --- | --- |
| `top` | Particles are inserted at the top of the ParticleSystem's list of particles. |
| `bottom` | Particles are inserted at the bottom of the ParticleSystem's list of particles. |
| `random` | Particles are inserted at random positions in the ParticleSystem's list of particles. |

## SpriteBatchUsage

Usage hints for SpriteBatches and Meshes to optimize data storage and access.

**Constants:**

| Name | Description |
| --- | --- |
| `dynamic` | The object's data will change occasionally during its lifetime.  |
| `static` | The object will not be modified after initial sprites or vertices are added. |
| `stream` | The object data will always change between draws. |

## StackType

Graphics state stack types used with love.graphics.push.

**Constants:**

| Name | Description |
| --- | --- |
| `transform` | The transformation stack (love.graphics.translate, love.graphics.rotate, etc.) |
| `all` | All love.graphics state, including transform state. |

## StencilAction

How a stencil function modifies the stencil values of pixels it touches.

**Constants:**

| Name | Description |
| --- | --- |
| `replace` | The stencil value of a pixel will be replaced by the value specified in love.graphics.stencil, if any object touches the pixel. |
| `increment` | The stencil value of a pixel will be incremented by 1 for each object that touches the pixel. If the stencil value reaches 255 it will stay at 255. |
| `decrement` | The stencil value of a pixel will be decremented by 1 for each object that touches the pixel. If the stencil value reaches 0 it will stay at 0. |
| `incrementwrap` | The stencil value of a pixel will be incremented by 1 for each object that touches the pixel. If a stencil value of 255 is incremented it will be set to 0. |
| `decrementwrap` | The stencil value of a pixel will be decremented by 1 for each object that touches the pixel. If the stencil value of 0 is decremented it will be set to 255. |
| `invert` | The stencil value of a pixel will be bitwise-inverted for each object that touches the pixel. If a stencil value of 0 is inverted it will become 255. |

## TextureType

Types of textures (2D, cubemap, etc.)

**Constants:**

| Name | Description |
| --- | --- |
| `2d` | Regular 2D texture with width and height. |
| `array` | Several same-size 2D textures organized into a single object. Similar to a texture atlas / sprite sheet, but avoids sprite bleeding and other issues. |
| `cube` | Cubemap texture with 6 faces. Requires a custom shader (and Shader:send) to use. Sampling from a cube texture in a shader takes a 3D direction vector instead of a texture coordinate. |
| `volume` | 3D texture with width, height, and depth. Requires a custom shader to use. Volume textures can have texture filtering applied along the 3rd axis. |

## VertexAttributeStep

The frequency at which a vertex shader fetches the vertex attribute's data from the Mesh when it's drawn.

Per-instance attributes can be used to render a Mesh many times with different positions, colors, or other attributes via a single love.graphics.drawInstanced call, without using the love_InstanceID vertex shader variable.

**Constants:**

| Name | Description |
| --- | --- |
| `pervertex` | The vertex attribute will have a unique value for each vertex in the Mesh. |
| `perinstance` | The vertex attribute will have a unique value for each instance of the Mesh. |

## VertexWinding

How Mesh geometry vertices are ordered.

**Constants:**

| Name | Description |
| --- | --- |
| `cw` | Clockwise. |
| `ccw` | Counter-clockwise. |

## WrapMode

How the image wraps inside a Quad with a larger quad size than image size. This also affects how Meshes with texture coordinates which are outside the range of 1 are drawn, and the color returned by the Texel Shader function when using it to sample from texture coordinates outside of the range of 1.

**Constants:**

| Name | Description |
| --- | --- |
| `clamp` | Clamp the texture. Appears only once. The area outside the texture's normal range is colored based on the edge pixels of the texture. |
| `repeat` | Repeat the texture. Fills the whole available extent. |
| `mirroredrepeat` | Repeat the texture, flipping it each time it repeats. May produce better visual results than the repeat mode when the texture doesn't seamlessly tile. |
| `clampzero` | Clamp the texture. Fills the area outside the texture's normal range with transparent black (or opaque black for textures with no alpha channel.) |

