extends Node

var _key = 'save_encryption_key'
var _save_id: int = 1
var _default_values: Dictionary = {
	_DATE_KEY: "-"
}

var _data : Dictionary= {}

const _USERFOLDER: String = "user://"
const _SAVEFOLDER: String = "savedata"
const _SAVEDIR: String = _USERFOLDER + _SAVEFOLDER
const _SAVE_NAME_TEMPLATE: String = "save_%03d.save"
const _DATE_KEY: String = "LAST_WRITE_DATE_TIME"


func _init():
	_load_data()

func _load_data() -> void:
	var save_path = _SAVEDIR.plus_file(_SAVE_NAME_TEMPLATE % _save_id)
	var file: File = File.new()
	if not file.file_exists(save_path):
		_init_new_save_file(save_path)
	var error = file.open_encrypted_with_pass(save_path, File.READ, _key)
	_data = file.get_var()
	assert(error == 0, "Save file encryption key invalid.")
	file.close()

func _init_new_save_file(save_path: String) -> void:
	var directory = Directory.new()
	directory.make_dir(_SAVEDIR)
	var save_game = File.new()
	save_game.open_encrypted_with_pass(save_path, File.WRITE, _key)
	_default_values[_DATE_KEY] = Time.get_datetime_string_from_system()
	save_game.store_var(_default_values)
	save_game.close()

func _update_save_file() -> void:
	var save_path = _SAVEDIR.plus_file(_SAVE_NAME_TEMPLATE % _save_id)
	var save_game = File.new()
	if not save_game.file_exists(save_path):
		_init_new_save_file(save_path)
	var error = save_game.open_encrypted_with_pass(save_path, File.WRITE, _key)
	assert(error == 0, "Save file encryption key invalid.")
	save_game.store_var(_data)
	save_game.close()

func _unload() -> void:
	_data = {}
	_save_id = 1

func _delete_save(id: int) -> void:
	var save_path = _SAVEDIR.plus_file(_SAVE_NAME_TEMPLATE % id)
	var directory = Directory.new()
	directory.remove(save_path)
	_unload()



func delete(slot: int) -> void:
	_delete_save(slot)

func load_save(slot: int) -> void:
	_save_id = slot
	_load_data()

func save_value(my_key: String, value) -> void:
	_data[my_key] = value
	_data[_DATE_KEY] = Time.get_datetime_string_from_system()
	_update_save_file()

func load_value(my_key: String):
	if _data.has(my_key):
		var loaded_value = _data[my_key]
		if loaded_value == null:
			return null
		return loaded_value
	else:
		return null

func get_last_write_date(save_slot: int) -> String:
	_save_id = save_slot
	_load_data()
	var date_and_time: String = load_value(_DATE_KEY)
	_unload()
	return date_and_time
