class_name RotationHelper
extends Node


## Lerps a Vector3 rotation (in rads).
static func lerp_rotation(from: Vector3, to: Vector3, lerp_amount: float) -> Vector3:
	var lerped_x := lerp_angle(from.x, to.x, lerp_amount)
	var lerped_y := lerp_angle(from.y, to.y, lerp_amount)
	var lerped_z := lerp_angle(from.z, to.z, lerp_amount)
	var new_rotation := Vector3(lerped_x, lerped_y, lerped_z)
	return new_rotation
