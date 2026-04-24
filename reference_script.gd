extends Node2D

@onready var tilemap = $BlockTemplateScene

var is_falling: bool = false
var base_gravity: float = 5.0
var is_set: bool = false

func _ready() -> void:
	SignalBus.block_set.connect(_on_block_set)

func rotate_right():
	global_rotation_degrees += 90.0

func rotate_left():
	global_rotation_degrees -= 90.0

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
