@tool
class_name Blueprint
extends EditorPlugin

const SAVE_MANAGER_SINGLETON_NAME = "SaveManager"
const UI_HOLDER_SINGLETON_NAME = "UIHolder"
const FPS_COUNTER_SINGLETON_NAME = "FPSCounter"

const ENCRYPTION_KEY_SETTING = "blueprint/save_manager/saves/save_encryption_key"
const FPS_COUNTER_SETTING = "blueprint/debug/performance/show_fps_counter"


func _enter_tree() -> void:
	_create_settings(
		ENCRYPTION_KEY_SETTING,
		"save_encryption_key",
		{
			"name": ENCRYPTION_KEY_SETTING,
			"type": TYPE_STRING,
			"hint": PROPERTY_HINT_NONE,
			"hint_string": "String"
		}
	)
	_create_settings(
		FPS_COUNTER_SETTING,
		false,
		{"name": FPS_COUNTER_SETTING, "type": TYPE_BOOL, "hint": PROPERTY_HINT_NONE}
	)


func _exit_tree() -> void:
	ProjectSettings.set(ENCRYPTION_KEY_SETTING, null)
	ProjectSettings.set(FPS_COUNTER_SETTING, null)


func _create_settings(name: String, default: Variant, property_info: Dictionary) -> void:
	var has_setting := ProjectSettings.has_setting(name)
	if has_setting:
		return
	ProjectSettings.set(name, default)
	ProjectSettings.add_property_info(property_info)
	ProjectSettings.save()


func _enable_plugin():
	add_autoload_singleton(
		SAVE_MANAGER_SINGLETON_NAME, "res://addons/blueprint/autoloads/save_manager.gd"
	)
	add_autoload_singleton(
		UI_HOLDER_SINGLETON_NAME, "res://addons/blueprint/autoloads/ui_holder.gd"
	)
	add_autoload_singleton(
		FPS_COUNTER_SINGLETON_NAME, "res://addons/blueprint/autoloads/fps_counter.gd"
	)
