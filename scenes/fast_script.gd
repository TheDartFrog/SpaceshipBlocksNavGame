extends SubViewportContainer

var dead: bool = false


func _ready() -> void:
	material.set_shader_parameter("ca_strength", 2.5)
	material.set_shader_parameter("blur_strength", 0.5)
	
	var turn_on_tween = create_tween()
	turn_on_tween.tween_property(self, "material:shader_parameter/curvature", 6.0, .75)\
	.set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_OUT)


func _process(delta: float) -> void:
	if !dead:
		return
		
	#material.set_shader_parameter("curvature", lerp(material.get_shader_parameter("curvature"), 0.0, (delta * 100)))
	#if material.get_shader_parameter("curvature") <= 0.0:
		#var wait_timer = Timer.new()
		#add_child(wait_timer)
		#wait_timer.start(2.0)
		#await wait_timer.timeout
		#reload_game()
		
func reload_game():
	if dead:
		return
	dead = true
	
	var turn_off_tween = create_tween()
	turn_off_tween.tween_property(self, "material:shader_parameter/curvature", 0.0, .75)\
	.set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN)
	
	var ca_tween = create_tween()
	ca_tween.tween_property(self, "material:shader_parameter/ca_strength", 25.0, .25)
	
	var blur_tween = create_tween()
	blur_tween.tween_property(self, "material:shader_parameter/blur_strength", 2.0, .5)\
	.set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN)
	
	await turn_off_tween.finished
	
	var waiting_timer = Timer.new()
	add_child(waiting_timer)
	waiting_timer.start(2.0)
	
	await waiting_timer.timeout	
	
	dead = false
	get_tree().reload_current_scene()
	

	
	
	
	#await turn_off_tween.finished



func turn_view_off():
	var turn_off_tween = create_tween()
	turn_off_tween.tween_property(material, "material:shader_parameter/curvature", 0.0, 1.5)\
	.set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN)
