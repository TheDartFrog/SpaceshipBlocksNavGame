extends SubViewport

@onready var stars_layer_0 = $StarsLayer0
@onready var stars_layer_1 = $StartsLayer1
@onready var stars_layer_2 = $StartsLayer2
@onready var mruwka_easter_egg = $mrowka

var layers_combined: Array = []

func _ready() -> void:
	layers_combined = [stars_layer_0, stars_layer_1, stars_layer_2, mruwka_easter_egg]

func speed_up_parallax():
	var each_layer_base_speed: Array = []
	
	for layer in layers_combined:
		each_layer_base_speed.append(layer.material.get_shader_parameter("speed_y"))
	
	for layer in layers_combined:
		var speed_up_tween = create_tween()
		print("speed: ", each_layer_base_speed[layers_combined.find(layer)] * 3)
		speed_up_tween.tween_property(layer, "material:shader_parameter/speed_y", each_layer_base_speed[layers_combined.find(layer)] * 3, .75)\
		.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	
	var between_timer = Timer.new()
	add_child(between_timer)
	between_timer.start(1.25)
	
	await between_timer.timeout
	#
	for layer in layers_combined:
		var speed_back = create_tween()
		print("speed: ", each_layer_base_speed[each_layer_base_speed.find(layer)])
		speed_back.tween_property(layer, "material:shader_parameter/speed_y", each_layer_base_speed[layers_combined.find(layer)], .75)\
		.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
