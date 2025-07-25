extends Node

var point_number: int

var point_tscn = preload("res://scenes/point.tscn")

func update_points():
	var main_point = get_node("point")
	var in_point = get_node_or_null("in")
	var out_point = get_node_or_null("out")
	
	if out_point == null and point_number + 1 == Globals.total_points:
		out_point = point_tscn.instantiate()
		out_point.name = "out"
		add_child(out_point)
	
	main_point.update_point()
	if in_point != null:
		in_point.update_point()
	if out_point != null:
		out_point.update_point()
