# love.physics

Can simulate 2D rigid body physics in a realistic manner. This module is based on Box2D, and this API corresponds to the Box2D API as closely as possible.

## Contents

**Functions:**

- [getDistance](#lovephysicsgetdistance)
- [getMeter](#lovephysicsgetmeter)
- [newBody](#lovephysicsnewbody)
- [newChainShape](#lovephysicsnewchainshape)
- [newCircleShape](#lovephysicsnewcircleshape)
- [newDistanceJoint](#lovephysicsnewdistancejoint)
- [newEdgeShape](#lovephysicsnewedgeshape)
- [newFixture](#lovephysicsnewfixture)
- [newFrictionJoint](#lovephysicsnewfrictionjoint)
- [newGearJoint](#lovephysicsnewgearjoint)
- [newMotorJoint](#lovephysicsnewmotorjoint)
- [newMouseJoint](#lovephysicsnewmousejoint)
- [newPolygonShape](#lovephysicsnewpolygonshape)
- [newPrismaticJoint](#lovephysicsnewprismaticjoint)
- [newPulleyJoint](#lovephysicsnewpulleyjoint)
- [newRectangleShape](#lovephysicsnewrectangleshape)
- [newRevoluteJoint](#lovephysicsnewrevolutejoint)
- [newRopeJoint](#lovephysicsnewropejoint)
- [newWeldJoint](#lovephysicsnewweldjoint)
- [newWheelJoint](#lovephysicsnewwheeljoint)
- [newWorld](#lovephysicsnewworld)
- [setMeter](#lovephysicssetmeter)

**Types:**

- [Body](#body)
- [ChainShape](#chainshape)
- [CircleShape](#circleshape)
- [Contact](#contact)
- [DistanceJoint](#distancejoint)
- [EdgeShape](#edgeshape)
- [Fixture](#fixture)
- [FrictionJoint](#frictionjoint)
- [GearJoint](#gearjoint)
- [Joint](#joint)
- [MotorJoint](#motorjoint)
- [MouseJoint](#mousejoint)
- [PolygonShape](#polygonshape)
- [PrismaticJoint](#prismaticjoint)
- [PulleyJoint](#pulleyjoint)
- [RevoluteJoint](#revolutejoint)
- [RopeJoint](#ropejoint)
- [Shape](#shape)
- [WeldJoint](#weldjoint)
- [WheelJoint](#wheeljoint)
- [World](#world)

**Enums:**

- [BodyType](#bodytype)
- [JointType](#jointtype)
- [ShapeType](#shapetype)

---

## Functions

## love.physics.getDistance

Returns the two closest points between two fixtures and their distance.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| fixture1 | [Fixture](#fixture) |  | The first fixture. |
| fixture2 | [Fixture](#fixture) |  | The second fixture. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| distance | number | The distance of the two points. |
| x1 | number | The x-coordinate of the first point. |
| y1 | number | The y-coordinate of the first point. |
| x2 | number | The x-coordinate of the second point. |
| y2 | number | The y-coordinate of the second point. |

## love.physics.getMeter

Returns the meter scale factor.

All coordinates in the physics module are divided by this number, creating a convenient way to draw the objects directly to the screen without the need for graphics transformations.

It is recommended to create shapes no larger than 10 times the scale. This is important because Box2D is tuned to work well with shape sizes from 0.1 to 10 meters.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| scale | number | The scale factor as an integer. |

## love.physics.newBody

Creates a new body.

There are three types of bodies. 

* Static bodies do not move, have a infinite mass, and can be used for level boundaries. 

* Dynamic bodies are the main actors in the simulation, they collide with everything. 

* Kinematic bodies do not react to forces and only collide with dynamic bodies.

The mass of the body gets calculated when a Fixture is attached or removed, but can be changed at any time with Body:setMass or Body:resetMassData.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| world | [World](#world) |  | The world to create the body in. |
| x | number | 0 | The x position of the body. |
| y | number | 0 | The y position of the body. |
| type | [BodyType](#bodytype) | 'static' | The type of the body. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| body | [Body](#body) | A new body. |

## love.physics.newChainShape

Creates a new ChainShape.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| loop | boolean |  | If the chain should loop back to the first point. |
| x1 | number |  | The x position of the first point. |
| y1 | number |  | The y position of the first point. |
| x2 | number |  | The x position of the second point. |
| y2 | number |  | The y position of the second point. |
| ... | number |  | Additional point positions. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| shape | [ChainShape](#chainshape) | The new shape. |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| loop | boolean |  | If the chain should loop back to the first point. |
| points | table |  | A list of points to construct the ChainShape, in the form of {x1, y1, x2, y2, ...}. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| shape | [ChainShape](#chainshape) | The new shape. |

## love.physics.newCircleShape

Creates a new CircleShape.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| radius | number |  | The radius of the circle. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| shape | [CircleShape](#circleshape) | The new shape. |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | The x position of the circle. |
| y | number |  | The y position of the circle. |
| radius | number |  | The radius of the circle. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| shape | [CircleShape](#circleshape) | The new shape. |

## love.physics.newDistanceJoint

Creates a DistanceJoint between two bodies.

This joint constrains the distance between two points on two bodies to be constant. These two points are specified in world coordinates and the two bodies are assumed to be in place when this joint is created. The first anchor point is connected to the first body and the second to the second body, and the points define the length of the distance joint.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| body1 | [Body](#body) |  | The first body to attach to the joint. |
| body2 | [Body](#body) |  | The second body to attach to the joint. |
| x1 | number |  | The x position of the first anchor point (world space). |
| y1 | number |  | The y position of the first anchor point (world space). |
| x2 | number |  | The x position of the second anchor point (world space). |
| y2 | number |  | The y position of the second anchor point (world space). |
| collideConnected | boolean | false | Specifies whether the two bodies should collide with each other. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| joint | [DistanceJoint](#distancejoint) | The new distance joint. |

## love.physics.newEdgeShape

Creates a new EdgeShape.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x1 | number |  | The x position of the first point. |
| y1 | number |  | The y position of the first point. |
| x2 | number |  | The x position of the second point. |
| y2 | number |  | The y position of the second point. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| shape | [EdgeShape](#edgeshape) | The new shape. |

## love.physics.newFixture

Creates and attaches a Fixture to a body.

Note that the Shape object is copied rather than kept as a reference when the Fixture is created. To get the Shape object that the Fixture owns, use Fixture:getShape.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| body | [Body](#body) |  | The body which gets the fixture attached. |
| shape | [Shape](#shape) |  | The shape to be copied to the fixture. |
| density | number | 1 | The density of the fixture. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| fixture | [Fixture](#fixture) | The new fixture. |

## love.physics.newFrictionJoint

Create a friction joint between two bodies. A FrictionJoint applies friction to a body.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| body1 | [Body](#body) |  | The first body to attach to the joint. |
| body2 | [Body](#body) |  | The second body to attach to the joint. |
| x | number |  | The x position of the anchor point. |
| y | number |  | The y position of the anchor point. |
| collideConnected | boolean | false | Specifies whether the two bodies should collide with each other. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| joint | [FrictionJoint](#frictionjoint) | The new FrictionJoint. |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| body1 | [Body](#body) |  | The first body to attach to the joint. |
| body2 | [Body](#body) |  | The second body to attach to the joint. |
| x1 | number |  | The x position of the first anchor point. |
| y1 | number |  | The y position of the first anchor point. |
| x2 | number |  | The x position of the second anchor point. |
| y2 | number |  | The y position of the second anchor point. |
| collideConnected | boolean | false | Specifies whether the two bodies should collide with each other. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| joint | [FrictionJoint](#frictionjoint) | The new FrictionJoint. |

## love.physics.newGearJoint

Create a GearJoint connecting two Joints.

The gear joint connects two joints that must be either  prismatic or  revolute joints. Using this joint requires that the joints it uses connect their respective bodies to the ground and have the ground as the first body. When destroying the bodies and joints you must make sure you destroy the gear joint before the other joints.

The gear joint has a ratio the determines how the angular or distance values of the connected joints relate to each other. The formula coordinate1 + ratio * coordinate2 always has a constant value that is set when the gear joint is created.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| joint1 | [Joint](#joint) |  | The first joint to connect with a gear joint. |
| joint2 | [Joint](#joint) |  | The second joint to connect with a gear joint. |
| ratio | number | 1 | The gear ratio. |
| collideConnected | boolean | false | Specifies whether the two bodies should collide with each other. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| joint | [GearJoint](#gearjoint) | The new gear joint. |

## love.physics.newMotorJoint

Creates a joint between two bodies which controls the relative motion between them.

Position and rotation offsets can be specified once the MotorJoint has been created, as well as the maximum motor force and torque that will be be applied to reach the target offsets.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| body1 | [Body](#body) |  | The first body to attach to the joint. |
| body2 | [Body](#body) |  | The second body to attach to the joint. |
| correctionFactor | number | 0.3 | The joint's initial position correction factor, in the range of 1. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| joint | [MotorJoint](#motorjoint) | The new MotorJoint. |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| body1 | [Body](#body) |  | The first body to attach to the joint. |
| body2 | [Body](#body) |  | The second body to attach to the joint. |
| correctionFactor | number | 0.3 | The joint's initial position correction factor, in the range of 1. |
| collideConnected | boolean | false | Specifies whether the two bodies should collide with each other. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| joint | [MotorJoint](#motorjoint) | The new MotorJoint. |

## love.physics.newMouseJoint

Create a joint between a body and the mouse.

This joint actually connects the body to a fixed point in the world. To make it follow the mouse, the fixed point must be updated every timestep (example below).

The advantage of using a MouseJoint instead of just changing a body position directly is that collisions and reactions to other joints are handled by the physics engine. 

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| body | [Body](#body) |  | The body to attach to the mouse. |
| x | number |  | The x position of the connecting point. |
| y | number |  | The y position of the connecting point. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| joint | [MouseJoint](#mousejoint) | The new mouse joint. |

## love.physics.newPolygonShape

Creates a new PolygonShape.

This shape can have 8 vertices at most, and must form a convex shape.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x1 | number |  | The x position of the first point. |
| y1 | number |  | The y position of the first point. |
| x2 | number |  | The x position of the second point. |
| y2 | number |  | The y position of the second point. |
| x3 | number |  | The x position of the third point. |
| y3 | number |  | The y position of the third point. |
| ... | number |  | You can continue passing more point positions to create the PolygonShape. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| shape | [PolygonShape](#polygonshape) | A new PolygonShape. |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| vertices | table |  | A list of vertices to construct the polygon, in the form of {x1, y1, x2, y2, x3, y3, ...}. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| shape | [PolygonShape](#polygonshape) | A new PolygonShape. |

## love.physics.newPrismaticJoint

Creates a PrismaticJoint between two bodies.

A prismatic joint constrains two bodies to move relatively to each other on a specified axis. It does not allow for relative rotation. Its definition and operation are similar to a  revolute joint, but with translation and force substituted for angle and torque.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| body1 | [Body](#body) |  | The first body to connect with a prismatic joint. |
| body2 | [Body](#body) |  | The second body to connect with a prismatic joint. |
| x | number |  | The x coordinate of the anchor point. |
| y | number |  | The y coordinate of the anchor point. |
| ax | number |  | The x coordinate of the axis vector. |
| ay | number |  | The y coordinate of the axis vector. |
| collideConnected | boolean | false | Specifies whether the two bodies should collide with each other. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| joint | [PrismaticJoint](#prismaticjoint) | The new prismatic joint. |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| body1 | [Body](#body) |  | The first body to connect with a prismatic joint. |
| body2 | [Body](#body) |  | The second body to connect with a prismatic joint. |
| x1 | number |  | The x coordinate of the first anchor point. |
| y1 | number |  | The y coordinate of the first anchor point. |
| x2 | number |  | The x coordinate of the second anchor point. |
| y2 | number |  | The y coordinate of the second anchor point. |
| ax | number |  | The x coordinate of the axis unit vector. |
| ay | number |  | The y coordinate of the axis unit vector. |
| collideConnected | boolean | false | Specifies whether the two bodies should collide with each other. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| joint | [PrismaticJoint](#prismaticjoint) | The new prismatic joint. |

### Variant 3

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| body1 | [Body](#body) |  | The first body to connect with a prismatic joint. |
| body2 | [Body](#body) |  | The second body to connect with a prismatic joint. |
| x1 | number |  | The x coordinate of the first anchor point. |
| y1 | number |  | The y coordinate of the first anchor point. |
| x2 | number |  | The x coordinate of the second anchor point. |
| y2 | number |  | The y coordinate of the second anchor point. |
| ax | number |  | The x coordinate of the axis unit vector. |
| ay | number |  | The y coordinate of the axis unit vector. |
| collideConnected | boolean | false | Specifies whether the two bodies should collide with each other. |
| referenceAngle | number | 0 | The reference angle between body1 and body2, in radians. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| joint | [PrismaticJoint](#prismaticjoint) | The new prismatic joint. |

## love.physics.newPulleyJoint

Creates a PulleyJoint to join two bodies to each other and the ground.

The pulley joint simulates a pulley with an optional block and tackle. If the ratio parameter has a value different from one, then the simulated rope extends faster on one side than the other. In a pulley joint the total length of the simulated rope is the constant length1 + ratio * length2, which is set when the pulley joint is created.

Pulley joints can behave unpredictably if one side is fully extended. It is recommended that the method  setMaxLengths  be used to constrain the maximum lengths each side can attain.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| body1 | [Body](#body) |  | The first body to connect with a pulley joint. |
| body2 | [Body](#body) |  | The second body to connect with a pulley joint. |
| gx1 | number |  | The x coordinate of the first body's ground anchor. |
| gy1 | number |  | The y coordinate of the first body's ground anchor. |
| gx2 | number |  | The x coordinate of the second body's ground anchor. |
| gy2 | number |  | The y coordinate of the second body's ground anchor. |
| x1 | number |  | The x coordinate of the pulley joint anchor in the first body. |
| y1 | number |  | The y coordinate of the pulley joint anchor in the first body. |
| x2 | number |  | The x coordinate of the pulley joint anchor in the second body. |
| y2 | number |  | The y coordinate of the pulley joint anchor in the second body. |
| ratio | number | 1 | The joint ratio. |
| collideConnected | boolean | true | Specifies whether the two bodies should collide with each other. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| joint | [PulleyJoint](#pulleyjoint) | The new pulley joint. |

## love.physics.newRectangleShape

Shorthand for creating rectangular PolygonShapes. 

By default, the local origin is located at the '''center''' of the rectangle as opposed to the top left for graphics.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| width | number |  | The width of the rectangle. |
| height | number |  | The height of the rectangle. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| shape | [PolygonShape](#polygonshape) | A new PolygonShape. |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | The offset along the x-axis. |
| y | number |  | The offset along the y-axis. |
| width | number |  | The width of the rectangle. |
| height | number |  | The height of the rectangle. |
| angle | number | 0 | The initial angle of the rectangle. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| shape | [PolygonShape](#polygonshape) | A new PolygonShape. |

## love.physics.newRevoluteJoint

Creates a pivot joint between two bodies.

This joint connects two bodies to a point around which they can pivot.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| body1 | [Body](#body) |  | The first body. |
| body2 | [Body](#body) |  | The second body. |
| x | number |  | The x position of the connecting point. |
| y | number |  | The y position of the connecting point. |
| collideConnected | boolean | false | Specifies whether the two bodies should collide with each other. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| joint | [RevoluteJoint](#revolutejoint) | The new revolute joint. |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| body1 | [Body](#body) |  | The first body. |
| body2 | [Body](#body) |  | The second body. |
| x1 | number |  | The x position of the first connecting point. |
| y1 | number |  | The y position of the first connecting point. |
| x2 | number |  | The x position of the second connecting point. |
| y2 | number |  | The y position of the second connecting point. |
| collideConnected | boolean | false | Specifies whether the two bodies should collide with each other. |
| referenceAngle | number | 0 | The reference angle between body1 and body2, in radians. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| joint | [RevoluteJoint](#revolutejoint) | The new revolute joint. |

## love.physics.newRopeJoint

Creates a joint between two bodies. Its only function is enforcing a max distance between these bodies.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| body1 | [Body](#body) |  | The first body to attach to the joint. |
| body2 | [Body](#body) |  | The second body to attach to the joint. |
| x1 | number |  | The x position of the first anchor point. |
| y1 | number |  | The y position of the first anchor point. |
| x2 | number |  | The x position of the second anchor point. |
| y2 | number |  | The y position of the second anchor point. |
| maxLength | number |  | The maximum distance for the bodies. |
| collideConnected | boolean | false | Specifies whether the two bodies should collide with each other. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| joint | [RopeJoint](#ropejoint) | The new RopeJoint. |

## love.physics.newWeldJoint

Creates a constraint joint between two bodies. A WeldJoint essentially glues two bodies together. The constraint is a bit soft, however, due to Box2D's iterative solver.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| body1 | [Body](#body) |  | The first body to attach to the joint. |
| body2 | [Body](#body) |  | The second body to attach to the joint. |
| x | number |  | The x position of the anchor point (world space). |
| y | number |  | The y position of the anchor point (world space). |
| collideConnected | boolean | false | Specifies whether the two bodies should collide with each other. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| joint | [WeldJoint](#weldjoint) | The new WeldJoint. |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| body1 | [Body](#body) |  | The first body to attach to the joint. |
| body2 | [Body](#body) |  | The second body to attach to the joint. |
| x1 | number |  | The x position of the first anchor point (world space). |
| y1 | number |  | The y position of the first anchor point (world space). |
| x2 | number |  | The x position of the second anchor point (world space). |
| y2 | number |  | The y position of the second anchor point (world space). |
| collideConnected | boolean | false | Specifies whether the two bodies should collide with each other. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| joint | [WeldJoint](#weldjoint) | The new WeldJoint. |

### Variant 3

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| body1 | [Body](#body) |  | The first body to attach to the joint. |
| body2 | [Body](#body) |  | The second body to attach to the joint. |
| x1 | number |  | The x position of the first anchor point (world space). |
| y1 | number |  | The y position of the first anchor point  (world space). |
| x2 | number |  | The x position of the second anchor point (world space). |
| y2 | number |  | The y position of the second anchor point (world space). |
| collideConnected | boolean | false | Specifies whether the two bodies should collide with each other. |
| referenceAngle | number | 0 | The reference angle between body1 and body2, in radians. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| joint | [WeldJoint](#weldjoint) | The new WeldJoint. |

## love.physics.newWheelJoint

Creates a wheel joint.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| body1 | [Body](#body) |  | The first body. |
| body2 | [Body](#body) |  | The second body. |
| x | number |  | The x position of the anchor point. |
| y | number |  | The y position of the anchor point. |
| ax | number |  | The x position of the axis unit vector. |
| ay | number |  | The y position of the axis unit vector. |
| collideConnected | boolean | false | Specifies whether the two bodies should collide with each other. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| joint | [WheelJoint](#wheeljoint) | The new WheelJoint. |

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| body1 | [Body](#body) |  | The first body. |
| body2 | [Body](#body) |  | The second body. |
| x1 | number |  | The x position of the first anchor point. |
| y1 | number |  | The y position of the first anchor point. |
| x2 | number |  | The x position of the second anchor point. |
| y2 | number |  | The y position of the second anchor point. |
| ax | number |  | The x position of the axis unit vector. |
| ay | number |  | The y position of the axis unit vector. |
| collideConnected | boolean | false | Specifies whether the two bodies should collide with each other. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| joint | [WheelJoint](#wheeljoint) | The new WheelJoint. |

## love.physics.newWorld

Creates a new World.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| xg | number | 0 | The x component of gravity. |
| yg | number | 0 | The y component of gravity. |
| sleep | boolean | true | Whether the bodies in this world are allowed to sleep. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| world | [World](#world) | A brave new World. |

## love.physics.setMeter

Sets the pixels to meter scale factor.

All coordinates in the physics module are divided by this number and converted to meters, and it creates a convenient way to draw the objects directly to the screen without the need for graphics transformations.

It is recommended to create shapes no larger than 10 times the scale. This is important because Box2D is tuned to work well with shape sizes from 0.1 to 10 meters. The default meter scale is 30.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| scale | number |  | The scale factor as an integer. |

**Returns:**

*No return values*

## Types

## Body

Bodies are objects with velocity and position.

**Constructors:** [newBody](#lovephysicsnewbody)

**Supertypes:** Object

### Methods

#### Body:applyAngularImpulse

Applies an angular impulse to a body. This makes a single, instantaneous addition to the body momentum.

A body with with a larger mass will react less. The reaction does '''not''' depend on the timestep, and is equivalent to applying a force continuously for 1 second. Impulses are best used to give a single push to a body. For a continuous push to a body it is better to use Body:applyForce.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| impulse | number |  | The impulse in kilogram-square meter per second. |

**Returns:**

*No return values*

#### Body:applyForce

Apply force to a Body.

A force pushes a body in a direction. A body with with a larger mass will react less. The reaction also depends on how long a force is applied: since the force acts continuously over the entire timestep, a short timestep will only push the body for a short time. Thus forces are best used for many timesteps to give a continuous push to a body (like gravity). For a single push that is independent of timestep, it is better to use Body:applyLinearImpulse.

If the position to apply the force is not given, it will act on the center of mass of the body. The part of the force not directed towards the center of mass will cause the body to spin (and depends on the rotational inertia).

Note that the force components and position must be given in world coordinates.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| fx | number |  | The x component of force to apply to the center of mass. |
| fy | number |  | The y component of force to apply to the center of mass. |

**Returns:**

*No return values*

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| fx | number |  | The x component of force to apply. |
| fy | number |  | The y component of force to apply. |
| x | number |  | The x position to apply the force. |
| y | number |  | The y position to apply the force. |

**Returns:**

*No return values*

#### Body:applyLinearImpulse

Applies an impulse to a body.

This makes a single, instantaneous addition to the body momentum.

An impulse pushes a body in a direction. A body with with a larger mass will react less. The reaction does '''not''' depend on the timestep, and is equivalent to applying a force continuously for 1 second. Impulses are best used to give a single push to a body. For a continuous push to a body it is better to use Body:applyForce.

If the position to apply the impulse is not given, it will act on the center of mass of the body. The part of the impulse not directed towards the center of mass will cause the body to spin (and depends on the rotational inertia). 

Note that the impulse components and position must be given in world coordinates.

### Variant 1

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| ix | number |  | The x component of the impulse applied to the center of mass. |
| iy | number |  | The y component of the impulse applied to the center of mass. |

**Returns:**

*No return values*

### Variant 2

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| ix | number |  | The x component of the impulse. |
| iy | number |  | The y component of the impulse. |
| x | number |  | The x position to apply the impulse. |
| y | number |  | The y position to apply the impulse. |

**Returns:**

*No return values*

#### Body:applyTorque

Apply torque to a body.

Torque is like a force that will change the angular velocity (spin) of a body. The effect will depend on the rotational inertia a body has.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| torque | number |  | The torque to apply. |

**Returns:**

*No return values*

#### Body:destroy

Explicitly destroys the Body and all fixtures and joints attached to it.

An error will occur if you attempt to use the object after calling this function. In 0.7.2, when you don't have time to wait for garbage collection, this function may be used to free the object immediately.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

#### Body:getAngle

Get the angle of the body.

The angle is measured in radians. If you need to transform it to degrees, use math.deg.

A value of 0 radians will mean 'looking to the right'. Although radians increase counter-clockwise, the y axis points down so it becomes ''clockwise'' from our point of view.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| angle | number | The angle in radians. |

#### Body:getAngularDamping

Gets the Angular damping of the Body

The angular damping is the ''rate of decrease of the angular velocity over time'': A spinning body with no damping and no external forces will continue spinning indefinitely. A spinning body with damping will gradually stop spinning.

Damping is not the same as friction - they can be modelled together. However, only damping is provided by Box2D (and LOVE).

Damping parameters should be between 0 and infinity, with 0 meaning no damping, and infinity meaning full damping. Normally you will use a damping value between 0 and 0.1.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| damping | number | The value of the angular damping. |

#### Body:getAngularVelocity

Get the angular velocity of the Body.

The angular velocity is the ''rate of change of angle over time''.

It is changed in World:update by applying torques, off centre forces/impulses, and angular damping. It can be set directly with Body:setAngularVelocity.

If you need the ''rate of change of position over time'', use Body:getLinearVelocity.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| w | number | The angular velocity in radians/second. |

#### Body:getContacts

Gets a list of all Contacts attached to the Body.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| contacts | table | A list with all contacts associated with the Body. |

#### Body:getFixtures

Returns a table with all fixtures.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| fixtures | table | A sequence with all fixtures. |

#### Body:getGravityScale

Returns the gravity scale factor.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| scale | number | The gravity scale factor. |

#### Body:getInertia

Gets the rotational inertia of the body.

The rotational inertia is how hard is it to make the body spin.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| inertia | number | The rotational inertial of the body. |

#### Body:getJoints

Returns a table containing the Joints attached to this Body.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| joints | table | A sequence with the Joints attached to the Body. |

#### Body:getLinearDamping

Gets the linear damping of the Body.

The linear damping is the ''rate of decrease of the linear velocity over time''. A moving body with no damping and no external forces will continue moving indefinitely, as is the case in space. A moving body with damping will gradually stop moving.

Damping is not the same as friction - they can be modelled together.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| damping | number | The value of the linear damping. |

#### Body:getLinearVelocity

Gets the linear velocity of the Body from its center of mass.

The linear velocity is the ''rate of change of position over time''.

If you need the ''rate of change of angle over time'', use Body:getAngularVelocity.

If you need to get the linear velocity of a point different from the center of mass:

*  Body:getLinearVelocityFromLocalPoint allows you to specify the point in local coordinates.

*  Body:getLinearVelocityFromWorldPoint allows you to specify the point in world coordinates.

See page 136 of 'Essential Mathematics for Games and Interactive Applications' for definitions of local and world coordinates.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| x | number | The x-component of the velocity vector |
| y | number | The y-component of the velocity vector |

#### Body:getLinearVelocityFromLocalPoint

Get the linear velocity of a point on the body.

The linear velocity for a point on the body is the velocity of the body center of mass plus the velocity at that point from the body spinning.

The point on the body must given in local coordinates. Use Body:getLinearVelocityFromWorldPoint to specify this with world coordinates.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | The x position to measure velocity. |
| y | number |  | The y position to measure velocity. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| vx | number | The x component of velocity at point (x,y). |
| vy | number | The y component of velocity at point (x,y). |

#### Body:getLinearVelocityFromWorldPoint

Get the linear velocity of a point on the body.

The linear velocity for a point on the body is the velocity of the body center of mass plus the velocity at that point from the body spinning.

The point on the body must given in world coordinates. Use Body:getLinearVelocityFromLocalPoint to specify this with local coordinates.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | The x position to measure velocity. |
| y | number |  | The y position to measure velocity. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| vx | number | The x component of velocity at point (x,y). |
| vy | number | The y component of velocity at point (x,y). |

#### Body:getLocalCenter

Get the center of mass position in local coordinates.

Use Body:getWorldCenter to get the center of mass in world coordinates.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| x | number | The x coordinate of the center of mass. |
| y | number | The y coordinate of the center of mass. |

#### Body:getLocalPoint

Transform a point from world coordinates to local coordinates.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| worldX | number |  | The x position in world coordinates. |
| worldY | number |  | The y position in world coordinates. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| localX | number | The x position in local coordinates. |
| localY | number | The y position in local coordinates. |

#### Body:getLocalPoints

Transforms multiple points from world coordinates to local coordinates.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x1 | number |  | (Argument) The x position of the first point. |
| y1 | number |  | (Argument) The y position of the first point. |
| x2 | number |  | (Argument) The x position of the second point. |
| y2 | number |  | (Argument) The y position of the second point. |
| ... | number |  | (Argument) You can continue passing x and y position of the points. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| x1 | number | (Result) The transformed x position of the first point. |
| y1 | number | (Result) The transformed y position of the first point. |
| x2 | number | (Result) The transformed x position of the second point. |
| y2 | number | (Result) The transformed y position of the second point. |
| ... | number | (Result) Additional transformed x and y position of the points. |

#### Body:getLocalVector

Transform a vector from world coordinates to local coordinates.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| worldX | number |  | The vector x component in world coordinates. |
| worldY | number |  | The vector y component in world coordinates. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| localX | number | The vector x component in local coordinates. |
| localY | number | The vector y component in local coordinates. |

#### Body:getMass

Get the mass of the body.

Static bodies always have a mass of 0.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| mass | number | The mass of the body (in kilograms). |

#### Body:getMassData

Returns the mass, its center, and the rotational inertia.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| x | number | The x position of the center of mass. |
| y | number | The y position of the center of mass. |
| mass | number | The mass of the body. |
| inertia | number | The rotational inertia. |

#### Body:getPosition

Get the position of the body.

Note that this may not be the center of mass of the body.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| x | number | The x position. |
| y | number | The y position. |

#### Body:getTransform

Get the position and angle of the body.

Note that the position may not be the center of mass of the body. An angle of 0 radians will mean 'looking to the right'. Although radians increase counter-clockwise, the y axis points down so it becomes clockwise from our point of view.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| x | number | The x component of the position. |
| y | number | The y component of the position. |
| angle | number | The angle in radians. |

#### Body:getType

Returns the type of the body.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| type | [BodyType](#bodytype) | The body type. |

#### Body:getUserData

Returns the Lua value associated with this Body.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| value | any | The Lua value associated with the Body. |

#### Body:getWorld

Gets the World the body lives in.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| world | [World](#world) | The world the body lives in. |

#### Body:getWorldCenter

Get the center of mass position in world coordinates.

Use Body:getLocalCenter to get the center of mass in local coordinates.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| x | number | The x coordinate of the center of mass. |
| y | number | The y coordinate of the center of mass. |

#### Body:getWorldPoint

Transform a point from local coordinates to world coordinates.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| localX | number |  | The x position in local coordinates. |
| localY | number |  | The y position in local coordinates. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| worldX | number | The x position in world coordinates. |
| worldY | number | The y position in world coordinates. |

#### Body:getWorldPoints

Transforms multiple points from local coordinates to world coordinates.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x1 | number |  | The x position of the first point. |
| y1 | number |  | The y position of the first point. |
| x2 | number |  | The x position of the second point. |
| y2 | number |  | The y position of the second point. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| x1 | number | The transformed x position of the first point. |
| y1 | number | The transformed y position of the first point. |
| x2 | number | The transformed x position of the second point. |
| y2 | number | The transformed y position of the second point. |

#### Body:getWorldVector

Transform a vector from local coordinates to world coordinates.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| localX | number |  | The vector x component in local coordinates. |
| localY | number |  | The vector y component in local coordinates. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| worldX | number | The vector x component in world coordinates. |
| worldY | number | The vector y component in world coordinates. |

#### Body:getX

Get the x position of the body in world coordinates.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| x | number | The x position in world coordinates. |

#### Body:getY

Get the y position of the body in world coordinates.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| y | number | The y position in world coordinates. |

#### Body:isActive

Returns whether the body is actively used in the simulation.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| status | boolean | True if the body is active or false if not. |

#### Body:isAwake

Returns the sleep status of the body.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| status | boolean | True if the body is awake or false if not. |

#### Body:isBullet

Get the bullet status of a body.

There are two methods to check for body collisions:

*  at their location when the world is updated (default)

*  using continuous collision detection (CCD)

The default method is efficient, but a body moving very quickly may sometimes jump over another body without producing a collision. A body that is set as a bullet will use CCD. This is less efficient, but is guaranteed not to jump when moving quickly.

Note that static bodies (with zero mass) always use CCD, so your walls will not let a fast moving body pass through even if it is not a bullet.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| status | boolean | The bullet status of the body. |

#### Body:isDestroyed

Gets whether the Body is destroyed. Destroyed bodies cannot be used.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| destroyed | boolean | Whether the Body is destroyed. |

#### Body:isFixedRotation

Returns whether the body rotation is locked.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| fixed | boolean | True if the body's rotation is locked or false if not. |

#### Body:isSleepingAllowed

Returns the sleeping behaviour of the body.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| allowed | boolean | True if the body is allowed to sleep or false if not. |

#### Body:isTouching

Gets whether the Body is touching the given other Body.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| otherbody | [Body](#body) |  | The other body to check. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| touching | boolean | True if this body is touching the other body, false otherwise. |

#### Body:resetMassData

Resets the mass of the body by recalculating it from the mass properties of the fixtures.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

#### Body:setActive

Sets whether the body is active in the world.

An inactive body does not take part in the simulation. It will not move or cause any collisions.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| active | boolean |  | If the body is active or not. |

**Returns:**

*No return values*

#### Body:setAngle

Set the angle of the body.

The angle is measured in radians. If you need to transform it from degrees, use math.rad.

A value of 0 radians will mean 'looking to the right'. Although radians increase counter-clockwise, the y axis points down so it becomes ''clockwise'' from our point of view.

It is possible to cause a collision with another body by changing its angle. 

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| angle | number |  | The angle in radians. |

**Returns:**

*No return values*

#### Body:setAngularDamping

Sets the angular damping of a Body

See Body:getAngularDamping for a definition of angular damping.

Angular damping can take any value from 0 to infinity. It is recommended to stay between 0 and 0.1, though. Other values will look unrealistic.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| damping | number |  | The new angular damping. |

**Returns:**

*No return values*

#### Body:setAngularVelocity

Sets the angular velocity of a Body.

The angular velocity is the ''rate of change of angle over time''.

This function will not accumulate anything; any impulses previously applied since the last call to World:update will be lost. 

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| w | number |  | The new angular velocity, in radians per second |

**Returns:**

*No return values*

#### Body:setAwake

Wakes the body up or puts it to sleep.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| awake | boolean |  | The body sleep status. |

**Returns:**

*No return values*

#### Body:setBullet

Set the bullet status of a body.

There are two methods to check for body collisions:

*  at their location when the world is updated (default)

*  using continuous collision detection (CCD)

The default method is efficient, but a body moving very quickly may sometimes jump over another body without producing a collision. A body that is set as a bullet will use CCD. This is less efficient, but is guaranteed not to jump when moving quickly.

Note that static bodies (with zero mass) always use CCD, so your walls will not let a fast moving body pass through even if it is not a bullet.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| status | boolean |  | The bullet status of the body. |

**Returns:**

*No return values*

#### Body:setFixedRotation

Set whether a body has fixed rotation.

Bodies with fixed rotation don't vary the speed at which they rotate. Calling this function causes the mass to be reset. 

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| isFixed | boolean |  | Whether the body should have fixed rotation. |

**Returns:**

*No return values*

#### Body:setGravityScale

Sets a new gravity scale factor for the body.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| scale | number |  | The new gravity scale factor. |

**Returns:**

*No return values*

#### Body:setInertia

Set the inertia of a body.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| inertia | number |  | The new moment of inertia, in kilograms * pixel squared. |

**Returns:**

*No return values*

#### Body:setLinearDamping

Sets the linear damping of a Body

See Body:getLinearDamping for a definition of linear damping.

Linear damping can take any value from 0 to infinity. It is recommended to stay between 0 and 0.1, though. Other values will make the objects look 'floaty'(if gravity is enabled).

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| ld | number |  | The new linear damping |

**Returns:**

*No return values*

#### Body:setLinearVelocity

Sets a new linear velocity for the Body.

This function will not accumulate anything; any impulses previously applied since the last call to World:update will be lost.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | The x-component of the velocity vector. |
| y | number |  | The y-component of the velocity vector. |

**Returns:**

*No return values*

#### Body:setMass

Sets a new body mass.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| mass | number |  | The mass, in kilograms. |

**Returns:**

*No return values*

#### Body:setMassData

Overrides the calculated mass data.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | The x position of the center of mass. |
| y | number |  | The y position of the center of mass. |
| mass | number |  | The mass of the body. |
| inertia | number |  | The rotational inertia. |

**Returns:**

*No return values*

#### Body:setPosition

Set the position of the body.

Note that this may not be the center of mass of the body.

This function cannot wake up the body.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | The x position. |
| y | number |  | The y position. |

**Returns:**

*No return values*

#### Body:setSleepingAllowed

Sets the sleeping behaviour of the body. Should sleeping be allowed, a body at rest will automatically sleep. A sleeping body is not simulated unless it collided with an awake body. Be wary that one can end up with a situation like a floating sleeping body if the floor was removed.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| allowed | boolean |  | True if the body is allowed to sleep or false if not. |

**Returns:**

*No return values*

#### Body:setTransform

Set the position and angle of the body.

Note that the position may not be the center of mass of the body. An angle of 0 radians will mean 'looking to the right'. Although radians increase counter-clockwise, the y axis points down so it becomes clockwise from our point of view.

This function cannot wake up the body.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | The x component of the position. |
| y | number |  | The y component of the position. |
| angle | number |  | The angle in radians. |

**Returns:**

*No return values*

#### Body:setType

Sets a new body type.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| type | [BodyType](#bodytype) |  | The new type. |

**Returns:**

*No return values*

#### Body:setUserData

Associates a Lua value with the Body.

To delete the reference, explicitly pass nil.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| value | any |  | The Lua value to associate with the Body. |

**Returns:**

*No return values*

#### Body:setX

Set the x position of the body.

This function cannot wake up the body. 

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | The x position. |

**Returns:**

*No return values*

#### Body:setY

Set the y position of the body.

This function cannot wake up the body. 

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| y | number |  | The y position. |

**Returns:**

*No return values*

## ChainShape

A ChainShape consists of multiple line segments. It can be used to create the boundaries of your terrain. The shape does not have volume and can only collide with PolygonShape and CircleShape.

Unlike the PolygonShape, the ChainShape does not have a vertices limit or has to form a convex shape, but self intersections are not supported.

**Constructors:** [newChainShape](#lovephysicsnewchainshape)

**Supertypes:** Shape, Object

### Methods

#### ChainShape:getChildEdge

Returns a child of the shape as an EdgeShape.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| index | number |  | The index of the child. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| shape | [EdgeShape](#edgeshape) | The child as an EdgeShape. |

#### ChainShape:getNextVertex

Gets the vertex that establishes a connection to the next shape.

Setting next and previous ChainShape vertices can help prevent unwanted collisions when a flat shape slides along the edge and moves over to the new shape.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| x | number | The x-component of the vertex, or nil if ChainShape:setNextVertex hasn't been called. |
| y | number | The y-component of the vertex, or nil if ChainShape:setNextVertex hasn't been called. |

#### ChainShape:getPoint

Returns a point of the shape.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| index | number |  | The index of the point to return. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| x | number | The x-coordinate of the point. |
| y | number | The y-coordinate of the point. |

#### ChainShape:getPoints

Returns all points of the shape.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| x1 | number | The x-coordinate of the first point. |
| y1 | number | The y-coordinate of the first point. |
| x2 | number | The x-coordinate of the second point. |
| y2 | number | The y-coordinate of the second point. |

#### ChainShape:getPreviousVertex

Gets the vertex that establishes a connection to the previous shape.

Setting next and previous ChainShape vertices can help prevent unwanted collisions when a flat shape slides along the edge and moves over to the new shape.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| x | number | The x-component of the vertex, or nil if ChainShape:setPreviousVertex hasn't been called. |
| y | number | The y-component of the vertex, or nil if ChainShape:setPreviousVertex hasn't been called. |

#### ChainShape:getVertexCount

Returns the number of vertices the shape has.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| count | number | The number of vertices. |

#### ChainShape:setNextVertex

Sets a vertex that establishes a connection to the next shape.

This can help prevent unwanted collisions when a flat shape slides along the edge and moves over to the new shape.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | The x-component of the vertex. |
| y | number |  | The y-component of the vertex. |

**Returns:**

*No return values*

#### ChainShape:setPreviousVertex

Sets a vertex that establishes a connection to the previous shape.

This can help prevent unwanted collisions when a flat shape slides along the edge and moves over to the new shape.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | The x-component of the vertex. |
| y | number |  | The y-component of the vertex. |

**Returns:**

*No return values*

## CircleShape

Circle extends Shape and adds a radius and a local position.

**Constructors:** [newCircleShape](#lovephysicsnewcircleshape)

**Supertypes:** Shape, Object

### Methods

#### CircleShape:getPoint

Gets the center point of the circle shape.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| x | number | The x-component of the center point of the circle. |
| y | number | The y-component of the center point of the circle. |

#### CircleShape:getRadius

Gets the radius of the circle shape.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| radius | number | The radius of the circle |

#### CircleShape:setPoint

Sets the location of the center of the circle shape.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | The x-component of the new center point of the circle. |
| y | number |  | The y-component of the new center point of the circle. |

**Returns:**

*No return values*

#### CircleShape:setRadius

Sets the radius of the circle.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| radius | number |  | The radius of the circle |

**Returns:**

*No return values*

## Contact

Contacts are objects created to manage collisions in worlds.

**Supertypes:** Object

### Methods

#### Contact:getChildren

Gets the child indices of the shapes of the two colliding fixtures. For ChainShapes, an index of 1 is the first edge in the chain.
Used together with Fixture:rayCast or ChainShape:getChildEdge.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| indexA | number | The child index of the first fixture's shape. |
| indexB | number | The child index of the second fixture's shape. |

#### Contact:getFixtures

Gets the two Fixtures that hold the shapes that are in contact.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| fixtureA | [Fixture](#fixture) | The first Fixture. |
| fixtureB | [Fixture](#fixture) | The second Fixture. |

#### Contact:getFriction

Get the friction between two shapes that are in contact.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| friction | number | The friction of the contact. |

#### Contact:getNormal

Get the normal vector between two shapes that are in contact.

This function returns the coordinates of a unit vector that points from the first shape to the second.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| nx | number | The x component of the normal vector. |
| ny | number | The y component of the normal vector. |

#### Contact:getPositions

Returns the contact points of the two colliding fixtures. There can be one or two points.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| x1 | number | The x coordinate of the first contact point. |
| y1 | number | The y coordinate of the first contact point. |
| x2 | number | The x coordinate of the second contact point. |
| y2 | number | The y coordinate of the second contact point. |

#### Contact:getRestitution

Get the restitution between two shapes that are in contact.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| restitution | number | The restitution between the two shapes. |

#### Contact:isEnabled

Returns whether the contact is enabled. The collision will be ignored if a contact gets disabled in the preSolve callback.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| enabled | boolean | True if enabled, false otherwise. |

#### Contact:isTouching

Returns whether the two colliding fixtures are touching each other.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| touching | boolean | True if they touch or false if not. |

#### Contact:resetFriction

Resets the contact friction to the mixture value of both fixtures.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

#### Contact:resetRestitution

Resets the contact restitution to the mixture value of both fixtures.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

#### Contact:setEnabled

Enables or disables the contact.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| enabled | boolean |  | True to enable or false to disable. |

**Returns:**

*No return values*

#### Contact:setFriction

Sets the contact friction.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| friction | number |  | The contact friction. |

**Returns:**

*No return values*

#### Contact:setRestitution

Sets the contact restitution.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| restitution | number |  | The contact restitution. |

**Returns:**

*No return values*

## DistanceJoint

Keeps two bodies at the same distance.

**Constructors:** [newDistanceJoint](#lovephysicsnewdistancejoint)

**Supertypes:** Joint, Object

### Methods

#### DistanceJoint:getDampingRatio

Gets the damping ratio.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| ratio | number | The damping ratio. |

#### DistanceJoint:getFrequency

Gets the response speed.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| Hz | number | The response speed. |

#### DistanceJoint:getLength

Gets the equilibrium distance between the two Bodies.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| l | number | The length between the two Bodies. |

#### DistanceJoint:setDampingRatio

Sets the damping ratio.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| ratio | number |  | The damping ratio. |

**Returns:**

*No return values*

#### DistanceJoint:setFrequency

Sets the response speed.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| Hz | number |  | The response speed. |

**Returns:**

*No return values*

#### DistanceJoint:setLength

Sets the equilibrium distance between the two Bodies.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| l | number |  | The length between the two Bodies. |

**Returns:**

*No return values*

## EdgeShape

A EdgeShape is a line segment. They can be used to create the boundaries of your terrain. The shape does not have volume and can only collide with PolygonShape and CircleShape.

**Constructors:** [newEdgeShape](#lovephysicsnewedgeshape)

**Supertypes:** Shape, Object

### Methods

#### EdgeShape:getNextVertex

Gets the vertex that establishes a connection to the next shape.

Setting next and previous EdgeShape vertices can help prevent unwanted collisions when a flat shape slides along the edge and moves over to the new shape.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| x | number | The x-component of the vertex, or nil if EdgeShape:setNextVertex hasn't been called. |
| y | number | The y-component of the vertex, or nil if EdgeShape:setNextVertex hasn't been called. |

#### EdgeShape:getPoints

Returns the local coordinates of the edge points.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| x1 | number | The x-component of the first vertex. |
| y1 | number | The y-component of the first vertex. |
| x2 | number | The x-component of the second vertex. |
| y2 | number | The y-component of the second vertex. |

#### EdgeShape:getPreviousVertex

Gets the vertex that establishes a connection to the previous shape.

Setting next and previous EdgeShape vertices can help prevent unwanted collisions when a flat shape slides along the edge and moves over to the new shape.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| x | number | The x-component of the vertex, or nil if EdgeShape:setPreviousVertex hasn't been called. |
| y | number | The y-component of the vertex, or nil if EdgeShape:setPreviousVertex hasn't been called. |

#### EdgeShape:setNextVertex

Sets a vertex that establishes a connection to the next shape.

This can help prevent unwanted collisions when a flat shape slides along the edge and moves over to the new shape.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | The x-component of the vertex. |
| y | number |  | The y-component of the vertex. |

**Returns:**

*No return values*

#### EdgeShape:setPreviousVertex

Sets a vertex that establishes a connection to the previous shape.

This can help prevent unwanted collisions when a flat shape slides along the edge and moves over to the new shape.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | The x-component of the vertex. |
| y | number |  | The y-component of the vertex. |

**Returns:**

*No return values*

## Fixture

Fixtures attach shapes to bodies.

**Constructors:** [newFixture](#lovephysicsnewfixture)

**Supertypes:** Object

### Methods

#### Fixture:destroy

Destroys the fixture.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

#### Fixture:getBody

Returns the body to which the fixture is attached.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| body | [Body](#body) | The parent body. |

#### Fixture:getBoundingBox

Returns the points of the fixture bounding box. In case the fixture has multiple children a 1-based index can be specified. For example, a fixture will have multiple children with a chain shape.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| index | number | 1 | A bounding box of the fixture. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| topLeftX | number | The x position of the top-left point. |
| topLeftY | number | The y position of the top-left point. |
| bottomRightX | number | The x position of the bottom-right point. |
| bottomRightY | number | The y position of the bottom-right point. |

#### Fixture:getCategory

Returns the categories the fixture belongs to.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| ... | number | The categories. |

#### Fixture:getDensity

Returns the density of the fixture.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| density | number | The fixture density in kilograms per square meter. |

#### Fixture:getFilterData

Returns the filter data of the fixture.

Categories and masks are encoded as the bits of a 16-bit integer.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| categories | number | The categories as an integer from 0 to 65535. |
| mask | number | The mask as an integer from 0 to 65535. |
| group | number | The group as an integer from -32768 to 32767. |

#### Fixture:getFriction

Returns the friction of the fixture.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| friction | number | The fixture friction. |

#### Fixture:getGroupIndex

Returns the group the fixture belongs to. Fixtures with the same group will always collide if the group is positive or never collide if it's negative. The group zero means no group.

The groups range from -32768 to 32767.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| group | number | The group of the fixture. |

#### Fixture:getMask

Returns which categories this fixture should '''NOT''' collide with.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| ... | number | The masks. |

#### Fixture:getMassData

Returns the mass, its center and the rotational inertia.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| x | number | The x position of the center of mass. |
| y | number | The y position of the center of mass. |
| mass | number | The mass of the fixture. |
| inertia | number | The rotational inertia. |

#### Fixture:getRestitution

Returns the restitution of the fixture.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| restitution | number | The fixture restitution. |

#### Fixture:getShape

Returns the shape of the fixture. This shape is a reference to the actual data used in the simulation. It's possible to change its values between timesteps.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| shape | [Shape](#shape) | The fixture's shape. |

#### Fixture:getUserData

Returns the Lua value associated with this fixture.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| value | any | The Lua value associated with the fixture. |

#### Fixture:isDestroyed

Gets whether the Fixture is destroyed. Destroyed fixtures cannot be used.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| destroyed | boolean | Whether the Fixture is destroyed. |

#### Fixture:isSensor

Returns whether the fixture is a sensor.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| sensor | boolean | If the fixture is a sensor. |

#### Fixture:rayCast

Casts a ray against the shape of the fixture and returns the surface normal vector and the line position where the ray hit. If the ray missed the shape, nil will be returned.

The ray starts on the first point of the input line and goes towards the second point of the line. The fifth argument is the maximum distance the ray is going to travel as a scale factor of the input line length.

The childIndex parameter is used to specify which child of a parent shape, such as a ChainShape, will be ray casted. For ChainShapes, the index of 1 is the first edge on the chain. Ray casting a parent shape will only test the child specified so if you want to test every shape of the parent, you must loop through all of its children.

The world position of the impact can be calculated by multiplying the line vector with the third return value and adding it to the line starting point.

hitx, hity = x1 + (x2 - x1) * fraction, y1 + (y2 - y1) * fraction

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x1 | number |  | The x position of the input line starting point. |
| y1 | number |  | The y position of the input line starting point. |
| x2 | number |  | The x position of the input line end point. |
| y2 | number |  | The y position of the input line end point. |
| maxFraction | number |  | Ray length parameter. |
| childIndex | number | 1 | The index of the child the ray gets cast against. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| xn | number | The x component of the normal vector of the edge where the ray hit the shape. |
| yn | number | The y component of the normal vector of the edge where the ray hit the shape. |
| fraction | number | The position on the input line where the intersection happened as a factor of the line length. |

#### Fixture:setCategory

Sets the categories the fixture belongs to. There can be up to 16 categories represented as a number from 1 to 16.

All fixture's default category is 1.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| ... | number |  | The categories. |

**Returns:**

*No return values*

#### Fixture:setDensity

Sets the density of the fixture. Call Body:resetMassData if this needs to take effect immediately.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| density | number |  | The fixture density in kilograms per square meter. |

**Returns:**

*No return values*

#### Fixture:setFilterData

Sets the filter data of the fixture.

Groups, categories, and mask can be used to define the collision behaviour of the fixture.

If two fixtures are in the same group they either always collide if the group is positive, or never collide if it's negative. If the group is zero or they do not match, then the contact filter checks if the fixtures select a category of the other fixture with their masks. The fixtures do not collide if that's not the case. If they do have each other's categories selected, the return value of the custom contact filter will be used. They always collide if none was set.

There can be up to 16 categories. Categories and masks are encoded as the bits of a 16-bit integer.

When created, prior to calling this function, all fixtures have category set to 1, mask set to 65535 (all categories) and group set to 0.

This function allows setting all filter data for a fixture at once. To set only the categories, the mask or the group, you can use Fixture:setCategory, Fixture:setMask or Fixture:setGroupIndex respectively.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| categories | number |  | The categories as an integer from 0 to 65535. |
| mask | number |  | The mask as an integer from 0 to 65535. |
| group | number |  | The group as an integer from -32768 to 32767. |

**Returns:**

*No return values*

#### Fixture:setFriction

Sets the friction of the fixture.

Friction determines how shapes react when they 'slide' along other shapes. Low friction indicates a slippery surface, like ice, while high friction indicates a rough surface, like concrete. Range: 0.0 - 1.0.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| friction | number |  | The fixture friction. |

**Returns:**

*No return values*

#### Fixture:setGroupIndex

Sets the group the fixture belongs to. Fixtures with the same group will always collide if the group is positive or never collide if it's negative. The group zero means no group.

The groups range from -32768 to 32767.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| group | number |  | The group as an integer from -32768 to 32767. |

**Returns:**

*No return values*

#### Fixture:setMask

Sets the category mask of the fixture. There can be up to 16 categories represented as a number from 1 to 16.

This fixture will '''NOT''' collide with the fixtures that are in the selected categories if the other fixture also has a category of this fixture selected.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| ... | number |  | The masks. |

**Returns:**

*No return values*

#### Fixture:setRestitution

Sets the restitution of the fixture.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| restitution | number |  | The fixture restitution. |

**Returns:**

*No return values*

#### Fixture:setSensor

Sets whether the fixture should act as a sensor.

Sensors do not cause collision responses, but the begin-contact and end-contact World callbacks will still be called for this fixture.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| sensor | boolean |  | The sensor status. |

**Returns:**

*No return values*

#### Fixture:setUserData

Associates a Lua value with the fixture.

To delete the reference, explicitly pass nil.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| value | any |  | The Lua value to associate with the fixture. |

**Returns:**

*No return values*

#### Fixture:testPoint

Checks if a point is inside the shape of the fixture.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | The x position of the point. |
| y | number |  | The y position of the point. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| isInside | boolean | True if the point is inside or false if it is outside. |

## FrictionJoint

A FrictionJoint applies friction to a body.

**Constructors:** [newFrictionJoint](#lovephysicsnewfrictionjoint)

**Supertypes:** Joint, Object

### Methods

#### FrictionJoint:getMaxForce

Gets the maximum friction force in Newtons.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| force | number | Maximum force in Newtons. |

#### FrictionJoint:getMaxTorque

Gets the maximum friction torque in Newton-meters.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| torque | number | Maximum torque in Newton-meters. |

#### FrictionJoint:setMaxForce

Sets the maximum friction force in Newtons.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| maxForce | number |  | Max force in Newtons. |

**Returns:**

*No return values*

#### FrictionJoint:setMaxTorque

Sets the maximum friction torque in Newton-meters.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| torque | number |  | Maximum torque in Newton-meters. |

**Returns:**

*No return values*

## GearJoint

Keeps bodies together in such a way that they act like gears.

**Constructors:** [newGearJoint](#lovephysicsnewgearjoint)

**Supertypes:** Joint, Object

### Methods

#### GearJoint:getJoints

Get the Joints connected by this GearJoint.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| joint1 | [Joint](#joint) | The first connected Joint. |
| joint2 | [Joint](#joint) | The second connected Joint. |

#### GearJoint:getRatio

Get the ratio of a gear joint.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| ratio | number | The ratio of the joint. |

#### GearJoint:setRatio

Set the ratio of a gear joint.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| ratio | number |  | The new ratio of the joint. |

**Returns:**

*No return values*

## Joint

Attach multiple bodies together to interact in unique ways.

**Supertypes:** Object

### Methods

#### Joint:destroy

Explicitly destroys the Joint. An error will occur if you attempt to use the object after calling this function.

In 0.7.2, when you don't have time to wait for garbage collection, this function 

may be used to free the object immediately.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

#### Joint:getAnchors

Get the anchor points of the joint.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| x1 | number | The x-component of the anchor on Body 1. |
| y1 | number | The y-component of the anchor on Body 1. |
| x2 | number | The x-component of the anchor on Body 2. |
| y2 | number | The y-component of the anchor on Body 2. |

#### Joint:getBodies

Gets the bodies that the Joint is attached to.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| bodyA | [Body](#body) | The first Body. |
| bodyB | [Body](#body) | The second Body. |

#### Joint:getCollideConnected

Gets whether the connected Bodies collide.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| c | boolean | True if they collide, false otherwise. |

#### Joint:getReactionForce

Returns the reaction force in newtons on the second body

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | How long the force applies. Usually the inverse time step or 1/dt. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| x | number | The x-component of the force. |
| y | number | The y-component of the force. |

#### Joint:getReactionTorque

Returns the reaction torque on the second body.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| invdt | number |  | How long the force applies. Usually the inverse time step or 1/dt. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| torque | number | The reaction torque on the second body. |

#### Joint:getType

Gets a string representing the type.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| type | [JointType](#jointtype) | A string with the name of the Joint type. |

#### Joint:getUserData

Returns the Lua value associated with this Joint.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| value | any | The Lua value associated with the Joint. |

#### Joint:isDestroyed

Gets whether the Joint is destroyed. Destroyed joints cannot be used.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| destroyed | boolean | Whether the Joint is destroyed. |

#### Joint:setUserData

Associates a Lua value with the Joint.

To delete the reference, explicitly pass nil.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| value | any |  | The Lua value to associate with the Joint. |

**Returns:**

*No return values*

## MotorJoint

Controls the relative motion between two Bodies. Position and rotation offsets can be specified, as well as the maximum motor force and torque that will be applied to reach the target offsets.

**Constructors:** [newMotorJoint](#lovephysicsnewmotorjoint)

**Supertypes:** Joint, Object

### Methods

#### MotorJoint:getAngularOffset

Gets the target angular offset between the two Bodies the Joint is attached to.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| angleoffset | number | The target angular offset in radians: the second body's angle minus the first body's angle. |

#### MotorJoint:getLinearOffset

Gets the target linear offset between the two Bodies the Joint is attached to.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| x | number | The x component of the target linear offset, relative to the first Body. |
| y | number | The y component of the target linear offset, relative to the first Body. |

#### MotorJoint:setAngularOffset

Sets the target angluar offset between the two Bodies the Joint is attached to.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| angleoffset | number |  | The target angular offset in radians: the second body's angle minus the first body's angle. |

**Returns:**

*No return values*

#### MotorJoint:setLinearOffset

Sets the target linear offset between the two Bodies the Joint is attached to.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | The x component of the target linear offset, relative to the first Body. |
| y | number |  | The y component of the target linear offset, relative to the first Body. |

**Returns:**

*No return values*

## MouseJoint

For controlling objects with the mouse.

**Constructors:** [newMouseJoint](#lovephysicsnewmousejoint)

**Supertypes:** Joint, Object

### Methods

#### MouseJoint:getDampingRatio

Returns the damping ratio.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| ratio | number | The new damping ratio. |

#### MouseJoint:getFrequency

Returns the frequency.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| freq | number | The frequency in hertz. |

#### MouseJoint:getMaxForce

Gets the highest allowed force.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| f | number | The max allowed force. |

#### MouseJoint:getTarget

Gets the target point.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| x | number | The x-component of the target. |
| y | number | The x-component of the target. |

#### MouseJoint:setDampingRatio

Sets a new damping ratio.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| ratio | number |  | The new damping ratio. |

**Returns:**

*No return values*

#### MouseJoint:setFrequency

Sets a new frequency.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| freq | number |  | The new frequency in hertz. |

**Returns:**

*No return values*

#### MouseJoint:setMaxForce

Sets the highest allowed force.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| f | number |  | The max allowed force. |

**Returns:**

*No return values*

#### MouseJoint:setTarget

Sets the target point.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | The x-component of the target. |
| y | number |  | The y-component of the target. |

**Returns:**

*No return values*

## PolygonShape

A PolygonShape is a convex polygon with up to 8 vertices.

**Constructors:** [newPolygonShape](#lovephysicsnewpolygonshape), [newRectangleShape](#lovephysicsnewrectangleshape)

**Supertypes:** Shape, Object

### Methods

#### PolygonShape:getPoints

Get the local coordinates of the polygon's vertices.

This function has a variable number of return values. It can be used in a nested fashion with love.graphics.polygon.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| x1 | number | The x-component of the first vertex. |
| y1 | number | The y-component of the first vertex. |
| x2 | number | The x-component of the second vertex. |
| y2 | number | The y-component of the second vertex. |

## PrismaticJoint

Restricts relative motion between Bodies to one shared axis.

**Constructors:** [newPrismaticJoint](#lovephysicsnewprismaticjoint)

**Supertypes:** Joint, Object

### Methods

#### PrismaticJoint:areLimitsEnabled

Checks whether the limits are enabled.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| enabled | boolean | True if enabled, false otherwise. |

#### PrismaticJoint:getAxis

Gets the world-space axis vector of the Prismatic Joint.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| x | number | The x-axis coordinate of the world-space axis vector. |
| y | number | The y-axis coordinate of the world-space axis vector. |

#### PrismaticJoint:getJointSpeed

Get the current joint angle speed.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| s | number | Joint angle speed in meters/second. |

#### PrismaticJoint:getJointTranslation

Get the current joint translation.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| t | number | Joint translation, usually in meters.. |

#### PrismaticJoint:getLimits

Gets the joint limits.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| lower | number | The lower limit, usually in meters. |
| upper | number | The upper limit, usually in meters. |

#### PrismaticJoint:getLowerLimit

Gets the lower limit.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| lower | number | The lower limit, usually in meters. |

#### PrismaticJoint:getMaxMotorForce

Gets the maximum motor force.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| f | number | The maximum motor force, usually in N. |

#### PrismaticJoint:getMotorForce

Returns the current motor force.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| invdt | number |  | How long the force applies. Usually the inverse time step or 1/dt. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| force | number | The force on the motor in newtons. |

#### PrismaticJoint:getMotorSpeed

Gets the motor speed.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| s | number | The motor speed, usually in meters per second. |

#### PrismaticJoint:getReferenceAngle

Gets the reference angle.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| angle | number | The reference angle in radians. |

#### PrismaticJoint:getUpperLimit

Gets the upper limit.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| upper | number | The upper limit, usually in meters. |

#### PrismaticJoint:isMotorEnabled

Checks whether the motor is enabled.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| enabled | boolean | True if enabled, false if disabled. |

#### PrismaticJoint:setLimits

Sets the limits.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| lower | number |  | The lower limit, usually in meters. |
| upper | number |  | The upper limit, usually in meters. |

**Returns:**

*No return values*

#### PrismaticJoint:setLimitsEnabled

Enables/disables the joint limit.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| enable | boolean | True if enabled, false if disabled. |

#### PrismaticJoint:setLowerLimit

Sets the lower limit.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| lower | number |  | The lower limit, usually in meters. |

**Returns:**

*No return values*

#### PrismaticJoint:setMaxMotorForce

Set the maximum motor force.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| f | number |  | The maximum motor force, usually in N. |

**Returns:**

*No return values*

#### PrismaticJoint:setMotorEnabled

Enables/disables the joint motor.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| enable | boolean |  | True to enable, false to disable. |

**Returns:**

*No return values*

#### PrismaticJoint:setMotorSpeed

Sets the motor speed.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| s | number |  | The motor speed, usually in meters per second. |

**Returns:**

*No return values*

#### PrismaticJoint:setUpperLimit

Sets the upper limit.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| upper | number |  | The upper limit, usually in meters. |

**Returns:**

*No return values*

## PulleyJoint

Allows you to simulate bodies connected through pulleys.

**Constructors:** [newPulleyJoint](#lovephysicsnewpulleyjoint)

**Supertypes:** Joint, Object

### Methods

#### PulleyJoint:getConstant

Get the total length of the rope.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| length | number | The length of the rope in the joint. |

#### PulleyJoint:getGroundAnchors

Get the ground anchor positions in world coordinates.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| a1x | number | The x coordinate of the first anchor. |
| a1y | number | The y coordinate of the first anchor. |
| a2x | number | The x coordinate of the second anchor. |
| a2y | number | The y coordinate of the second anchor. |

#### PulleyJoint:getLengthA

Get the current length of the rope segment attached to the first body.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| length | number | The length of the rope segment. |

#### PulleyJoint:getLengthB

Get the current length of the rope segment attached to the second body.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| length | number | The length of the rope segment. |

#### PulleyJoint:getMaxLengths

Get the maximum lengths of the rope segments.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| len1 | number | The maximum length of the first rope segment. |
| len2 | number | The maximum length of the second rope segment. |

#### PulleyJoint:getRatio

Get the pulley ratio.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| ratio | number | The pulley ratio of the joint. |

#### PulleyJoint:setConstant

Set the total length of the rope.

Setting a new length for the rope updates the maximum length values of the joint.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| length | number |  | The new length of the rope in the joint. |

**Returns:**

*No return values*

#### PulleyJoint:setMaxLengths

Set the maximum lengths of the rope segments.

The physics module also imposes maximum values for the rope segments. If the parameters exceed these values, the maximum values are set instead of the requested values.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| max1 | number |  | The new maximum length of the first segment. |
| max2 | number |  | The new maximum length of the second segment. |

**Returns:**

*No return values*

#### PulleyJoint:setRatio

Set the pulley ratio.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| ratio | number |  | The new pulley ratio of the joint. |

**Returns:**

*No return values*

## RevoluteJoint

Allow two Bodies to revolve around a shared point.

**Constructors:** [newRevoluteJoint](#lovephysicsnewrevolutejoint)

**Supertypes:** Joint, Object

### Methods

#### RevoluteJoint:areLimitsEnabled

Checks whether limits are enabled.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| enabled | boolean | True if enabled, false otherwise. |

#### RevoluteJoint:getJointAngle

Get the current joint angle.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| angle | number | The joint angle in radians. |

#### RevoluteJoint:getJointSpeed

Get the current joint angle speed.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| s | number | Joint angle speed in radians/second. |

#### RevoluteJoint:getLimits

Gets the joint limits.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| lower | number | The lower limit, in radians. |
| upper | number | The upper limit, in radians. |

#### RevoluteJoint:getLowerLimit

Gets the lower limit.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| lower | number | The lower limit, in radians. |

#### RevoluteJoint:getMaxMotorTorque

Gets the maximum motor force.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| f | number | The maximum motor force, in Nm. |

#### RevoluteJoint:getMotorSpeed

Gets the motor speed.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| s | number | The motor speed, radians per second. |

#### RevoluteJoint:getMotorTorque

Get the current motor force.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| f | number | The current motor force, in Nm. |

#### RevoluteJoint:getReferenceAngle

Gets the reference angle.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| angle | number | The reference angle in radians. |

#### RevoluteJoint:getUpperLimit

Gets the upper limit.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| upper | number | The upper limit, in radians. |

#### RevoluteJoint:hasLimitsEnabled

Checks whether limits are enabled.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| enabled | boolean | True if enabled, false otherwise. |

#### RevoluteJoint:isMotorEnabled

Checks whether the motor is enabled.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| enabled | boolean | True if enabled, false if disabled. |

#### RevoluteJoint:setLimits

Sets the limits.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| lower | number |  | The lower limit, in radians. |
| upper | number |  | The upper limit, in radians. |

**Returns:**

*No return values*

#### RevoluteJoint:setLimitsEnabled

Enables/disables the joint limit.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| enable | boolean |  | True to enable, false to disable. |

**Returns:**

*No return values*

#### RevoluteJoint:setLowerLimit

Sets the lower limit.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| lower | number |  | The lower limit, in radians. |

**Returns:**

*No return values*

#### RevoluteJoint:setMaxMotorTorque

Set the maximum motor force.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| f | number |  | The maximum motor force, in Nm. |

**Returns:**

*No return values*

#### RevoluteJoint:setMotorEnabled

Enables/disables the joint motor.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| enable | boolean |  | True to enable, false to disable. |

**Returns:**

*No return values*

#### RevoluteJoint:setMotorSpeed

Sets the motor speed.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| s | number |  | The motor speed, radians per second. |

**Returns:**

*No return values*

#### RevoluteJoint:setUpperLimit

Sets the upper limit.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| upper | number |  | The upper limit, in radians. |

**Returns:**

*No return values*

## RopeJoint

The RopeJoint enforces a maximum distance between two points on two bodies. It has no other effect.

**Constructors:** [newRopeJoint](#lovephysicsnewropejoint)

**Supertypes:** Joint, Object

### Methods

#### RopeJoint:getMaxLength

Gets the maximum length of a RopeJoint.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| maxLength | number | The maximum length of the RopeJoint. |

#### RopeJoint:setMaxLength

Sets the maximum length of a RopeJoint.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| maxLength | number |  | The new maximum length of the RopeJoint. |

**Returns:**

*No return values*

## Shape

Shapes are solid 2d geometrical objects which handle the mass and collision of a Body in love.physics.

Shapes are attached to a Body via a Fixture. The Shape object is copied when this happens. 

The Shape's position is relative to the position of the Body it has been attached to.

**Supertypes:** Object

### Methods

#### Shape:computeAABB

Returns the points of the bounding box for the transformed shape.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| tx | number |  | The translation of the shape on the x-axis. |
| ty | number |  | The translation of the shape on the y-axis. |
| tr | number |  | The shape rotation. |
| childIndex | number | 1 | The index of the child to compute the bounding box of. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| topLeftX | number | The x position of the top-left point. |
| topLeftY | number | The y position of the top-left point. |
| bottomRightX | number | The x position of the bottom-right point. |
| bottomRightY | number | The y position of the bottom-right point. |

#### Shape:computeMass

Computes the mass properties for the shape with the specified density.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| density | number |  | The shape density. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| x | number | The x postition of the center of mass. |
| y | number | The y postition of the center of mass. |
| mass | number | The mass of the shape. |
| inertia | number | The rotational inertia. |

#### Shape:getChildCount

Returns the number of children the shape has.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| count | number | The number of children. |

#### Shape:getRadius

Gets the radius of the shape.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| radius | number | The radius of the shape. |

#### Shape:getType

Gets a string representing the Shape.

This function can be useful for conditional debug drawing.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| type | [ShapeType](#shapetype) | The type of the Shape. |

#### Shape:rayCast

Casts a ray against the shape and returns the surface normal vector and the line position where the ray hit. If the ray missed the shape, nil will be returned. The Shape can be transformed to get it into the desired position.

The ray starts on the first point of the input line and goes towards the second point of the line. The fourth argument is the maximum distance the ray is going to travel as a scale factor of the input line length.

The childIndex parameter is used to specify which child of a parent shape, such as a ChainShape, will be ray casted. For ChainShapes, the index of 1 is the first edge on the chain. Ray casting a parent shape will only test the child specified so if you want to test every shape of the parent, you must loop through all of its children.

The world position of the impact can be calculated by multiplying the line vector with the third return value and adding it to the line starting point.

hitx, hity = x1 + (x2 - x1) * fraction, y1 + (y2 - y1) * fraction

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x1 | number |  | The x position of the input line starting point. |
| y1 | number |  | The y position of the input line starting point. |
| x2 | number |  | The x position of the input line end point. |
| y2 | number |  | The y position of the input line end point. |
| maxFraction | number |  | Ray length parameter. |
| tx | number |  | The translation of the shape on the x-axis. |
| ty | number |  | The translation of the shape on the y-axis. |
| tr | number |  | The shape rotation. |
| childIndex | number | 1 | The index of the child the ray gets cast against. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| xn | number | The x component of the normal vector of the edge where the ray hit the shape. |
| yn | number | The y component of the normal vector of the edge where the ray hit the shape. |
| fraction | number | The position on the input line where the intersection happened as a factor of the line length. |

#### Shape:testPoint

This is particularly useful for mouse interaction with the shapes. By looping through all shapes and testing the mouse position with this function, we can find which shapes the mouse touches.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| tx | number |  | Translates the shape along the x-axis. |
| ty | number |  | Translates the shape along the y-axis. |
| tr | number |  | Rotates the shape. |
| x | number |  | The x-component of the point. |
| y | number |  | The y-component of the point. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| hit | boolean | True if inside, false if outside |

## WeldJoint

A WeldJoint essentially glues two bodies together.

**Constructors:** [newWeldJoint](#lovephysicsnewweldjoint)

**Supertypes:** Joint, Object

### Methods

#### WeldJoint:getDampingRatio

Returns the damping ratio of the joint.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| ratio | number | The damping ratio. |

#### WeldJoint:getFrequency

Returns the frequency.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| freq | number | The frequency in hertz. |

#### WeldJoint:getReferenceAngle

Gets the reference angle.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| angle | number | The reference angle in radians. |

#### WeldJoint:setDampingRatio

Sets a new damping ratio.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| ratio | number |  | The new damping ratio. |

**Returns:**

*No return values*

#### WeldJoint:setFrequency

Sets a new frequency.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| freq | number |  | The new frequency in hertz. |

**Returns:**

*No return values*

## WheelJoint

Restricts a point on the second body to a line on the first body.

**Constructors:** [newWheelJoint](#lovephysicsnewwheeljoint)

**Supertypes:** Joint, Object

### Methods

#### WheelJoint:getAxis

Gets the world-space axis vector of the Wheel Joint.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| x | number | The x-axis coordinate of the world-space axis vector. |
| y | number | The y-axis coordinate of the world-space axis vector. |

#### WheelJoint:getJointSpeed

Returns the current joint translation speed.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| speed | number | The translation speed of the joint in meters per second. |

#### WheelJoint:getJointTranslation

Returns the current joint translation.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| position | number | The translation of the joint in meters. |

#### WheelJoint:getMaxMotorTorque

Returns the maximum motor torque.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| maxTorque | number | The maximum torque of the joint motor in newton meters. |

#### WheelJoint:getMotorSpeed

Returns the speed of the motor.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| speed | number | The speed of the joint motor in radians per second. |

#### WheelJoint:getMotorTorque

Returns the current torque on the motor.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| invdt | number |  | How long the force applies. Usually the inverse time step or 1/dt. |

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| torque | number | The torque on the motor in newton meters. |

#### WheelJoint:getSpringDampingRatio

Returns the damping ratio.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| ratio | number | The damping ratio. |

#### WheelJoint:getSpringFrequency

Returns the spring frequency.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| freq | number | The frequency in hertz. |

#### WheelJoint:isMotorEnabled

Checks if the joint motor is running.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| on | boolean | The status of the joint motor. |

#### WheelJoint:setMaxMotorTorque

Sets a new maximum motor torque.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| maxTorque | number |  | The new maximum torque for the joint motor in newton meters. |

**Returns:**

*No return values*

#### WheelJoint:setMotorEnabled

Starts and stops the joint motor.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| enable | boolean |  | True turns the motor on and false turns it off. |

**Returns:**

*No return values*

#### WheelJoint:setMotorSpeed

Sets a new speed for the motor.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| speed | number |  | The new speed for the joint motor in radians per second. |

**Returns:**

*No return values*

#### WheelJoint:setSpringDampingRatio

Sets a new damping ratio.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| ratio | number |  | The new damping ratio. |

**Returns:**

*No return values*

#### WheelJoint:setSpringFrequency

Sets a new spring frequency.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| freq | number |  | The new frequency in hertz. |

**Returns:**

*No return values*

## World

A world is an object that contains all bodies and joints.

**Constructors:** [newWorld](#lovephysicsnewworld)

**Supertypes:** Object

### Methods

#### World:destroy

Destroys the world, taking all bodies, joints, fixtures and their shapes with it. 

An error will occur if you attempt to use any of the destroyed objects after calling this function.

**Arguments:**

*No arguments*

**Returns:**

*No return values*

#### World:getBodies

Returns a table with all bodies.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| bodies | table | A sequence with all bodies. |

#### World:getBodyCount

Returns the number of bodies in the world.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| n | number | The number of bodies in the world. |

#### World:getCallbacks

Returns functions for the callbacks during the world update.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| beginContact | function | Gets called when two fixtures begin to overlap. |
| endContact | function | Gets called when two fixtures cease to overlap. |
| preSolve | function | Gets called before a collision gets resolved. |
| postSolve | function | Gets called after the collision has been resolved. |

#### World:getContactCount

Returns the number of contacts in the world.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| n | number | The number of contacts in the world. |

#### World:getContactFilter

Returns the function for collision filtering.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| contactFilter | function | The function that handles the contact filtering. |

#### World:getContacts

Returns a table with all Contacts.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| contacts | table | A sequence with all Contacts. |

#### World:getGravity

Get the gravity of the world.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| x | number | The x component of gravity. |
| y | number | The y component of gravity. |

#### World:getJointCount

Returns the number of joints in the world.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| n | number | The number of joints in the world. |

#### World:getJoints

Returns a table with all joints.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| joints | table | A sequence with all joints. |

#### World:isDestroyed

Gets whether the World is destroyed. Destroyed worlds cannot be used.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| destroyed | boolean | Whether the World is destroyed. |

#### World:isLocked

Returns if the world is updating its state.

This will return true inside the callbacks from World:setCallbacks.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| locked | boolean | Will be true if the world is in the process of updating its state. |

#### World:isSleepingAllowed

Gets the sleep behaviour of the world.

**Arguments:**

*No arguments*

**Returns:**

| Name | Type | Description |
| --- | --- | --- |
| allow | boolean | True if bodies in the world are allowed to sleep, or false if not. |

#### World:queryBoundingBox

Calls a function for each fixture inside the specified area by searching for any overlapping bounding box (Fixture:getBoundingBox).

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| topLeftX | number |  | The x position of the top-left point. |
| topLeftY | number |  | The y position of the top-left point. |
| bottomRightX | number |  | The x position of the bottom-right point. |
| bottomRightY | number |  | The y position of the bottom-right point. |
| callback | function |  | This function gets passed one argument, the fixture, and should return a boolean. The search will continue if it is true or stop if it is false. |

**Returns:**

*No return values*

#### World:rayCast

Casts a ray and calls a function for each fixtures it intersects. 

There is a bug in LÖVE 0.8.0 where the normal vector passed to the callback function gets scaled by love.physics.getMeter.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x1 | number |  | The x position of the starting point of the ray. |
| y1 | number |  | The x position of the starting point of the ray. |
| x2 | number |  | The x position of the end point of the ray. |
| y2 | number |  | The x value of the surface normal vector of the shape edge. |
| callback | function |  | A function called for each fixture intersected by the ray. The function gets six arguments and should return a number as a control value. The intersection points fed into the function will be in an arbitrary order. If you wish to find the closest point of intersection, you'll need to do that yourself within the function. The easiest way to do that is by using the fraction value. |

**Returns:**

*No return values*

#### World:setCallbacks

Sets functions for the collision callbacks during the world update.

Four Lua functions can be given as arguments. The value nil removes a function.

When called, each function will be passed three arguments. The first two arguments are the colliding fixtures and the third argument is the Contact between them. The postSolve callback additionally gets the normal and tangent impulse for each contact point. See notes.

If you are interested to know when exactly each callback is called, consult a Box2d manual

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| beginContact | function |  | Gets called when two fixtures begin to overlap. |
| endContact | function |  | Gets called when two fixtures cease to overlap. This will also be called outside of a world update, when colliding objects are destroyed. |
| preSolve | function | nil | Gets called before a collision gets resolved. |
| postSolve | function | nil | Gets called after the collision has been resolved. |

**Returns:**

*No return values*

#### World:setContactFilter

Sets a function for collision filtering.

If the group and category filtering doesn't generate a collision decision, this function gets called with the two fixtures as arguments. The function should return a boolean value where true means the fixtures will collide and false means they will pass through each other.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| filter | function |  | The function handling the contact filtering. |

**Returns:**

*No return values*

#### World:setGravity

Set the gravity of the world.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | The x component of gravity. |
| y | number |  | The y component of gravity. |

**Returns:**

*No return values*

#### World:setSleepingAllowed

Sets the sleep behaviour of the world.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| allow | boolean |  | True if bodies in the world are allowed to sleep, or false if not. |

**Returns:**

*No return values*

#### World:translateOrigin

Translates the World's origin. Useful in large worlds where floating point precision issues become noticeable at far distances from the origin.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| x | number |  | The x component of the new origin with respect to the old origin. |
| y | number |  | The y component of the new origin with respect to the old origin. |

**Returns:**

*No return values*

#### World:update

Update the state of the world.

**Arguments:**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| dt | number |  | The time (in seconds) to advance the physics simulation. |
| velocityiterations | number | 8 | The maximum number of steps used to determine the new velocities when resolving a collision. |
| positioniterations | number | 3 | The maximum number of steps used to determine the new positions when resolving a collision. |

**Returns:**

*No return values*

## Enums

## BodyType

The types of a Body. 

**Constants:**

| Name | Description |
| --- | --- |
| `static` | Static bodies do not move. |
| `dynamic` | Dynamic bodies collide with all bodies. |
| `kinematic` | Kinematic bodies only collide with dynamic bodies. |

## JointType

Different types of joints.

**Constants:**

| Name | Description |
| --- | --- |
| `distance` | A DistanceJoint. |
| `friction` | A FrictionJoint. |
| `gear` | A GearJoint. |
| `mouse` | A MouseJoint. |
| `prismatic` | A PrismaticJoint. |
| `pulley` | A PulleyJoint. |
| `revolute` | A RevoluteJoint. |
| `rope` | A RopeJoint. |
| `weld` | A WeldJoint. |

## ShapeType

The different types of Shapes, as returned by Shape:getType.

**Constants:**

| Name | Description |
| --- | --- |
| `circle` | The Shape is a CircleShape. |
| `polygon` | The Shape is a PolygonShape. |
| `edge` | The Shape is a EdgeShape. |
| `chain` | The Shape is a ChainShape. |

