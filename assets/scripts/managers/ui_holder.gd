extends Control


func _ready() -> void:
	anchors_preset = PRESET_FULL_RECT


func add(ui_item: Control, layer: Enums.UILayers) -> void:
	add_child(ui_item)
	ui_item.z_index = layer


func remove(ui_item: Control) -> void:
	remove_child(ui_item)
	ui_item.queue_free()
