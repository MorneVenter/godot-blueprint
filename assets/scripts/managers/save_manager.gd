extends Node

var _key := "save_encryption_key"
var _save_id: int = 1
var _default_values: Dictionary = {_DATE_KEY: "-"}

var _data: Dictionary = {}

const _USERFOLDER: String = "user://"
const _SAVEFOLDER: String = "savedata"
const _SAVE_NAME_TEMPLATE: String = "save_%03d.save"
const _DATE_KEY: String = "LAST_WRITE_DATE_TIME"


func _init() -> void:
	_load_save_data()


func _get_save_path(id: int = _save_id) -> String:
	var save_path: String = _USERFOLDER + _SAVEFOLDER.path_join(_SAVE_NAME_TEMPLATE % id)
	return save_path


func _create_save_if_not_exists(path: String) -> void:
	if not FileAccess.file_exists(path):
		_init_new_save_file(path)


func _init_new_save_file(path: String) -> void:
	var directory := DirAccess.open(_USERFOLDER)
	directory.make_dir_recursive(_SAVEFOLDER)
	var save_game: FileAccess = FileAccess.open_encrypted_with_pass(path, FileAccess.WRITE, _key)
	save_game.store_var(_default_values)


func _load_save_data() -> void:
	var save_path: String = _get_save_path()
	_create_save_if_not_exists(save_path)
	var file: FileAccess = FileAccess.open_encrypted_with_pass(save_path, FileAccess.READ, _key)
	assert(file != null, "Save file encryption key invalid.")
	_data = file.get_var()


func _update_save_file() -> void:
	var save_path: String = _get_save_path()
	_create_save_if_not_exists(save_path)
	var save_game: FileAccess = FileAccess.open_encrypted_with_pass(
		save_path, FileAccess.WRITE, _key
	)
	assert(save_game != null, "Save file encryption key invalid.")
	save_game.store_var(_data)


func _delete_save(id: int) -> void:
	var save_path: String = _get_save_path(id)
	var directory := DirAccess.open(_USERFOLDER)
	directory.remove(save_path)


func _unload_and_reset() -> void:
	_data = {}
	_save_id = 1


func delete(slot: int) -> void:
	_delete_save(slot)
	_unload_and_reset()


func load_save(slot: int) -> void:
	_save_id = slot
	_load_save_data()


func save_value(my_key: String, value: Variant) -> void:
	if value == null:
		return
	_data[my_key] = value
	_data[_DATE_KEY] = Time.get_datetime_string_from_system()
	_update_save_file()


func load_value(my_key: String) -> Variant:
	if _data.has(my_key):
		var loaded_value: Variant = _data[my_key]
		if loaded_value == null:
			return null
		return loaded_value
	else:
		return null


func get_last_write_date() -> String:
	var date_and_time: String = load_value(_DATE_KEY)
	return date_and_time
