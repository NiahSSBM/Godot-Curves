extends Line2D

func _process(delta):
	points = get_parent().curve.get_baked_points()
	width = 3
	default_color = Color("ae3c24")
