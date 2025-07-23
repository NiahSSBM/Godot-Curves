extends Node2D

var is_grabbed: bool = false

func _on_area_2d_input_event(viewport, event, shape_idx):
	if not Globals.is_point_grabbed:
		is_grabbed = Input.is_action_pressed("left_click")
		Globals.is_point_grabbed = is_grabbed
	elif event.is_action_released("left_click"):
		Globals.is_point_grabbed = false

func _process(delta):
	if is_grabbed:
		position = get_viewport().get_mouse_position()
