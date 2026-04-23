extends Node2D

var current_gridmap: GridmapScene

@export var map_size: Vector2i
var gridmap_final_local_pos: Vector2
var cell_size: Vector2 = Vector2(30.0,30.0)

var all_gridmaps: Array = []

var CURRENT_GRIDMAP_POSITION: Vector2
var INCOMING_GRIDMAP_POSITION: Vector2
var OLD_GRIDMAP_POSITION: Vector2
var INCOMING_PLUS_POSITION: Vector2
var OLD_PLUS_POSITION: Vector2

var gridmap_positions: Array = []
var gridmap_scene = preload("res://scenes/gridmap_scene.tscn")

func _ready():
	
	var gridmap_local_position_x = -((map_size.x * cell_size.x) / 2)
	var gridmap_local_position_y = -((map_size.y * cell_size.y) / 2)
	gridmap_final_local_pos = Vector2(gridmap_local_position_x, gridmap_local_position_y)
	
	CURRENT_GRIDMAP_POSITION = Vector2(0,0)
	INCOMING_GRIDMAP_POSITION = Vector2(0, -(map_size.y * cell_size.y))
	OLD_GRIDMAP_POSITION = Vector2(0, (map_size.y * cell_size.y))
	INCOMING_PLUS_POSITION = Vector2(0, -(map_size.y * cell_size.y) * 2)
	OLD_PLUS_POSITION = Vector2(0, (map_size.y * cell_size.y) * 2)
	
	
	gridmap_positions = [OLD_GRIDMAP_POSITION, CURRENT_GRIDMAP_POSITION, INCOMING_GRIDMAP_POSITION]
	
	for i in range(3):
		var gridmap = gridmap_scene.instantiate()
		gridmap.map_size = map_size
		add_child(gridmap)
		gridmap.position = gridmap_positions[i]
		gridmap.tilemap.position = gridmap_final_local_pos
		all_gridmaps.append(gridmap)
		
	current_gridmap = all_gridmaps[1]
	
	SignalBus.end_reached.connect(_load_next_stage)
	#all_gridmaps.append(current_gridmap)
	
	
	
	var testing_timer = Timer.new()
	add_child(testing_timer)
	testing_timer.start(2.0)
	
	await testing_timer.timeout
	print("lesss go")
	
	_load_next_stage()


func _load_next_stage():
	var gridmap_instance = gridmap_scene.instantiate()
	gridmap_instance.map_size = map_size
	add_child(gridmap_instance)
	gridmap_instance.tilemap.position = gridmap_final_local_pos
	gridmap_instance.position = INCOMING_PLUS_POSITION
	
	
	var gridmap_0_position_tween = create_tween()
	gridmap_0_position_tween.tween_property(all_gridmaps.front(), "position", OLD_PLUS_POSITION, 3.0)\
	.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_LINEAR)
	
	var gridmap_1_position_tween = create_tween()
	gridmap_1_position_tween.tween_property(current_gridmap, "position", gridmap_positions[0], 3.0)\
	.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_LINEAR)
	
	var gridmap_2_position_tween = create_tween()
	gridmap_2_position_tween.tween_property(all_gridmaps.back(), "position", gridmap_positions[1], 3.0)\
	.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_LINEAR)
	
	var gridmap_3_position_tween = create_tween()
	gridmap_3_position_tween.tween_property(gridmap_instance, "position", gridmap_positions[2], 3.0)\
	.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_LINEAR)
	
	await gridmap_2_position_tween.finished
	
	all_gridmaps.push_back(gridmap_instance)
	all_gridmaps.front().queue_free()
	all_gridmaps.pop_front()
	current_gridmap = all_gridmaps[1]
	
	#_load_next_stage()
