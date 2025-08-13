extends Node2D

var ui_offset_x: int = -180

func _process(delta):
	if get_window().size_changed:
		position.x = get_window().size.x + ui_offset_x
