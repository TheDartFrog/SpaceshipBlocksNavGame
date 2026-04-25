extends Node2D
class_name PlayerInputManager

@onready var block_spawner = $"../CanvasLayer/MainViewContainer/SubViewport/UpcomingBlockManagerScene"

var input_ceased: bool = false

func _ready() -> void:
	Global.player_input_manager = self

func _unhandled_input(_event: InputEvent) -> void:
	if input_ceased:
		return
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
	#var xd = block_spawner.current_block.name
	block_spawner.current_block.is_falling = true
	#var death_timer = Timer.new()
	#add_child(death_timer)
	#death_timer.start(3.0)
	#
	#await death_timer.timeout
	#if block_spawner.current_block.name == xd:
		#block_spawner.spawnNextBlock()
	#input_ceased = false
	

func rotate_block_left():
	if block_spawner.current_block == null:
		return
	block_spawner.current_block.rotate_left()

func rotate_block_right():
	if block_spawner.current_block == null:
		return
	block_spawner.current_block.rotate_right()
