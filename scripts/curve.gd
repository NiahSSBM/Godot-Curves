extends Path2D

var points: Array[Node]

func _ready():
	points = get_tree().get_nodes_in_group("points")
	
	for point in points:
		var in_point = point.get_node("in")
		var out_point = point.get_node("out")
		var main_point = point.get_node("point")
		curve.add_point(main_point.position, in_point.position, out_point.position)

func _process(delta):
	var i: int = 0
	for point in points:
		var in_point = point.get_node("in")
		var out_point = point.get_node("out")
		var main_point = point.get_node("point")
		curve.set_point_in(i, in_point.position)
		curve.set_point_out(i, out_point.position)
		curve.set_point_position(i, main_point.position)
		i += 1
