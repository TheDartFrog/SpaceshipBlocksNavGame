extends SubViewportContainer

var dead: bool = false

func _process(delta: float) -> void:
	if !dead:
		return
	material.set_shader_parameter("curvature", lerp(material.get_shader_parameter("curvature"), 0.0, (delta * 100)))
