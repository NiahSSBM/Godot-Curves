extends Node2D

var point_res = preload("res://scenes/point_set.tscn")

func _ready():
	pass

func add_point():
	var new_point = point_res.instantiate()
	add_child(new_point)
	get_node("Curve").update_points()

func remove_point():
	var points: Array[Node] = get_tree().get_nodes_in_group("points")
	
	if points.size() != 0:
		points[points.size() - 1].free()
		get_node("Curve").update_points()
