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


func _delete_save_data(id: int) -> void:
	var save_path: String = _get_save_path(id)
	var directory := DirAccess.open(_USERFOLDER)
	directory.remove(save_path)


func _unload_and_reset() -> void:
	_data = {}
	_save_id = 1


## Deletes a save slot based on its slot number. If the deleted save is currently in the active save slot, it will clear the currently loaded data. Call load_save to load a save file again.
func delete_save(slot: int) -> void:
	_delete_save_data(slot)
	if slot == _save_id:
		_unload_and_reset()


## Loads a save file into the active save slot. Takes in a save slot number. If the save file does not exist it will be created.
func load_save(slot: int) -> void:
	_save_id = slot
	_load_save_data()


## Saves a value to the currently loaded save file based on a unique string key,
func save_value(my_key: String, value: Variant) -> void:
	if value == null:
		return
	_data[my_key] = value
	_data[_DATE_KEY] = Time.get_datetime_string_from_system()
	_update_save_file()


## Gets a value from the currently loaded save file based on a unique string key.
## Optionally, provide a default return value as the second parameter to assist with typed returns. Will return null by default.
func load_value(my_key: String, default_value: Variant = null) -> Variant:
	if _data.has(my_key):
		var loaded_value: Variant = _data[my_key]
		if loaded_value == null:
			return default_value
		return loaded_value
	else:
		return default_value


## Gets the last date and time the current loaded save file was written to in the format (YYYY-MM-DDTHH:MM:SS).
func get_last_write_date() -> String:
	var date_and_time: String = load_value(_DATE_KEY, "")
	return date_and_time
