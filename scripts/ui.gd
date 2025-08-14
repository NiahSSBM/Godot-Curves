extends Node2D

var ui_offset_x: int

func _process(delta):
	if get_window().size_changed:
		position.x = get_window().size.x + ui_offset_x

func _on_main_ready():
	ui_offset_x = -180 * Globals.global_scale
	scale *= Globals.global_scale
