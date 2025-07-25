extends Path2D

var points: Array[Node]

func _ready():
	pass

func update_points():
	points = get_tree().get_nodes_in_group("points")
	Globals.total_points = points.size()
	
	curve.clear_points()
	
	var i: int = 0
	for point in points:
		var main_point = point.get_node("point")
		var in_point = point.get_node_or_null("in")
		var out_point = point.get_node_or_null("out")
		
		if in_point == null:
			in_point = Node2D.new()
			in_point.position = Vector2.ZERO
		if out_point == null:
			out_point = Node2D.new()
			out_point.position = Vector2.ZERO
		
		curve.add_point(main_point.position, in_point.position - main_point.position, out_point.position - main_point.position)
		
		point.point_number = i + 1
		point.update_points()
		
		i += 1

func _process(delta):
	var i: int = 0
	for point in points:
		var in_point = point.get_node_or_null("in")
		var out_point = point.get_node_or_null("out")
		var main_point = point.get_node("point")
		if in_point != null:
			curve.set_point_in(i, in_point.position - main_point.position)
		if out_point != null:
			curve.set_point_out(i, out_point.position - main_point.position)
		curve.set_point_position(i, main_point.position)
		i += 1
