extends Control

enum UILayers { WORLD_BACKGROUND = 0, WORLD_FOREGROUND = 1, MENU = 2, MENU_OVERLAY = 3 }


func _ready() -> void:
	anchors_preset = PRESET_FULL_RECT


func add(ui_item: Control, layer: UILayers) -> void:
	add_child(ui_item)
	ui_item.z_index = layer


func remove(ui_item: Control) -> void:
	remove_child(ui_item)
	ui_item.queue_free()
