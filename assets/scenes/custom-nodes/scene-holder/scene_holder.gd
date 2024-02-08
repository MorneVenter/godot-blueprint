@tool
extends SubViewportContainer
class_name SceneHolder

const ORDER_ERROR := "A Scene3D node should not be placed lower in the node tree than a Scene2D."
const NOT_FOUND_ERROR := "This node doesn't have a Scene2D or Scene3D as a child. Add the required nodes or things will get weird."

func _get_configuration_warnings() -> PackedStringArray:
	var children := get_children()
	var has_scene_3d := false
	var has_scene_2d := false
	for child in children:
		if child is Scene3D:
			has_scene_3d = true
			if has_scene_2d:
				return [ORDER_ERROR]
		elif child is Scene2D:
			has_scene_2d = true
			if has_scene_3d and not has_scene_3d:
				return [ORDER_ERROR]
	if not has_scene_2d and not has_scene_3d:
		return [NOT_FOUND_ERROR]
	return []

