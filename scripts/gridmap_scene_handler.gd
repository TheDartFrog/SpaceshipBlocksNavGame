extends Node2D
class_name GridmapScene

#@export var map_size: Vector2i = Vector2i(9, 13)

## refs

@onready var tilemap: TileMapLayer = $Tilemap

## preloads

var cell_sprite = preload("res://icon.svg") ## change later into an actual sprite
var astar_pathfinding: AStarGrid2D = AStarGrid2D.new()
var starting_tiles: Array = []

## consts

#const rows_count: int = 13
#const columns_count: int = 7

#const cell_size: Vector2 = Vector2(20.0,20.0)

## vars
var map_size: Vector2i
var max_asteroid_cells: int = randi_range(3, 10)
var finish_line: Array = []

func _ready():
	for x in range(map_size.x):
		for y in range(map_size.y):
			tilemap.set_cell(Vector2i(x, y), 3, Vector2(0,0))
	generate_finish_line()
	for x in range(map_size.x):
		starting_tiles.append(Vector2i(x, map_size.y))
	generate_starting_tiles()	
	#tilemap.tile_size = cell_size
	var tilemap_cells = tilemap.get_used_cells()
	var tilemap_cells_viable_for_asteroids: Array = []
	for cell in tilemap_cells:
		if cell not in finish_line && cell not in starting_tiles: 
			tilemap_cells_viable_for_asteroids.append(cell)
			
	var cells_to_create_asteroids: Array = []
	
	for cell in range(max_asteroid_cells):
		cells_to_create_asteroids.append(tilemap_cells_viable_for_asteroids.pick_random())
	
	for cell in cells_to_create_asteroids:
		tilemap.set_cell(cell, 3, Vector2(1,0))
		
	astar_pathfinding.region = tilemap.get_used_rect()
	astar_pathfinding.cell_size = Vector2(30.0,30.0)
	astar_pathfinding.default_compute_heuristic = AStarGrid2D.HEURISTIC_MANHATTAN
	
	astar_pathfinding.update()
	

func reach_the_end():
	SignalBus.end_reached.emit()

func generate_finish_line():
	for i in range(map_size.x):
		finish_line.append(Vector2i(i, 0))

func generate_starting_tiles():
	for i in starting_tiles:
		tilemap.set_cell(i , 3, Vector2(2,0))
