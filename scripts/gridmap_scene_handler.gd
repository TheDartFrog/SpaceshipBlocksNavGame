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
			tilemap.set_cell(Vector2i(x, y), 1, Vector2(0,0))
	
	
	
	#tilemap.tile_size = cell_size
	var tilemap_cells = tilemap.get_used_cells()
	var cells_to_create_asteroids: Array = []
	for cell in range(max_asteroid_cells):
		cells_to_create_asteroids.append(tilemap_cells.pick_random())
	for cell in cells_to_create_asteroids:
		tilemap.set_cell(cell, 0, Vector2(0,0))
		
	astar_pathfinding.region = tilemap.get_used_rect()
	astar_pathfinding.cell_size = Vector2(30.0,30.0)
	astar_pathfinding.default_compute_heuristic = AStarGrid2D.HEURISTIC_MANHATTAN
	
	astar_pathfinding.update()
	
	#astar_pathfinding.get_id_path(0, 1)
	
	#for cell in tilemap.get_used_cells():
		#var id: int = 0
		##astar_pathfinding.add_point(id, cell)
		#id += 1
		
	#print(astar_pathfinding.get_point_path(Vector2i(0, 0), Vector2i(0, 6)))
			##astar_pathfinding.add_point()
			#var tile_position = Vector2i (
				#cell_x + tilemap.get_used_rect().position.x,
				#cell_y + tilemap.get_used_rect().position.y
			#)
			#var tile_data = tilemap.get_cell_tile_data(tile_position)
			
	
		#for row in range(rows_count):
			#if tilemap.get_cell_source_id(cell) == row:
				#tilemap.set_cell(cell, 0)
			#else:
				#tilemap.set_cell(cell, 1)
				#for column in columns_count:
					#if tilemap.get_cell_source_id(cell) == column:
						#tilemap.set_cell(cell, 0)
					#else:
						#tilemap.set_cell(cell, 1)

func reach_the_end():
	SignalBus.end_reached.emit()
