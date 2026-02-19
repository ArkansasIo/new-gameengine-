# math_lib_advanced.gd
# Advanced 2D/3D Math Library for Game Engine
# Includes: vectors, matrices, quaternions, transforms, noise, interpolation, collision, and more

extends Node
class_name MathLibAdvanced

# --- 2D Vector ---
static func vec2_angle(a: Vector2, b: Vector2) -> float:
    return a.angle_to(b)

static func vec2_distance(a: Vector2, b: Vector2) -> float:
    return a.distance_to(b)

static func vec2_reflect(a: Vector2, normal: Vector2) -> Vector2:
    return a.bounce(normal)

static func vec2_project(a: Vector2, b: Vector2) -> Vector2:
    return b * (a.dot(b) / b.length_squared())

# --- 3D Vector ---
static func vec3_angle(a: Vector3, b: Vector3) -> float:
    return a.angle_to(b)

static func vec3_distance(a: Vector3, b: Vector3) -> float:
    return a.distance_to(b)

static func vec3_reflect(a: Vector3, normal: Vector3) -> Vector3:
    return a.bounce(normal)

static func vec3_project(a: Vector3, b: Vector3) -> Vector3:
    return b * (a.dot(b) / b.length_squared())

# --- Quaternion ---
static func quat_from_axis_angle(axis: Vector3, angle: float) -> Quaternion:
    return Quaternion(axis, angle)

static func quat_to_euler(q: Quaternion) -> Vector3:
    return q.get_euler()

static func quat_from_euler(euler: Vector3) -> Quaternion:
    return Quaternion().set_euler(euler)

# --- Matrix/Transform ---
static func mat4_identity() -> Transform3D:
    return Transform3D()

static func mat4_mul(a: Transform3D, b: Transform3D) -> Transform3D:
    return a * b

static func mat4_translate(mat: Transform3D, v: Vector3) -> Transform3D:
    var t = mat
    t.origin += v
    return t

static func mat4_scale(mat: Transform3D, s: Vector3) -> Transform3D:
    var t = mat
    t.basis.scale(s)
    return t

# --- Noise ---
static func perlin_noise_2d(x: float, y: float, seed: int = 0) -> float:
    var noise = OpenSimplexNoise.new()
    noise.seed = seed
    return noise.get_noise_2d(x, y)

static func perlin_noise_3d(x: float, y: float, z: float, seed: int = 0) -> float:
    var noise = OpenSimplexNoise.new()
    noise.seed = seed
    return noise.get_noise_3d(x, y, z)

# --- Interpolation ---
static func smoothstep(edge0: float, edge1: float, x: float) -> float:
    var t = clamp((x - edge0) / (edge1 - edge0), 0.0, 1.0)
    return t * t * (3.0 - 2.0 * t)

static func catmull_rom(p0: float, p1: float, p2: float, p3: float, t: float) -> float:
    return 0.5 * ((2 * p1) + (-p0 + p2) * t + (2*p0 - 5*p1 + 4*p2 - p3) * t * t + (-p0 + 3*p1 - 3*p2 + p3) * t * t * t)

# --- Collision ---
static func aabb_intersects(a: AABB, b: AABB) -> bool:
    return a.intersects(b)

static func point_in_aabb(point: Vector3, aabb: AABB) -> bool:
    return aabb.has_point(point)

static func circle_intersects(a: Vector2, r1: float, b: Vector2, r2: float) -> bool:
    return a.distance_to(b) <= (r1 + r2)

# --- Utility ---
static func signf(val: float) -> int:
    return sign(val)

static func minf(a: float, b: float) -> float:
    return min(a, b)

static func maxf(a: float, b: float) -> float:
    return max(a, b)
