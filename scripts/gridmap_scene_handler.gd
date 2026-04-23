extends Node2D
class_name GridmapScene

#@export var map_size: Vector2i = Vector2i(9, 13)

## refs

@onready var tilemap: TileMapLayer = $Tilemap

## preloads

var cell_sprite = preload("res://icon.svg") ## change later into an actual sprite


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
