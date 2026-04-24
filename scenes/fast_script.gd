extends SubViewportContainer

var dead: bool = false

func _process(delta: float) -> void:
	if !dead:
		return
	material.set_shader_parameter("curvature", lerp(material.get_shader_parameter("curvature"), 0.0, (delta * 100)))
	if material.get_shader_parameter("curvature") <= 0.0:
		var wait_timer = Timer.new()
		add_child(wait_timer)
		wait_timer.start(2.0)
		await wait_timer.timeout
		reload_game()
		
func reload_game():
	get_tree().reload_current_scene()
	material.set_shader_parameter("curvature", 6.0)
