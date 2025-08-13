extends Line2D

func _process(delta):
	points = get_parent().curve.get_baked_points()
	width = ceil(3 * Globals.global_scale)
	default_color = Color("ae3c24")
