extends Line2D

var target_point: Node2D

func _ready():
	width = ceil(2 * Globals.global_scale)
	default_color = Color(Color.BLUE, 0.5)
	
	target_point = get_node("../../point")

func _process(delta):
	clear_points()
	add_point(position)
	add_point(target_point.global_position - get_parent().global_position)
