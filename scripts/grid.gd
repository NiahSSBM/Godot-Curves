extends Node

var grid_spacing: float = 75
var line_width = 4
var color = Color.DIM_GRAY

var slider: HSlider

func _ready():
	slider = get_node("../UI/gridSlider")
	
	update_grid()

func update_grid():
	for node in get_children():
		node.free()
	
	var total_x_lines = get_viewport().size.x / grid_spacing
	var total_y_lines = get_viewport().size.y / grid_spacing
	
	for i in total_x_lines:
		var line = Line2D.new()
		line.width = line_width
		line.default_color = color
		line.add_point(Vector2(i * grid_spacing, 0))
		line.add_point(Vector2(i * grid_spacing, get_viewport().size.y))
		line.z_index = -1
		add_child(line)

	for i in total_y_lines:
		var line = Line2D.new()
		line.width = line_width
		line.default_color = color
		line.add_point(Vector2(0, i * grid_spacing))
		line.add_point(Vector2(get_viewport().size.x, i * grid_spacing))
		line.z_index = -1
		add_child(line)

func _process(delta):
	if slider.value_changed:
		grid_spacing = slider.value
		update_grid()
