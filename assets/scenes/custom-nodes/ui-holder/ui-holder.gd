extends Control


func _ready() -> void:
	EventManager.add_ui.connect(add)
	EventManager.remove_ui.connect(remove)


func add(ui_item: Control, layer: Enums.UILayers) -> void:
	add_child(ui_item)
	ui_item.z_index = layer


func remove(ui_item: Control) -> void:
	remove_child(ui_item)
	ui_item.queue_free()
