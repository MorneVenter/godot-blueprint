@tool
extends EditorPlugin
class_name Blueprint

const SAVE_MANAGER_SINGLETON_NAME = "SaveManager"
const UI_HOLDER_SINGLETON_NAME = "UIHolder"
const ENCRYPTION_KEY_SETTING = "blueprint/save_manager/saves/save_encryption_key"


func _enter_tree() -> void:
	_create_settings()


func _create_settings() -> void:
	var has_setting := ProjectSettings.has_setting(ENCRYPTION_KEY_SETTING)
	if has_setting:
		return
	ProjectSettings.set(ENCRYPTION_KEY_SETTING, "save_encryption_key")
	var property_info: Dictionary = {
		"name": ENCRYPTION_KEY_SETTING,
		"type": TYPE_STRING,
		"hint": PROPERTY_HINT_NONE,
		"hint_string": "String"
	}
	ProjectSettings.add_property_info(property_info)
	ProjectSettings.save()


func _enable_plugin():
	add_autoload_singleton(
		SAVE_MANAGER_SINGLETON_NAME, "res://addons/blueprint/managers/save_manager.gd"
	)
	add_autoload_singleton(UI_HOLDER_SINGLETON_NAME, "res://addons/blueprint/managers/ui_holder.gd")


func _disable_plugin():
	remove_autoload_singleton(SAVE_MANAGER_SINGLETON_NAME)
	remove_autoload_singleton(UI_HOLDER_SINGLETON_NAME)
