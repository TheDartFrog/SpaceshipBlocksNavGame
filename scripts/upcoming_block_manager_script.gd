extends Node

var rng = RandomNumberGenerator.new()

@onready var blockTemplateScene = preload("uid://btluo5aguj20c")

var nextThreeBlocks = [0, 0, 0]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready() -> void:
	
	nextThreeBlocks = [selectOneBlock(), selectOneBlock(), selectOneBlock()]
	




func selectOneBlock() -> int:
	var selectedBlock = Global.blockTypesEnums.NONE
	
	
	selectedBlock = rng.randi_range(1, Global.blockTypesEnums.values().size()-1)
	
	print("Selected block: " + Global.blockTypeToString(selectedBlock))
	
	return selectedBlock

## pass a 4x4 TileMapLayer to this function
func blockPatternInterpreter(blockPatternToInterpret, objectToUpdate):
	print("Interpretting block: " + Global.blockTypeToString(blockPatternToInterpret))
	print(Global.blockDictionary[blockPatternToInterpret])
	print("\n\n\n")
	
	# for [x, y]
	
	for i in 4:
		#print(i)
		for j in 4:
			print(Global.blockDictionary[blockPatternToInterpret][i][j])
			var tilePos = Vector2i(i, j)
			if Global.blockDictionary[blockPatternToInterpret][i][j] > 0:
				print(tilePos)
				print(Global.blockDictionary[blockPatternToInterpret][i][j]-1)
				print("\n")
				objectToUpdate.set_cell(tilePos, Global.blockDictionary[blockPatternToInterpret][i][j]-1, Vector2i(0, 0) )
			elif Global.blockDictionary[blockPatternToInterpret][i][j] == 0:
				objectToUpdate.set_cell(tilePos, -1, Vector2i(0, 0) )
	
	


func spawnNextBlock() -> TileMapLayer:
	print("Spawning next block...")
	
	## TODO: czy tak to spawnować żeby działało na gridzie? xdd
	
	
	var blockToAddInstance = blockTemplateScene.instantiate()
	add_child(blockToAddInstance)
	print(blockToAddInstance)
	blockPatternInterpreter(nextThreeBlocks[0], blockToAddInstance)
	#add_child(blockToAddInstance)
	return blockToAddInstance

	
	
