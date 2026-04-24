extends Node2D

@onready var tilemap = $BlockTemplateScene

var is_falling: bool = false
var base_gravity: float = 5.0
var is_set: bool = false

func rotate_right():
	global_rotation_degrees += 90.0

func rotate_left():
	global_rotation_degrees -= 90.0

func _process(delta: float) -> void:
	if !is_falling:
		return
	position.y += base_gravity
