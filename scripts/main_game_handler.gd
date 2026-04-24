extends Node2D

@onready var main_view: SubViewport = $CanvasLayer/MainViewContainer/SubViewport
@onready var blocks_spawner = $CanvasLayer/MainViewContainer/SubViewport/UpcomingBlockManagerScene
@onready var rocket = $CanvasLayer/MainViewContainer/SubViewport/RocketScene


var first_round: bool = true
var current_gridmap: GridmapScene

@export var map_size: Vector2i
var gridmap_final_local_pos: Vector2
var cell_size: Vector2 = Vector2(30.0,30.0)

var all_gridmaps: Array = []
var starting_tiles

var CURRENT_GRIDMAP_POSITION: Vector2
var INCOMING_GRIDMAP_POSITION: Vector2
var OLD_GRIDMAP_POSITION: Vector2
var INCOMING_PLUS_POSITION: Vector2
var OLD_PLUS_POSITION: Vector2

var gridmap_positions: Array = []
var gridmap_scene = preload("res://scenes/gridmap_scene.tscn")
var filtered_array = []

signal tween_finished

func _ready():
	
	var gridmap_local_position_x = -((map_size.x * cell_size.x) / 2)
	var gridmap_local_position_y = -((map_size.y * cell_size.y) / 2)
	gridmap_final_local_pos = Vector2(gridmap_local_position_x, gridmap_local_position_y)
	
	tween_finished.connect(_on_tween_finished)
	
	CURRENT_GRIDMAP_POSITION = Vector2(0,0)
	INCOMING_GRIDMAP_POSITION = Vector2(0, -(map_size.y * cell_size.y))
	OLD_GRIDMAP_POSITION = Vector2(0, (map_size.y * cell_size.y))
	INCOMING_PLUS_POSITION = Vector2(0, -(map_size.y * cell_size.y) * 2)
	OLD_PLUS_POSITION = Vector2(0, (map_size.y * cell_size.y) * 2)
	
	
	gridmap_positions = [OLD_GRIDMAP_POSITION, CURRENT_GRIDMAP_POSITION, INCOMING_GRIDMAP_POSITION]
	
	for i in range(3):
		var gridmap = gridmap_scene.instantiate()
		gridmap.map_size = map_size
		main_view.add_child(gridmap)
		gridmap.position = gridmap_positions[i]
		gridmap.visible = false
		gridmap.tilemap.position = gridmap_final_local_pos
		all_gridmaps.append(gridmap)
		
	current_gridmap = all_gridmaps[1]
	current_gridmap.visible = true
	starting_tiles = current_gridmap.generate_starting_tiles()
	all_gridmaps[2].visible = true
	SignalBus.end_reached.connect(_load_next_stage)
	#all_gridmaps.append(current_gridmap)
	var array_to_filter = current_gridmap.tilemap.get_used_cells()
	for cell in array_to_filter:
		if current_gridmap.tilemap.get_cell_source_id(cell) == 2:
			filtered_array.append(cell)
	print(filtered_array)
	
	rocket.global_position = current_gridmap.tilemap.to_global(current_gridmap.tilemap.map_to_local(Vector2i(4, 12)))
	
	


func _process(_delta: float) -> void:
	
	if blocks_spawner.current_block != null && blocks_spawner.current_block.is_falling == true:
		var current_block = blocks_spawner.current_block
		var blocks = current_block.tilemap.get_used_cells()
		var cells_to_set: Array = []
		for block in blocks:
			cells_to_set.append(current_gridmap.tilemap.local_to_map(current_gridmap.tilemap.to_local(current_block.tilemap.to_global(current_block.tilemap.map_to_local(block)))))
		#print(cells_to_set)
		var found_snap: bool = false
		for cell in cells_to_set:
			if current_gridmap.tilemap.get_cell_tile_data(cell + Vector2i(0, 1)) != null:
				if current_gridmap.tilemap.get_cell_tile_data(cell + Vector2i(0, 1)).get_custom_data("is_stopable") == true:
					found_snap = true
		if found_snap:
			var end_reached: bool = false
			var cells_above: Array = []
			for cell in cells_to_set:
				current_gridmap.tilemap.set_cell(cell, 3, Vector2(2,0))
				var cell_to_check = current_gridmap.tilemap.local_to_map(current_gridmap.tilemap.to_local(current_block.tilemap.to_global(current_block.tilemap.map_to_local(cell))))
				if cell_to_check.y <= 0:
					end_reached = true
					var converted_cell = all_gridmaps[2].tilemap.local_to_map(all_gridmaps[2].tilemap.to_local(current_gridmap.tilemap.to_global(current_gridmap.tilemap.map_to_local(cell))))
					cells_above.append(converted_cell)
					print("cell_above: ", converted_cell , " cell_to_check: ", cell_to_check, " finish_line: ", current_gridmap.finish_line)
			
					
					
			current_block.is_falling = false
			SignalBus.block_set.emit(current_block)
			if end_reached:
				
				#var last_cell
				#for cell in cells_above:
					#if cell.y <= 0:
						#last_cell = cell
				_load_next_stage(cells_above)


#func get_block_path():
	#var block_tilemap_pos = current_gridmap.tilemap.local_to_map(blocks_spawner.current_block.position)
	#
	#current_gridmap.astar_pathfinding.get_id_path(block_tilemap_pos, )

func _load_next_stage(cells_to_set: Array = []):
	
	Global.player_input_manager.input_ceased = true
	
	var array_of_roads: Array = []
	var rocket_position: Vector2i = current_gridmap.tilemap.local_to_map(current_gridmap.tilemap.to_local(rocket.global_position))
	
	for cell in current_gridmap.tilemap.get_used_cells():
		if current_gridmap.tilemap.get_cell_tile_data(cell).get_custom_data("is_stopable") == true:
			array_of_roads.append(cell)
	if first_round:
		current_gridmap.generate_starting_tiles()
		first_round = false
		
	for cell in current_gridmap.starting_tiles:
		array_of_roads.append(cell)
		
	array_of_roads.append(rocket_position)
	for cell in cells_to_set:
		array_of_roads.append(cell)
	
	var filtered_array_of_roads: Array = []
	
	for cell in array_of_roads:
		if cell.y >= 0:
			filtered_array_of_roads.append(cell)
	
	for cell in current_gridmap.tilemap.get_used_cells():
		if cell not in filtered_array_of_roads:
			current_gridmap.astar_pathfinding.set_point_solid(cell)
	
	var last_cell_in_path
	for cell in current_gridmap.tilemap.get_used_cells():
		if cell.y == 0 && !current_gridmap.astar_pathfinding.is_point_solid(cell):
			last_cell_in_path = cell
			break
			
	
	print("takie sa mozliwe drogi: ", filtered_array_of_roads)
	
	var converted_path: Array = []
	print("starting position: ", rocket_position, " ending position: ", last_cell_in_path)
	var path = current_gridmap.astar_pathfinding.get_point_path(rocket_position, last_cell_in_path)
	for cell in path:
		converted_path.append(current_gridmap.tilemap.to_global(cell))
	
	print("path ", converted_path)
	
	rocket.start_moving(converted_path)
	
	await SignalBus.rocket_finished
	
	
	var gridmap_instance = gridmap_scene.instantiate()
	gridmap_instance.map_size = map_size
	main_view.add_child(gridmap_instance)
	gridmap_instance.tilemap.position = gridmap_final_local_pos
	gridmap_instance.position = INCOMING_PLUS_POSITION
	
	
	var tweens_speed: float = 1.5
	
	var gridmap_0_position_tween = create_tween()
	gridmap_0_position_tween.tween_property(all_gridmaps.front(), "position", OLD_PLUS_POSITION, tweens_speed)\
	.set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_BACK)
	
	var gridmap_1_position_tween = create_tween()
	gridmap_1_position_tween.tween_property(current_gridmap, "position", gridmap_positions[0], tweens_speed)\
	.set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_BACK)
	
	var gridmap_2_position_tween = create_tween()
	gridmap_2_position_tween.tween_property(all_gridmaps.back(), "position", gridmap_positions[1], tweens_speed)\
	.set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_BACK)
	
	var gridmap_3_position_tween = create_tween()
	gridmap_3_position_tween.tween_property(gridmap_instance, "position", gridmap_positions[2], tweens_speed)\
	.set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_BACK)
	
	var rocket_position_tween = create_tween()
	rocket_position_tween.tween_property(rocket, "position", Vector2(rocket.position.x, rocket.position.y + (gridmap_positions[1].y - gridmap_positions[2].y)), tweens_speed)\
	.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_LINEAR)
	
	await gridmap_2_position_tween.finished
	
	Global.player_input_manager.input_ceased = false
	
	tween_finished.emit()
	
	
	
	all_gridmaps.push_back(gridmap_instance)
	all_gridmaps.front().queue_free()
	all_gridmaps.pop_front()
	current_gridmap = all_gridmaps[1]
	
	for cell in cells_to_set:
		#var cell_local = current_gridmap.tilemap.local_to_map(current_gridmap.tilemap.to_local(cell))
		current_gridmap.tilemap.set_cell(cell, 3, Vector2i(2,0))
		print("cell set! ", cell)
	
	#_load_next_stage()

func _on_tween_finished():
	print("tween finished!")
