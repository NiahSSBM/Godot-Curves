extends Node2D

var point_res = preload("res://scenes/point_set.tscn")
var base_window_size = Vector2(1152, 648)

func _ready():
	var vec2_size_ratio = (get_viewport().size) as Vector2 / base_window_size
	Globals.global_scale = (vec2_size_ratio.x + vec2_size_ratio.y) / 2

func add_point():
	var new_point = point_res.instantiate()
	add_child(new_point)
	get_node("Curve").update_points()

func remove_point():
	var points: Array[Node] = get_tree().get_nodes_in_group("points")
	
	if points.size() != 0:
		points[points.size() - 1].free()
		get_node("Curve").update_points()
