# math_lib.gd
# 2D/3D Math Library for Game Engine (Wolfman, Alpha, etc.)
# Provides vector, matrix, quaternion, and utility functions

extends Node
class_name MathLib

# 2D Vector
static func vec2(x: float, y: float) -> Vector2:
    return Vector2(x, y)

static func vec2_add(a: Vector2, b: Vector2) -> Vector2:
    return a + b

static func vec2_sub(a: Vector2, b: Vector2) -> Vector2:
    return a - b

static func vec2_dot(a: Vector2, b: Vector2) -> float:
    return a.dot(b)

static func vec2_length(a: Vector2) -> float:
    return a.length()

static func vec2_normalized(a: Vector2) -> Vector2:
    return a.normalized()

# 3D Vector
static func vec3(x: float, y: float, z: float) -> Vector3:
    return Vector3(x, y, z)

static func vec3_add(a: Vector3, b: Vector3) -> Vector3:
    return a + b

static func vec3_sub(a: Vector3, b: Vector3) -> Vector3:
    return a - b

static func vec3_dot(a: Vector3, b: Vector3) -> float:
    return a.dot(b)

static func vec3_cross(a: Vector3, b: Vector3) -> Vector3:
    return a.cross(b)

static func vec3_length(a: Vector3) -> float:
    return a.length()

static func vec3_normalized(a: Vector3) -> Vector3:
    return a.normalized()

# Quaternion
static func quat(x: float, y: float, z: float, w: float) -> Quaternion:
    return Quaternion(x, y, z, w)

static func quat_mul(a: Quaternion, b: Quaternion) -> Quaternion:
    return a * b

static func quat_slerp(a: Quaternion, b: Quaternion, t: float) -> Quaternion:
    return a.slerp(b, t)

# Matrix (3x3)
static func mat3_identity() -> Basis:
    return Basis()

static func mat3_mul(a: Basis, b: Basis) -> Basis:
    return a * b

# Utility
static func clampf(val: float, minv: float, maxv: float) -> float:
    return clamp(val, minv, maxv)

static func lerpf(a: float, b: float, t: float) -> float:
    return lerp(a, b, t)

static func deg2radf(deg: float) -> float:
    return deg2rad(deg)

static func rad2degf(rad: float) -> float:
    return rad2deg(rad)
