extends Node

func _ready():
	pass

## !!!!!!!!!!!!!!!!!!
## When adding new block shapes - add #1 here, #2 in blockTypeToString, #3 in blockDictionary
## !!!!!!!!!!!!!!!!!!
enum blockTypesEnums {NONE, I, O, T, J, L, S, Z}


## 0 = empty, 1 = pass, 2 = wall
var blockDictionary: Dictionary = {
	# EMPTY BLOCK
	blockTypesEnums.NONE: [
	[0, 0, 0, 0], 
	[0, 0, 0, 0], 
	[0, 0, 0, 0], 
	[0, 0, 0, 0]],
	
	# I BLOCK
	blockTypesEnums.I: [
	[1, 0, 0, 0], 
	[1, 0, 0, 0], 
	[1, 0, 0, 0], 
	[1, 0, 0, 0]],
	
	# O BLOCK
	blockTypesEnums.O: [
	[1, 1, 0, 0], 
	[1, 1, 0, 0], 
	[0, 0, 0, 0], 
	[0, 0, 0, 0]],
	
	# T BLOCK
	blockTypesEnums.T: [
	[1, 1, 1, 0], 
	[0, 1, 0, 0], 
	[0, 0, 0, 0], 
	[0, 0, 0, 0]],
	
	# J BLOCK
	blockTypesEnums.J: [
	[0, 1, 0, 0], 
	[0, 1, 0, 0], 
	[1, 1, 0, 0], 
	[0, 0, 0, 0]],
	
	# L BLOCK
	blockTypesEnums.L: [
	[1, 0, 0, 0], 
	[1, 0, 0, 0], 
	[1, 1, 0, 0], 
	[0, 0, 0, 0]],
	
	# S BLOCK
	blockTypesEnums.S: [
	[0, 1, 1, 0], 
	[1, 1, 0, 0], 
	[0, 0, 0, 0], 
	[0, 0, 0, 0]],
	
	# Z BLOCK
	blockTypesEnums.Z: [
	[1, 1, 0, 0], 
	[0, 1, 1, 0], 
	[0, 0, 0, 0], 
	[0, 0, 0, 0]]}


func blockTypeToString(blockTypesToString) -> String:
	var blockTypeString = "NONE"
	
	match(blockTypesToString): # if we need to display name
		0: blockTypeString = "NONE"
		1: blockTypeString = "I"
		2: blockTypeString = "O"
		3: blockTypeString = "T"
		4: blockTypeString = "J"
		5: blockTypeString = "L"
		6: blockTypeString = "S"
		7: blockTypeString = "Z"
	return blockTypeString
