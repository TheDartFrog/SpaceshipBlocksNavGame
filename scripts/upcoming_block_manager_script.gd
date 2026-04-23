extends Node

var rng = RandomNumberGenerator.new()

@onready var blockTemplateScene = preload("uid://btluo5aguj20c")

var nextThreeBlocks = [0, 0, 0]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready() -> void:
	
	nextThreeBlocks = [selectOneBlock(), selectOneBlock(), selectOneBlock()]
	
	spawnNextBlock()
	




func selectOneBlock() -> int:
	var selectedBlock = Global.blockTypesEnums.NONE
	
	
	selectedBlock = rng.randi_range(1, Global.blockTypesEnums.values().size())
	
	print("Selected block: " + Global.blockTypeToString(selectedBlock))
	
	return selectedBlock

## pass a 4x4 TileMapLayer to this function
func blockPatternInterpreter(blockPatternToInterpret, objectToUpdate):
	print("Interpretting block: " + Global.blockTypeToString(blockPatternToInterpret))
	print(Global.blockDictionary[blockPatternToInterpret])
	print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")
	
	# for [x, y]
	
	for i in Global.blockDictionary[blockPatternToInterpret]:
		print("\n\n")
		print(Global.blockDictionary[blockPatternToInterpret[i]])
		print("\n\n")
		for j in Global.blockDictionary[blockPatternToInterpret[i]]:
			print(Global.blockDictionary[blockPatternToInterpret[i[j]]])
	
	
	print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")
	
	


func spawnNextBlock():
	print("Spawning next block...")
	
	## TODO: czy tak to spawnować żeby działało na gridzie? xdd
	var blockToAddInstance = blockTemplateScene.instantiate()
	#add_child(blockToAddInstance)
	# loop thru the 4x4 grid, setting the tiles to 0, 1 or 2
	blockPatternInterpreter(nextThreeBlocks[0], blockToAddInstance)
	
	
	
