extends SubViewportContainer

var dead: bool = false
@onready var white_noise = $SubViewport/WhiteNoiseTest
@onready var u_dead = $SubViewport/YOUAREDEAD

func _ready() -> void:
	material.set_shader_parameter("ca_strength", 2.5)
	material.set_shader_parameter("blur_strength", 0.5)
	white_noise.material.set_shader_parameter("transparency", 1.0)
	
	
	var turn_on_tween = create_tween()
	turn_on_tween.tween_property(self, "material:shader_parameter/curvature", 6.0, .75)\
	.set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_OUT)
	
	await turn_on_tween.finished
	
	var noise_tween = create_tween()
	noise_tween.tween_property(white_noise, "material:shader_parameter/transparency", 0.0, .5)


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
	#u_dead.visible = true
	
	var noise_tween = create_tween()
	noise_tween.tween_property(white_noise, "material:shader_parameter/transparency", 1.0, .1)
	
	await get_tree().create_timer(2.0).timeout
	
	var turn_off_tween = create_tween()
	turn_off_tween.tween_property(self, "material:shader_parameter/curvature", 0.0, .75)
	
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
