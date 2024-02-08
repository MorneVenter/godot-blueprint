@tool
extends SubViewport
class_name Scene3D

const BAD_PARENT_ERROR := "This nodes needs to be a child of a SceneHolder node."

func _get_configuration_warnings() -> PackedStringArray:
	var parent := get_parent()
	if not parent is SceneHolder:
		return [BAD_PARENT_ERROR]
	return []
