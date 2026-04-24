extends Node2D
class_name GridmapScene

#@export var map_size: Vector2i = Vector2i(9, 13)

## refs

@onready var tilemap: TileMapLayer = $Tilemap

## preloads

var cell_sprite = preload("res://icon.svg") ## change later into an actual sprite
var astar_pathfinding: AStarGrid2D = AStarGrid2D.new()

## consts

const rows_count: int = 13
const columns_count: int = 7

#const cell_size: Vector2 = Vector2(20.0,20.0)

## vars
var map_size: Vector2i
var max_asteroid_cells: int = randi_range(3, 10)

func _ready():
	for x in range(map_size.x):
		for y in range(map_size.y):
			tilemap.set_cell(Vector2i(x, y), 3, Vector2(0,0))
	
	
	
	#tilemap.tile_size = cell_size
	var tilemap_cells = tilemap.get_used_cells()
	var cells_to_create_asteroids: Array = []
	for cell in range(max_asteroid_cells):
		cells_to_create_asteroids.append(tilemap_cells.pick_random())
	for cell in cells_to_create_asteroids:
		tilemap.set_cell(cell, 3, Vector2(1,0))
		
	astar_pathfinding.region = tilemap.get_used_rect()
	astar_pathfinding.cell_size = Vector2(30.0,30.0)
	astar_pathfinding.default_compute_heuristic = AStarGrid2D.HEURISTIC_MANHATTAN
	
	astar_pathfinding.update()
	

func reach_the_end():
	SignalBus.end_reached.emit()

func generate_starting_tiles():
	for i in range(map_size.x):
		tilemap.set_cell(Vector2i(i, map_size.y ) , 3, Vector2(2,0))
