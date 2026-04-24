extends Node

@onready var firstPreview = $firstComingBlock
@onready var secondPreview = $secondComingBlock
@onready var thirdPreview = $thirdComingBlock



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.




func updateUpcomingBlockPreview(threeUpcomingBlocks):
	print("Updating upcoming block previews...")
	
	spaghetti(threeUpcomingBlocks[0], firstPreview)
	spaghetti(threeUpcomingBlocks[1], secondPreview)
	spaghetti(threeUpcomingBlocks[2], thirdPreview)
	

func spaghetti(blockPatternToInterpret, objectToUpdate):
	for i in 4:
		#print(i)
		for j in 4:
			#print(Global.blockDictionary[blockPatternToInterpret][i][j])
			var tilePos = Vector2i(i, j)
			if Global.blockDictionary[blockPatternToInterpret][i][j] > 0:
				#print(tilePos)
				#print(Global.blockDictionary[blockPatternToInterpret][i][j]-1)
				#print("\n")
				objectToUpdate.set_cell(tilePos, Global.blockDictionary[blockPatternToInterpret][i][j]-1, Vector2i(0, 0) )
			elif Global.blockDictionary[blockPatternToInterpret][i][j] == 0:
				objectToUpdate.set_cell(tilePos, -1, Vector2i(0, 0) )
	
	
