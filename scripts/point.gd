extends Node2D

var is_grabbed: bool = false
var circle_radius: float = ceil(10 * Globals.global_scale)
var point_color: Color

func _ready():
	if name == "point":
		point_color = Globals.red_color
	else:
		point_color = Globals.black_color
	
	randomize_spawn()

func _draw():
	draw_circle(Vector2.ZERO, circle_radius, point_color, true, -1.0, true)

func randomize_spawn():
	position.x = randi_range(get_viewport().size.x * 0.1, get_viewport().size.x * 0.9)
	position.y = randi_range(get_viewport().size.y * 0.1, get_viewport().size.y * 0.9)

func update_point():
	var label: Label = get_node("Label")
	label.text = name + " " + str(get_parent().point_number)
	label.z_index = 10
	
	if (name == "in" and get_parent().point_number == 1) or (name == "out" and get_parent().point_number == Globals.total_points):
		queue_free()

func _on_area_2d_input_event(viewport, event, shape_idx):
	if not Globals.is_point_grabbed:
		is_grabbed = Input.is_action_pressed("left_click")
		Globals.is_point_grabbed = is_grabbed
	elif event.is_action_released("left_click"):
		Globals.is_point_grabbed = false

func _process(delta):
	if is_grabbed:
		position = get_viewport().get_mouse_position()
