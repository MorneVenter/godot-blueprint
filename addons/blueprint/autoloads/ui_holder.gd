extends Control

enum UILayers { WORLD_BACKGROUND = 0, WORLD_FOREGROUND = 1, HUD = 2, MENU = 3, MENU_OVERLAY = 4 }

var _ui_layers: Array[Control] = []


func _ready() -> void:
	anchors_preset = PRESET_FULL_RECT
	var total_layers := UILayers.keys().size()
	for index in range(0, total_layers):
		var new_control: Control = Control.new()
		new_control.set_anchors_preset(PRESET_FULL_RECT)
		new_control.z_index = index
		add_child(new_control)
		_ui_layers.append(new_control)


func add(ui_item: Control, layer: UILayers) -> void:
	var layer_to_add_to: Control = _ui_layers[layer]
	layer_to_add_to.add_child(ui_item)


func remove(ui_item: Control) -> void:
	ui_item.queue_free()


func unparent(ui_item: Control, layer: UILayers) -> void:
	var layer_to_unparent_from: Control = _ui_layers[layer]
	layer_to_unparent_from.remove_child(ui_item)


func toggle_visible(layer: UILayers, value: bool) -> void:
	var layer_to_toggle := _ui_layers[layer]
	layer_to_toggle.visible = value