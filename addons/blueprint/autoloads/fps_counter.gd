extends Control

var _enabled = false
var _label: Label


func _ready() -> void:
	_enabled = ProjectSettings.get_setting(Blueprint.FPS_COUNTER_SETTING)
	if _enabled:
		_create_fps_label()


func _process(_delta: float) -> void:
	_update_fps()


func toggle(value: bool) -> void:
	print(value)
	if value:
		_create_fps_label()
	else:
		_label.queue_free()
	_enabled = value


func _create_fps_label() -> void:
	_label = Label.new()
	_label.set_anchors_preset(Control.LayoutPreset.PRESET_TOP_LEFT)
	_label.size = Vector2(160, 32)
	_label.position = Vector2(8, 8)
	_label.text = "0 FPS"
	add_child(_label)


func _update_fps() -> void:
	if _enabled:
		var fps := Engine.get_frames_per_second()
		var text := "%.1f FPS" % fps
		_label.text = text
