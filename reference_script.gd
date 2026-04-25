extends Node2D

@onready var tilemap = $BlockTemplateScene

var is_falling: bool = false
var base_gravity: float = 10.0
var is_set: bool = false
var rotating: bool = false

func _ready() -> void:
	SignalBus.block_set.connect(_on_block_set)

func rotate_right():
	if rotating:
		return
	
	rotating = true
	
	var arr: Array = []
	for cell in tilemap.get_used_cells():
		arr.append(tilemap.to_global(tilemap.map_to_local(cell)))
		
	
	#print("pre rotation: ", arr)
	
	var rotation_tween = create_tween()
	rotation_tween.tween_property(self, "global_rotation_degrees", global_rotation_degrees + 90.0, .25)\
	.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	
	await rotation_tween.finished
	rotating = false
	
	var arr0: Array = []
	for cell in tilemap.get_used_cells():
		arr0.append(tilemap.to_global(tilemap.map_to_local(cell)))
		
	#print("post rotation: ", arr0)

func rotate_left():
	if rotating:
		return
	rotating = true
	var rotation_tween = create_tween()
	rotation_tween.tween_property(self, "global_rotation_degrees", global_rotation_degrees - 90.0, .25)\
	.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	await rotation_tween.finished
	rotating = false

func _process(delta: float) -> void:
	if !is_falling:
		return
	Global.player_input_manager.input_ceased = true
	position.y += base_gravity

func _on_block_set(current_block):
	if current_block == self:
		print("im killing myself: ", current_block)
		Global.player_input_manager.input_ceased = false
		queue_free()
