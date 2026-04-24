extends Node2D
class_name PlayerInputManager

@onready var block_spawner = $"../CanvasLayer/MainViewContainer/SubViewport/UpcomingBlockManagerScene"

func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("left_click"):
		handle_left_click()
		return
	if Input.is_action_just_pressed("right_click"):
		handle_right_click()
		return
	if Input.is_action_just_pressed("block_down"):
		handle_block_down()
		return
	if Input.is_action_just_pressed("rotate_right"):
		rotate_block_right()
		return
	if Input.is_action_just_pressed("rotate_left"):
		rotate_block_left()
		return


func handle_left_click():
	if block_spawner.current_block == null:
		return
	block_spawner.current_block.position.x -= 30.0

func handle_right_click():
	if block_spawner.current_block == null:
		return
	block_spawner.current_block.position.x += 30.0

func handle_block_down():
	if block_spawner.current_block == null:
		return
	block_spawner.current_block.is_falling = true

func rotate_block_left():
	if block_spawner.current_block == null:
		return
	block_spawner.current_block.global_rotation_degrees -= 90.0

func rotate_block_right():
	if block_spawner.current_block == null:
		return
	block_spawner.current_block.global_rotation_degrees += 90.0
