extends Line2D

var node_points: Array[Node]

func _ready():
	node_points = get_tree().get_nodes_in_group("points")
	for node_point in node_points:
		if node_point.is_inside_tree():
			print("Found " + str(self) + " in tree \n" + str(node_point.get_tree_string_pretty()))

func _process(delta):
	points.clear()
	
