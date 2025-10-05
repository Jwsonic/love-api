# love.math

Provides system-independent mathematical functions.

## Contents

**Functions:**

- [colorFromBytes](#lovemathcolorfrombytes)
- [colorToBytes](#lovemathcolortobytes)
- [gammaToLinear](#lovemathgammatolinear)
- [getRandomSeed](#lovemathgetrandomseed)
- [getRandomState](#lovemathgetrandomstate)
- [isConvex](#lovemathisconvex)
- [linearToGamma](#lovemathlineartogamma)
- [newBezierCurve](#lovemathnewbeziercurve)
- [newRandomGenerator](#lovemathnewrandomgenerator)
- [newTransform](#lovemathnewtransform)
- [noise](#lovemathnoise)
- [random](#lovemathrandom)
- [randomNormal](#lovemathrandomnormal)
- [setRandomSeed](#lovemathsetrandomseed)
- [setRandomState](#lovemathsetrandomstate)
- [triangulate](#lovemathtriangulate)

**Types:**

- [BezierCurve](#beziercurve)
- [RandomGenerator](#randomgenerator)
- [Transform](#transform)

**Enums:**

- [MatrixLayout](#matrixlayout)

---

## Functions

## love.math.colorFromBytes

Converts a color from 0..255 to 0..1 range.

Here's implementation for 11.2 and earlier.

function love.math.colorFromBytes(r, g, b, a)

	if type(r) == 'table' then

		r, g, b, a = rr[2, rr[4

	end

	r = clamp01(floor(r + 0.5) / 255)

	g = clamp01(floor(g + 0.5) / 255)

	b = clamp01(floor(b + 0.5) / 255)

	a = a ~= nil and clamp01(floor(a + 0.5) / 255) or nil

	return r, g, b, a

end

Where clamp01 is defined as follows

local function clamp01(x)

	return math.min(math.max(x, 0), 1)

end

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| rb | number |  | Red color component in 0..255 range. |
| gb | number |  | Green color component in 0..255 range. |
| bb | number |  | Blue color component in 0..255 range. |
| ab | number | nil | Alpha color component in 0..255 range. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| r | number | Red color component in 0..1 range. |
| g | number | Green color component in 0..1 range. |
| b | number | Blue color component in 0..1 range. |
| a | number | Alpha color component in 0..1 range or nil if alpha is not specified. |

## love.math.colorToBytes

Converts a color from 0..1 to 0..255 range.

Here's implementation for 11.2 and earlier.

function love.math.colorToBytes(r, g, b, a)

	if type(r) == 'table' then

		r, g, b, a = rr[2, rr[4

	end

	r = floor(clamp01(r) * 255 + 0.5)

	g = floor(clamp01(g) * 255 + 0.5)

	b = floor(clamp01(b) * 255 + 0.5)

	a = a ~= nil and floor(clamp01(a) * 255 + 0.5) or nil

	return r, g, b, a

end

Where clamp01 is defined as follows

local function clamp01(x)

	return math.min(math.max(x, 0), 1)

end

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| r | number |  | Red color component. |
| g | number |  | Green color component. |
| b | number |  | Blue color component. |
| a | number | nil | Alpha color component. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| rb | number | Red color component in 0..255 range. |
| gb | number | Green color component in 0..255 range. |
| bb | number | Blue color component in 0..255 range. |
| ab | number | Alpha color component in 0..255 range or nil if alpha is not specified. |

## love.math.gammaToLinear

Converts a color from gamma-space (sRGB) to linear-space (RGB). This is useful when doing gamma-correct rendering and you need to do math in linear RGB in the few cases where LÖVE doesn't handle conversions automatically.

Read more about gamma-correct rendering here, here, and here.

In versions prior to 11.0, color component values were within the range of 0 to 255 instead of 0 to 1.

### Variant 1

An alpha value can be passed into the function as a fourth argument, but it will be returned unchanged because alpha is always linear.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| r | number |  | The red channel of the sRGB color to convert. |
| g | number |  | The green channel of the sRGB color to convert. |
| b | number |  | The blue channel of the sRGB color to convert. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| lr | number | The red channel of the converted color in linear RGB space. |
| lg | number | The green channel of the converted color in linear RGB space. |
| lb | number | The blue channel of the converted color in linear RGB space. |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| color | table |  | An array with the red, green, and blue channels of the sRGB color to convert. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| lr | number | The red channel of the converted color in linear RGB space. |
| lg | number | The green channel of the converted color in linear RGB space. |
| lb | number | The blue channel of the converted color in linear RGB space. |

### Variant 3

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| c | number |  | The value of a color channel in sRGB space to convert. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| lc | number | The value of the color channel in linear RGB space. |

## love.math.getRandomSeed

Gets the seed of the random number generator.

The seed is split into two numbers due to Lua's use of doubles for all number values - doubles can't accurately represent integer  values above 2^53, but the seed can be an integer value up to 2^64.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| low | number | Integer number representing the lower 32 bits of the random number generator's 64 bit seed value. |
| high | number | Integer number representing the higher 32 bits of the random number generator's 64 bit seed value. |

## love.math.getRandomState

Gets the current state of the random number generator. This returns an opaque implementation-dependent string which is only useful for later use with love.math.setRandomState or RandomGenerator:setState.

This is different from love.math.getRandomSeed in that getRandomState gets the random number generator's current state, whereas getRandomSeed gets the previously set seed number.

The value of the state string does not depend on the current operating system.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| state | string | The current state of the random number generator, represented as a string. |

## love.math.isConvex

Checks whether a polygon is convex.

PolygonShapes in love.physics, some forms of Meshes, and polygons drawn with love.graphics.polygon must be simple convex polygons.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| vertices | table |  | The vertices of the polygon as a table in the form of {x1, y1, x2, y2, x3, y3, ...}. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| convex | boolean | Whether the given polygon is convex. |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x1 | number |  | The position of the first vertex of the polygon on the x-axis. |
| y1 | number |  | The position of the first vertex of the polygon on the y-axis. |
| x2 | number |  | The position of the second vertex of the polygon on the x-axis. |
| y2 | number |  | The position of the second vertex of the polygon on the y-axis. |
| ... | number |  | Additional position of the vertex of the polygon on the x-axis and y-axis. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| convex | boolean | Whether the given polygon is convex. |

## love.math.linearToGamma

Converts a color from linear-space (RGB) to gamma-space (sRGB). This is useful when storing linear RGB color values in an image, because the linear RGB color space has less precision than sRGB for dark colors, which can result in noticeable color banding when drawing.

In general, colors chosen based on what they look like on-screen are already in gamma-space and should not be double-converted. Colors calculated using math are often in the linear RGB space.

Read more about gamma-correct rendering here, here, and here.

In versions prior to 11.0, color component values were within the range of 0 to 255 instead of 0 to 1.

### Variant 1

An alpha value can be passed into the function as a fourth argument, but it will be returned unchanged because alpha is always linear.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| lr | number |  | The red channel of the linear RGB color to convert. |
| lg | number |  | The green channel of the linear RGB color to convert. |
| lb | number |  | The blue channel of the linear RGB color to convert. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| cr | number | The red channel of the converted color in gamma sRGB space. |
| cg | number | The green channel of the converted color in gamma sRGB space. |
| cb | number | The blue channel of the converted color in gamma sRGB space. |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| color | table |  | An array with the red, green, and blue channels of the linear RGB color to convert. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| cr | number | The red channel of the converted color in gamma sRGB space. |
| cg | number | The green channel of the converted color in gamma sRGB space. |
| cb | number | The blue channel of the converted color in gamma sRGB space. |

### Variant 3

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| lc | number |  | The value of a color channel in linear RGB space to convert. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| c | number | The value of the color channel in gamma sRGB space. |

## love.math.newBezierCurve

Creates a new BezierCurve object.

The number of vertices in the control polygon determines the degree of the curve, e.g. three vertices define a quadratic (degree 2) Bézier curve, four vertices define a cubic (degree 3) Bézier curve, etc.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| vertices | table |  | The vertices of the control polygon as a table in the form of {x1, y1, x2, y2, x3, y3, ...}. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| curve | [BezierCurve](#beziercurve) | A Bézier curve object. |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x1 | number |  | The position of the first vertex of the control polygon on the x-axis. |
| y1 | number |  | The position of the first vertex of the control polygon on the y-axis. |
| x2 | number |  | The position of the second vertex of the control polygon on the x-axis. |
| y2 | number |  | The position of the second vertex of the control polygon on the y-axis. |
| ... | number |  | Additional position of the vertex of the control polygon on the x-axis and y-axis. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| curve | [BezierCurve](#beziercurve) | A Bézier curve object. |

## love.math.newRandomGenerator

Creates a new RandomGenerator object which is completely independent of other RandomGenerator objects and random functions.

### Variant 1

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| rng | [RandomGenerator](#randomgenerator) | The new Random Number Generator object. |

### Variant 2

See RandomGenerator:setSeed.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| seed | number |  | The initial seed number to use for this object. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| rng | [RandomGenerator](#randomgenerator) | The new Random Number Generator object. |

### Variant 3

See RandomGenerator:setSeed.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| low | number |  | The lower 32 bits of the seed number to use for this object. |
| high | number |  | The higher 32 bits of the seed number to use for this object. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| rng | [RandomGenerator](#randomgenerator) | The new Random Number Generator object. |

## love.math.newTransform

Creates a new Transform object.

### Variant 1

Creates a Transform with no transformations applied. Call methods on the returned object to apply transformations.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| transform | [Transform](#transform) | The new Transform object. |

### Variant 2

Creates a Transform with the specified transformation applied on creation.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | The position of the new Transform on the x-axis. |
| y | number |  | The position of the new Transform on the y-axis. |
| angle | number | 0 | The orientation of the new Transform in radians. |
| sx | number | 1 | Scale factor on the x-axis. |
| sy | number | sx | Scale factor on the y-axis. |
| ox | number | 0 | Origin offset on the x-axis. |
| oy | number | 0 | Origin offset on the y-axis. |
| kx | number | 0 | Shearing / skew factor on the x-axis. |
| ky | number | 0 | Shearing / skew factor on the y-axis. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| transform | [Transform](#transform) | The new Transform object. |

## love.math.noise

Generates a Simplex or Perlin noise value in 1-4 dimensions. The return value will always be the same, given the same arguments.

Simplex noise is closely related to Perlin noise. It is widely used for procedural content generation.

There are many webpages which discuss Perlin and Simplex noise in detail.

### Variant 1

Generates Simplex noise from 1 dimension.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | The number used to generate the noise value. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| value | number | The noise value in the range of 1. |

### Variant 2

Generates Simplex noise from 2 dimensions.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | The first value of the 2-dimensional vector used to generate the noise value. |
| y | number |  | The second value of the 2-dimensional vector used to generate the noise value. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| value | number | The noise value in the range of 1. |

### Variant 3

Generates Perlin noise (Simplex noise in version 0.9.2 and older) from 3 dimensions.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | The first value of the 3-dimensional vector used to generate the noise value. |
| y | number |  | The second value of the 3-dimensional vector used to generate the noise value. |
| z | number |  | The third value of the 3-dimensional vector used to generate the noise value. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| value | number | The noise value in the range of 1. |

### Variant 4

Generates Perlin noise (Simplex noise in version 0.9.2 and older) from 4 dimensions.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | The first value of the 4-dimensional vector used to generate the noise value. |
| y | number |  | The second value of the 4-dimensional vector used to generate the noise value. |
| z | number |  | The third value of the 4-dimensional vector used to generate the noise value. |
| w | number |  | The fourth value of the 4-dimensional vector used to generate the noise value. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| value | number | The noise value in the range of 1. |

## love.math.random

Generates a pseudo-random number in a platform independent manner. The default love.run seeds this function at startup, so you generally don't need to seed it yourself.

### Variant 1

Get uniformly distributed pseudo-random real number within 1.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| number | number | The pseudo-random number. |

### Variant 2

Get a uniformly distributed pseudo-random integer within max.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| max | number |  | The maximum possible value it should return. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| number | number | The pseudo-random integer number. |

### Variant 3

Get uniformly distributed pseudo-random integer within max.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| min | number |  | The minimum possible value it should return. |
| max | number |  | The maximum possible value it should return. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| number | number | The pseudo-random integer number. |

## love.math.randomNormal

Get a normally distributed pseudo random number.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| stddev | number | 1 | Standard deviation of the distribution. |
| mean | number | 0 | The mean of the distribution. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| number | number | Normally distributed random number with variance (stddev)² and the specified mean. |

## love.math.setRandomSeed

Sets the seed of the random number generator using the specified integer number. This is called internally at startup, so you generally don't need to call it yourself.

### Variant 1

Due to Lua's use of double-precision floating point numbers, integer values above 2^53 cannot be accurately represented. Use the other variant of the function if you want to use a larger number.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| seed | number |  | The integer number with which you want to seed the randomization. Must be within the range of 2^53 - 1. |

**Returns:**

*No return values*

### Variant 2

Combines two 32-bit integer numbers into a 64-bit integer value and sets the seed of the random number generator using the value.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| low | number |  | The lower 32 bits of the seed value. Must be within the range of 2^32 - 1. |
| high | number |  | The higher 32 bits of the seed value. Must be within the range of 2^32 - 1. |

**Returns:**

*No return values*

## love.math.setRandomState

Sets the current state of the random number generator. The value used as an argument for this function is an opaque implementation-dependent string and should only originate from a previous call to love.math.getRandomState.

This is different from love.math.setRandomSeed in that setRandomState directly sets the random number generator's current implementation-dependent state, whereas setRandomSeed gives it a new seed value.

The effect of the state string does not depend on the current operating system.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| state | string |  | The new state of the random number generator, represented as a string. This should originate from a previous call to love.math.getRandomState. |

**Returns:**

*No return values*

## love.math.triangulate

Decomposes a simple convex or concave polygon into triangles.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| polygon | table |  | Polygon to triangulate. Must not intersect itself. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| triangles | table | List of triangles the polygon is composed of, in the form of {{x1, y1, x2, y2, x3, y3},  {x1, y1, x2, y2, x3, y3}, ...}. |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x1 | number |  | The position of the first vertex of the polygon on the x-axis. |
| y1 | number |  | The position of the first vertex of the polygon on the y-axis. |
| x2 | number |  | The position of the second vertex of the polygon on the x-axis. |
| y2 | number |  | The position of the second vertex of the polygon on the y-axis. |
| x3 | number |  | The position of the third vertex of the polygon on the x-axis. |
| y3 | number |  | The position of the third vertex of the polygon on the y-axis. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| triangles | table | List of triangles the polygon is composed of, in the form of {{x1, y1, x2, y2, x3, y3},  {x1, y1, x2, y2, x3, y3}, ...}. |

## Types

## BezierCurve

A Bézier curve object that can evaluate and render Bézier curves of arbitrary degree.

For more information on Bézier curves check this great article on Wikipedia.

**Constructors:** [newBezierCurve](#lovemathnewbeziercurve)

**Supertypes:** Object

### Methods

#### BezierCurve:evaluate

Evaluate Bézier curve at parameter t. The parameter must be between 0 and 1 (inclusive).

This function can be used to move objects along paths or tween parameters. However it should not be used to render the curve, see BezierCurve:render for that purpose.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| t | number |  | Where to evaluate the curve. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| x | number | x coordinate of the curve at parameter t. |
| y | number | y coordinate of the curve at parameter t. |

#### BezierCurve:getControlPoint

Get coordinates of the i-th control point. Indices start with 1.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| i | number |  | Index of the control point. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| x | number | Position of the control point along the x axis. |
| y | number | Position of the control point along the y axis. |

#### BezierCurve:getControlPointCount

Get the number of control points in the Bézier curve.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| count | number | The number of control points. |

#### BezierCurve:getDegree

Get degree of the Bézier curve. The degree is equal to number-of-control-points - 1.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| degree | number | Degree of the Bézier curve. |

#### BezierCurve:getDerivative

Get the derivative of the Bézier curve.

This function can be used to rotate sprites moving along a curve in the direction of the movement and compute the direction perpendicular to the curve at some parameter t.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| derivative | [BezierCurve](#beziercurve) | The derivative curve. |

#### BezierCurve:getSegment

Gets a BezierCurve that corresponds to the specified segment of this BezierCurve.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| startpoint | number |  | The starting point along the curve. Must be between 0 and 1. |
| endpoint | number |  | The end of the segment. Must be between 0 and 1. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| curve | [BezierCurve](#beziercurve) | A BezierCurve that corresponds to the specified segment. |

#### BezierCurve:insertControlPoint

Insert control point as the new i-th control point. Existing control points from i onwards are pushed back by 1. Indices start with 1. Negative indices wrap around: -1 is the last control point, -2 the one before the last, etc.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | Position of the control point along the x axis. |
| y | number |  | Position of the control point along the y axis. |
| i | number | -1 | Index of the control point. |

**Returns:**

*No return values*

#### BezierCurve:removeControlPoint

Removes the specified control point.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| index | number |  | The index of the control point to remove. |

**Returns:**

*No return values*

#### BezierCurve:render

Get a list of coordinates to be used with love.graphics.line.

This function samples the Bézier curve using recursive subdivision. You can control the recursion depth using the depth parameter.

If you are just interested to know the position on the curve given a parameter, use BezierCurve:evaluate.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| depth | number | 5 | Number of recursive subdivision steps. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| coordinates | table | List of x,y-coordinate pairs of points on the curve. |

#### BezierCurve:renderSegment

Get a list of coordinates on a specific part of the curve, to be used with love.graphics.line.

This function samples the Bézier curve using recursive subdivision. You can control the recursion depth using the depth parameter.

If you are just need to know the position on the curve given a parameter, use BezierCurve:evaluate.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| startpoint | number |  | The starting point along the curve. Must be between 0 and 1. |
| endpoint | number |  | The end of the segment to render. Must be between 0 and 1. |
| depth | number | 5 | Number of recursive subdivision steps. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| coordinates | table | List of x,y-coordinate pairs of points on the specified part of the curve. |

#### BezierCurve:rotate

Rotate the Bézier curve by an angle.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| angle | number |  | Rotation angle in radians. |
| ox | number | 0 | X coordinate of the rotation center. |
| oy | number | 0 | Y coordinate of the rotation center. |

**Returns:**

*No return values*

#### BezierCurve:scale

Scale the Bézier curve by a factor.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| s | number |  | Scale factor. |
| ox | number | 0 | X coordinate of the scaling center. |
| oy | number | 0 | Y coordinate of the scaling center. |

**Returns:**

*No return values*

#### BezierCurve:setControlPoint

Set coordinates of the i-th control point. Indices start with 1.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| i | number |  | Index of the control point. |
| x | number |  | Position of the control point along the x axis. |
| y | number |  | Position of the control point along the y axis. |

**Returns:**

*No return values*

#### BezierCurve:translate

Move the Bézier curve by an offset.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| dx | number |  | Offset along the x axis. |
| dy | number |  | Offset along the y axis. |

**Returns:**

*No return values*

## RandomGenerator

A random number generation object which has its own random state.

**Constructors:** [newRandomGenerator](#lovemathnewrandomgenerator)

**Supertypes:** Object

### Methods

#### RandomGenerator:getSeed

Gets the seed of the random number generator object.

The seed is split into two numbers due to Lua's use of doubles for all number values - doubles can't accurately represent integer  values above 2^53, but the seed value is an integer number in the range of 2^64 - 1.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| low | number | Integer number representing the lower 32 bits of the RandomGenerator's 64 bit seed value. |
| high | number | Integer number representing the higher 32 bits of the RandomGenerator's 64 bit seed value. |

#### RandomGenerator:getState

Gets the current state of the random number generator. This returns an opaque string which is only useful for later use with RandomGenerator:setState in the same major version of LÖVE.

This is different from RandomGenerator:getSeed in that getState gets the RandomGenerator's current state, whereas getSeed gets the previously set seed number.

The value of the state string does not depend on the current operating system.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| state | string | The current state of the RandomGenerator object, represented as a string. |

#### RandomGenerator:random

Generates a pseudo-random number in a platform independent manner.

### Variant 1

Get uniformly distributed pseudo-random number within 1.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| number | number | The pseudo-random number. |

### Variant 2

Get uniformly distributed pseudo-random integer number within max.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| max | number |  | The maximum possible value it should return. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| number | number | The pseudo-random integer number. |

### Variant 3

Get uniformly distributed pseudo-random integer number within max.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| min | number |  | The minimum possible value it should return. |
| max | number |  | The maximum possible value it should return. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| number | number | The pseudo-random integer number. |

#### RandomGenerator:randomNormal

Get a normally distributed pseudo random number.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| stddev | number | 1 | Standard deviation of the distribution. |
| mean | number | 0 | The mean of the distribution. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| number | number | Normally distributed random number with variance (stddev)² and the specified mean. |

#### RandomGenerator:setSeed

Sets the seed of the random number generator using the specified integer number.

### Variant 1

Due to Lua's use of double-precision floating point numbers, values above 2^53 cannot be accurately represented. Use the other variant of this function if your seed will have a larger value.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| seed | number |  | The integer number with which you want to seed the randomization. Must be within the range of 2^53. |

**Returns:**

*No return values*

### Variant 2

Combines two 32-bit integer numbers into a 64-bit integer value and sets the seed of the random number generator using the value.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| low | number |  | The lower 32 bits of the seed value. Must be within the range of 2^32 - 1. |
| high | number |  | The higher 32 bits of the seed value. Must be within the range of 2^32 - 1. |

**Returns:**

*No return values*

#### RandomGenerator:setState

Sets the current state of the random number generator. The value used as an argument for this function is an opaque string and should only originate from a previous call to RandomGenerator:getState in the same major version of LÖVE.

This is different from RandomGenerator:setSeed in that setState directly sets the RandomGenerator's current implementation-dependent state, whereas setSeed gives it a new seed value.

The effect of the state string does not depend on the current operating system.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| state | string |  | The new state of the RandomGenerator object, represented as a string. This should originate from a previous call to RandomGenerator:getState. |

**Returns:**

*No return values*

## Transform

Object containing a coordinate system transformation.

The love.graphics module has several functions and function variants which accept Transform objects.

**Constructors:** [newTransform](#lovemathnewtransform)

**Supertypes:** Object

### Methods

#### Transform:apply

Applies the given other Transform object to this one.

This effectively multiplies this Transform's internal transformation matrix with the other Transform's (i.e. self * other), and stores the result in this object.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| other | [Transform](#transform) |  | The other Transform object to apply to this Transform. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| transform | [Transform](#transform) | The Transform object the method was called on. Allows easily chaining Transform methods. |

#### Transform:clone

Creates a new copy of this Transform.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| clone | [Transform](#transform) | The copy of this Transform. |

#### Transform:getMatrix

Gets the internal 4x4 transformation matrix stored by this Transform. The matrix is returned in row-major order.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| e1_1 | number | The first column of the first row of the matrix. |
| e1_2 | number | The second column of the first row of the matrix. |
| e1_3 | number | The third column of the first row of the matrix. |
| e1_4 | number | The fourth column of the first row of the matrix. |
| e2_1 | number | The first column of the second row of the matrix. |
| e2_2 | number | The second column of the second row of the matrix. |
| e2_3 | number | The third column of the second row of the matrix. |
| e2_4 | number | The fourth column of the second row of the matrix. |
| e3_1 | number | The first column of the third row of the matrix. |
| e3_2 | number | The second column of the third row of the matrix. |
| e3_3 | number | The third column of the third row of the matrix. |
| e3_4 | number | The fourth column of the third row of the matrix. |
| e4_1 | number | The first column of the fourth row of the matrix. |
| e4_2 | number | The second column of the fourth row of the matrix. |
| e4_3 | number | The third column of the fourth row of the matrix. |
| e4_4 | number | The fourth column of the fourth row of the matrix. |

#### Transform:inverse

Creates a new Transform containing the inverse of this Transform.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| inverse | [Transform](#transform) | A new Transform object representing the inverse of this Transform's matrix. |

#### Transform:inverseTransformPoint

Applies the reverse of the Transform object's transformation to the given 2D position.

This effectively converts the given position from the local coordinate space of the Transform into global coordinates.

One use of this method can be to convert a screen-space mouse position into global world coordinates, if the given Transform has transformations applied that are used for a camera system in-game.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| localX | number |  | The x component of the position with the transform applied. |
| localY | number |  | The y component of the position with the transform applied. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| globalX | number | The x component of the position in global coordinates. |
| globalY | number | The y component of the position in global coordinates. |

#### Transform:isAffine2DTransform

Checks whether the Transform is an affine transformation.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| affine | boolean | true if the transform object is an affine transformation, false otherwise. |

#### Transform:reset

Resets the Transform to an identity state. All previously applied transformations are erased.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| transform | [Transform](#transform) | The Transform object the method was called on. Allows easily chaining Transform methods. |

#### Transform:rotate

Applies a rotation to the Transform's coordinate system. This method does not reset any previously applied transformations.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| angle | number |  | The relative angle in radians to rotate this Transform by. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| transform | [Transform](#transform) | The Transform object the method was called on. Allows easily chaining Transform methods. |

#### Transform:scale

Scales the Transform's coordinate system. This method does not reset any previously applied transformations.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| sx | number |  | The relative scale factor along the x-axis. |
| sy | number | sx | The relative scale factor along the y-axis. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| transform | [Transform](#transform) | The Transform object the method was called on. Allows easily chaining Transform methods. |

#### Transform:setMatrix

Directly sets the Transform's internal 4x4 transformation matrix.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| e1_1 | number |  | The first column of the first row of the matrix. |
| e1_2 | number |  | The second column of the first row of the matrix. |
| e1_3 | number |  | The third column of the first row of the matrix. |
| e1_4 | number |  | The fourth column of the first row of the matrix. |
| e2_1 | number |  | The first column of the second row of the matrix. |
| e2_2 | number |  | The second column of the second row of the matrix. |
| e2_3 | number |  | The third column of the second row of the matrix. |
| e2_4 | number |  | The fourth column of the second row of the matrix. |
| e3_1 | number |  | The first column of the third row of the matrix. |
| e3_2 | number |  | The second column of the third row of the matrix. |
| e3_3 | number |  | The third column of the third row of the matrix. |
| e3_4 | number |  | The fourth column of the third row of the matrix. |
| e4_1 | number |  | The first column of the fourth row of the matrix. |
| e4_2 | number |  | The second column of the fourth row of the matrix. |
| e4_3 | number |  | The third column of the fourth row of the matrix. |
| e4_4 | number |  | The fourth column of the fourth row of the matrix. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| transform | [Transform](#transform) | The Transform object the method was called on. Allows easily chaining Transform methods. |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| layout | [MatrixLayout](#matrixlayout) |  | How to interpret the matrix element arguments (row-major or column-major). |
| e1_1 | number |  | The first column of the first row of the matrix. |
| e1_2 | number |  | The second column of the first row or the first column of the second row of the matrix, depending on the specified layout. |
| e1_3 | number |  | The third column/row of the first row/column of the matrix. |
| e1_4 | number |  | The fourth column/row of the first row/column of the matrix. |
| e2_1 | number |  | The first column/row of the second row/column of the matrix. |
| e2_2 | number |  | The second column/row of the second row/column of the matrix. |
| e2_3 | number |  | The third column/row of the second row/column of the matrix. |
| e2_4 | number |  | The fourth column/row of the second row/column of the matrix. |
| e3_1 | number |  | The first column/row of the third row/column of the matrix. |
| e3_2 | number |  | The second column/row of the third row/column of the matrix. |
| e3_3 | number |  | The third column/row of the third row/column of the matrix. |
| e3_4 | number |  | The fourth column/row of the third row/column of the matrix. |
| e4_1 | number |  | The first column/row of the fourth row/column of the matrix. |
| e4_2 | number |  | The second column/row of the fourth row/column of the matrix. |
| e4_3 | number |  | The third column/row of the fourth row/column of the matrix. |
| e4_4 | number |  | The fourth column of the fourth row of the matrix. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| transform | [Transform](#transform) | The Transform object the method was called on. Allows easily chaining Transform methods. |

### Variant 3

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| layout | [MatrixLayout](#matrixlayout) |  | How to interpret the matrix element arguments (row-major or column-major). |
| matrix | table |  | A flat table containing the 16 matrix elements. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| transform | [Transform](#transform) | The Transform object the method was called on. Allows easily chaining Transform methods. |

### Variant 4

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| layout | [MatrixLayout](#matrixlayout) |  | How to interpret the matrix element arguments (row-major or column-major). |
| matrix | table |  | A table of 4 tables, with each sub-table containing 4 matrix elements. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| transform | [Transform](#transform) | The Transform object the method was called on. Allows easily chaining Transform methods. |

#### Transform:setTransformation

Resets the Transform to the specified transformation parameters.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | The position of the Transform on the x-axis. |
| y | number |  | The position of the Transform on the y-axis. |
| angle | number | 0 | The orientation of the Transform in radians. |
| sx | number | 1 | Scale factor on the x-axis. |
| sy | number | sx | Scale factor on the y-axis. |
| ox | number | 0 | Origin offset on the x-axis. |
| oy | number | 0 | Origin offset on the y-axis. |
| kx | number | 0 | Shearing / skew factor on the x-axis. |
| ky | number | 0 | Shearing / skew factor on the y-axis. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| transform | [Transform](#transform) | The Transform object the method was called on. Allows easily chaining Transform methods. |

#### Transform:shear

Applies a shear factor (skew) to the Transform's coordinate system. This method does not reset any previously applied transformations.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| kx | number |  | The shear factor along the x-axis. |
| ky | number |  | The shear factor along the y-axis. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| transform | [Transform](#transform) | The Transform object the method was called on. Allows easily chaining Transform methods. |

#### Transform:transformPoint

Applies the Transform object's transformation to the given 2D position.

This effectively converts the given position from global coordinates into the local coordinate space of the Transform.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| globalX | number |  | The x component of the position in global coordinates. |
| globalY | number |  | The y component of the position in global coordinates. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| localX | number | The x component of the position with the transform applied. |
| localY | number | The y component of the position with the transform applied. |

#### Transform:translate

Applies a translation to the Transform's coordinate system. This method does not reset any previously applied transformations.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| dx | number |  | The relative translation along the x-axis. |
| dy | number |  | The relative translation along the y-axis. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| transform | [Transform](#transform) | The Transform object the method was called on. Allows easily chaining Transform methods. |

## Enums

## MatrixLayout

The layout of matrix elements (row-major or column-major).

**Constants:**

| Name | Description |
| --- | --- |
| `row` | The matrix is row-major: |
| `column` | The matrix is column-major: |

