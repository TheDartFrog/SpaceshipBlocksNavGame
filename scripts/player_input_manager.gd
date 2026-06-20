extends Node2D
class_name PlayerInputManager

@onready var block_spawner = $"../CanvasLayer/MainViewContainer/SubViewport/UpcomingBlockManagerScene"
@onready var game_manager = $".."

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
		
	var cell_falling_out: bool = false
	print("\n")
	for cell in block_spawner.current_block.tilemap.get_used_cells():
		var cell_global_position = block_spawner.current_block.tilemap.to_global(block_spawner.current_block.tilemap.map_to_local(cell))
		print("cell position: ", cell_global_position.x, " max bounds: ", game_manager.current_gridmap.max_bounds_x.x - 105.0)
		if !(cell_global_position.x  + game_manager.current_gridmap.max_bounds_x.x < game_manager.current_gridmap.max_bounds_x.x - 90.0): 
			pass
		else:
			cell_falling_out = true
			break
			
	if cell_falling_out:
		return
	block_spawner.current_block.move_to_left()

func handle_right_click():
	if block_spawner.current_block == null:
		return
		
	var cell_falling_out: bool = false
	print("\n")
	for cell in block_spawner.current_block.tilemap.get_used_cells():
		var cell_global_position = block_spawner.current_block.tilemap.to_global(block_spawner.current_block.tilemap.map_to_local(cell))
		print("cell position: ", cell_global_position.x, " max bounds: ", game_manager.current_gridmap.max_bounds_x.y + 105.0)
		if !(cell_global_position.x  + game_manager.current_gridmap.max_bounds_x.y > game_manager.current_gridmap.max_bounds_x.y + 90.0): 
			pass
		else:
			cell_falling_out = true
			break
			
	if cell_falling_out:
		return
	block_spawner.current_block.move_to_right()

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
