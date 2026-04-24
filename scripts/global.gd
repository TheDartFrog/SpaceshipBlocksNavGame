extends Node

func _ready():
	pass

## !!!!!!!!!!!!!!!!!!
## When adding new block shapes - add #1 here, #2 in blockTypeToString, #3 in blockDictionary
## !!!!!!!!!!!!!!!!!!
enum blockTypesEnums {NONE, I, O, T, J, L, S, Z,
SWARZ01, SWARZ02, SWARZ03, SWARZ04, SWARZ05, SWARZ06, SWARZ07, SWARZ08, SWARZ09, SWARZ10,
SWARZ11, SWARZ12, SWARZ13, SWARZ14, SWARZ15, SWARZ16, SWARZ17, SWARZ18, SWARZ19, SWARZ20,
SWARZ21, SWARZ22, SWARZ23, SWARZ24, SWARZ25, SWARZ26, SWARZ27, SWARZ28, SWARZ29, SWARZ30,


ALBERT, TREBLA, ANDREW, VERNON, LUIS, TREVOR, PIOTR, RTOIP, BARTEK, MAX, XAM, BEN, NEB, IWAN, CARLOS, OLEG, GELO, MATTEW, WETTAM, REX, XER, ZYGFRYD, KLAUS, ALEX, XELA, CZAREK, KRZYS, OLIWER, REIWILO, ANNA, ANNAL, ZOSIA, GOSIA, SAMOSIA, MALGOSIA, SAM, MAS, KASIA, AISAK, PATRYCJA, AJCYRTAP, MAJA, AJAM, ULA, ALU, LUCJA, AJCUL, ALICJA, AJCILA, MICHALINA, MISIA, WERONIKA, CECYLIA, JOLA, KLAUDIA, KRYSTYNA, DOROTA, TEOFILIA, OLIWIA, AIWILO, MAGDA, LENA, NELA, MARTA, MARTYNA, BERNADETA, IZOLDA, BOZENA, GRAZYNA, IZA

## welcome, to hell :D

}


## 0 = empty, 1 = pass, 2 = wall
var blockDictionary: Dictionary = {
	# REGULAR CLASSIC TILES:
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
	[0, 0, 0, 0]],
	# END REGULAR TETRIS...
	
	# SZWARC
	blockTypesEnums.SWARZ01: [
	[2, 0, 0, 0], 
	[0, 0, 0, 0], 
	[0, 0, 0, 0], 
	[0, 0, 0, 0]],
	blockTypesEnums.SWARZ02: [
	[2, 2, 0, 0], 
	[2, 0, 0, 0], 
	[0, 0, 0, 0], 
	[0, 0, 0, 0]],
	blockTypesEnums.SWARZ03: [
	[2, 2, 2, 0], 
	[2, 0, 0, 0], 
	[2, 0, 0, 0], 
	[0, 0, 0, 0]],
	blockTypesEnums.SWARZ04: [
	[2, 2, 2, 2], 
	[2, 0, 0, 0], 
	[2, 0, 0, 0], 
	[2, 0, 0, 0]],
	blockTypesEnums.SWARZ05: [
	[2, 0, 0, 0], 
	[2, 0, 0, 0], 
	[0, 0, 0, 0], 
	[0, 0, 0, 0]],
	blockTypesEnums.SWARZ06: [
	[2, 0, 0, 0], 
	[2, 0, 0, 0], 
	[2, 0, 0, 0], 
	[0, 0, 0, 0]],
	blockTypesEnums.SWARZ07: [
	[2, 0, 0, 0], 
	[2, 0, 0, 0], 
	[2, 0, 0, 0], 
	[2, 0, 0, 0]],
	blockTypesEnums.SWARZ08: [
	[2, 2, 0, 0], 
	[2, 0, 0, 0], 
	[2, 0, 0, 0], 
	[0, 0, 0, 0]],
	blockTypesEnums.SWARZ09: [
	[2, 2, 0, 0], 
	[2, 0, 0, 0], 
	[2, 0, 0, 0], 
	[2, 0, 0, 0]],
	blockTypesEnums.SWARZ10: [
	[2, 2, 2, 0], 
	[2, 0, 0, 0], 
	[2, 0, 0, 0], 
	[2, 0, 0, 0]],
	blockTypesEnums.SWARZ11: [
	[2, 2, 0, 0], 
	[0, 2, 0, 0], 
	[0, 2, 0, 0], 
	[0, 2, 0, 0]],
	blockTypesEnums.SWARZ12: [
	[2, 2, 0, 0], 
	[0, 2, 0, 0], 
	[0, 2, 0, 0], 
	[0, 2, 0, 0]],
	blockTypesEnums.SWARZ13: [
	[0, 2, 2, 2], 
	[0, 0, 0, 2], 
	[0, 0, 0, 2], 
	[0, 0, 0, 2]],
	blockTypesEnums.SWARZ14: [
	[2, 2, 0, 0], 
	[0, 2, 0, 0], 
	[0, 2, 2, 0], 
	[0, 0, 0, 0]],
	blockTypesEnums.SWARZ15: [
	[2, 2, 0, 0], 
	[0, 2, 0, 0], 
	[0, 2, 0, 0], 
	[0, 2, 2, 0]],
	blockTypesEnums.SWARZ16: [
	[2, 2, 2, 0], 
	[0, 0, 2, 0], 
	[0, 0, 2, 0], 
	[0, 0, 2, 2]],
	blockTypesEnums.SWARZ17: [
	[2, 2, 0, 0], 
	[0, 2, 0, 0], 
	[0, 2, 2, 2], 
	[0, 0, 0, 0]],
	blockTypesEnums.SWARZ18: [
	[2, 0, 0, 0], 
	[2, 2, 0, 0], 
	[2, 0, 0, 0], 
	[0, 0, 0, 0]],
	blockTypesEnums.SWARZ19: [
	[0, 2, 0, 0], 
	[0, 2, 2, 0], 
	[2, 2, 0, 0], 
	[0, 0, 0, 0]],
	blockTypesEnums.SWARZ20: [ #ZOSIA
	[0, 2, 0, 0], 
	[2, 2, 2, 0], 
	[0, 2, 0, 0], 
	[0, 0, 0, 0]],
	blockTypesEnums.SWARZ21: [
	[0, 2, 0, 2], 
	[0, 2, 2, 2], 
	[0, 0, 0, 0], 
	[0, 0, 0, 0]],
	blockTypesEnums.SWARZ22: [
	[2, 2, 2, 0], 
	[2, 0, 2, 0], 
	[0, 0, 0, 0], 
	[0, 0, 0, 0]],
	blockTypesEnums.SWARZ23: [
	[2, 2, 0, 0], 
	[0, 2, 2, 2], 
	[0, 2, 0, 0], 
	[0, 0, 0, 0]],
	blockTypesEnums.SWARZ24: [
	[0, 2, 0, 0], 
	[0, 2, 0, 0], 
	[2, 2, 0, 0], 
	[2, 2, 0, 0]],
	blockTypesEnums.SWARZ25: [
	[0, 2, 0, 0], 
	[0, 2, 0, 0], 
	[0, 0, 2, 0], 
	[0, 0, 2, 0]],
	blockTypesEnums.SWARZ26: [
	[0, 2, 2, 2], 
	[0, 0, 2, 0], 
	[0, 0, 2, 0], 
	[0, 2, 2, 0]],
	blockTypesEnums.SWARZ27: [
	[0, 0, 0, 2], 
	[0, 0, 2, 2], 
	[0, 0, 2, 2], 
	[0, 0, 0, 2]],
	blockTypesEnums.SWARZ28: [
	[0, 0, 2, 2], 
	[0, 2, 2, 0], 
	[0, 0, 2, 0], 
	[0, 0, 2, 2]],
	blockTypesEnums.SWARZ29: [
	[2, 2, 0, 0], 
	[2, 2, 0, 0], 
	[0, 0, 0, 0], 
	[0, 0, 0, 0]],
	blockTypesEnums.SWARZ30: [
	[2, 2, 2, 0], 
	[2, 2, 0, 0], 
	[2, 0, 0, 0], 
	[0, 0, 0, 0]],
	
	# END SZWARC
	
	
	# BEGIN ULE
	
	blockTypesEnums.ALBERT: [
	[1, 1, 1, 0],
	[0, 0, 1, 0],
	[0, 1, 1, 0],
	[0, 0, 0, 0]],
	blockTypesEnums.TREBLA: [
	[1, 1, 1, 0],
	[1, 0, 0, 0],
	[1, 1, 0, 0],
	[0, 0, 0, 0]],
	blockTypesEnums.ANDREW: [
	[1, 1, 1, 0],
	[0, 0, 1, 0],
	[0, 0, 1, 0],
	[0, 0, 0, 0]],
	blockTypesEnums.VERNON: [
	[1, 0, 1, 0],
	[1, 1, 1, 0],
	[0, 1, 0, 0],
	[0, 0, 0, 0]],
	blockTypesEnums.LUIS: [
	[0, 0, 0, 0],
	[0, 1, 0, 0],
	[0, 0, 0, 0],
	[0, 0, 0, 0]],
	blockTypesEnums.TREVOR: [
	[1, 1, 0, 0],
	[0, 1, 0, 0],
	[0, 0, 0, 0],
	[0, 0, 0, 0]],
	blockTypesEnums.PIOTR: [
	[1, 1, 1, 0],
	[0, 1, 1, 0],
	[0, 0, 0, 0],
	[0, 0, 0, 0]],
	blockTypesEnums.RTOIP: [
	[1, 1, 1, 0],
	[1, 1, 0, 0],
	[0, 0, 0, 0],
	[0, 0, 0, 0]],
	blockTypesEnums.BARTEK: [
	[1, 1, 1, 0],
	[0, 1, 0, 0],
	[0, 1, 0, 0],
	[0, 0, 0, 0]],
	blockTypesEnums.MAX: [
	[1, 1, 1, 0],
	[0, 0, 1, 0],
	[0, 0, 1, 1],
	[0, 0, 0, 0]],
	blockTypesEnums.XAM: [
	[0, 1, 1, 1],
	[0, 1, 0, 0],
	[1, 1, 0, 0],
	[0, 0, 0, 0]],
	blockTypesEnums.BEN: [
	[0, 0, 0, 1],
	[0, 0, 1, 1],
	[0, 1, 1, 0],
	[0, 0, 0, 0]],
	blockTypesEnums.NEB: [
	[1, 0, 0, 0],
	[1, 1, 0, 0],
	[0, 1, 1, 0],
	[0, 0, 0, 0]],
	blockTypesEnums.IWAN: [
	[0, 1, 0, 0],
	[0, 1, 0, 0],
	[0, 1, 0, 0],
	[0, 0, 0, 0]],
	blockTypesEnums.CARLOS: [
	[0, 0, 0, 0],
	[1, 1, 0, 0],
	[0, 0, 0, 0],
	[0, 0, 0, 0]],
	blockTypesEnums.OLEG: [
	[0, 1, 0, 0],
	[1, 1, 0, 0],
	[1, 0, 0, 0],
	[1, 1, 0, 0]],
	blockTypesEnums.GELO: [
	[1, 0, 0, 0],
	[1, 1, 0, 0],
	[0, 1, 0, 0],
	[1, 1, 0, 0]],
	blockTypesEnums.MATTEW: [
	[0, 1, 0, 0],
	[0, 1, 1, 0],
	[1, 1, 0, 0],
	[0, 0, 0, 0]],
	blockTypesEnums.WETTAM: [
	[0, 1, 0, 0],
	[1, 1, 0, 0],
	[0, 1, 1, 0],
	[0, 0, 0, 0]],
	blockTypesEnums.REX: [
	[1, 1, 0, 0],
	[0, 1, 0, 0],
	[0, 1, 0, 0],
	[0, 1, 1, 0]],
	blockTypesEnums.XER: [
	[0, 1, 1, 0],
	[0, 1, 0, 0],
	[0, 1, 0, 0],
	[1, 1, 0, 0]],
	blockTypesEnums.ZYGFRYD: [
	[1, 1, 1, 0],
	[0, 1, 0, 0],
	[1, 1, 1, 0],
	[0, 0, 0, 0]],
	blockTypesEnums.KLAUS: [
	[1, 1, 0, 0],
	[0, 1, 0, 0],
	[0, 1, 0, 0],
	[1, 1, 0, 0]],
	blockTypesEnums.ALEX: [
	[1, 1, 1, 0],
	[0, 0, 1, 0],
	[0, 0, 1, 0],
	[0, 0, 1, 1]],
	blockTypesEnums.XELA: [
	[0, 1, 1, 1],
	[0, 1, 0, 0],
	[0, 1, 0, 0],
	[1, 1, 0, 0]],
	blockTypesEnums.CZAREK: [
	[1, 1, 0, 0],
	[0, 1, 0, 0],
	[1, 1, 0, 0],
	[0, 0, 0, 0]],
	blockTypesEnums.KRZYS: [
	[0, 1, 0, 0],
	[1, 1, 1, 0],
	[0, 1, 0, 0],
	[0, 0, 0, 0]],
	blockTypesEnums.OLIWER: [
	[0, 1, 1, 1],
	[1, 1, 0, 0],
	[0, 0, 0, 0],
	[0, 0, 0, 0]],
	blockTypesEnums.REIWILO: [
	[1, 1, 1, 0],
	[0, 0, 1, 1],
	[0, 0, 0, 0],
	[0, 0, 0, 0]],
	blockTypesEnums.ANNA: [
	[1, 1, 1, 0],
	[0, 0, 1, 0],
	[0, 0, 2, 0],
	[0, 0, 1, 1]],
	blockTypesEnums.ANNAL: [
	[0, 1, 1, 1],
	[0, 1, 0, 0],
	[0, 2, 0, 0],
	[1, 1, 0, 0]],
	blockTypesEnums.ZOSIA: [
	[0, 2, 0, 0],
	[2, 2, 2, 0],
	[0, 2, 0, 0],
	[0, 0, 0, 0]],
	blockTypesEnums.GOSIA: [
	[0, 2, 0, 0],
	[1, 2, 2, 0],
	[0, 1, 0, 0],
	[0, 0, 0, 0]],
	blockTypesEnums.SAMOSIA: [
	[0, 2, 0, 0],
	[1, 1, 2, 0],
	[0, 1, 0, 0],
	[0, 0, 0, 0]],
	blockTypesEnums.MALGOSIA: [
	[0, 1, 0, 0],
	[1, 2, 1, 0],
	[0, 1, 0, 0],
	[0, 0, 0, 0]],
	blockTypesEnums.SAM: [
	[0, 2, 0, 0],
	[0, 2, 0, 0],
	[2, 2, 0, 0],
	[0, 0, 0, 0]],
	blockTypesEnums.MAS: [
	[0, 2, 0, 0],
	[0, 2, 0, 0],
	[0, 2, 2, 0],
	[0, 0, 0, 0]],
	blockTypesEnums.KASIA: [
	[2, 0, 0, 0],
	[1, 1, 0, 0],
	[0, 1, 0, 0],
	[0, 1, 1, 0]],
	blockTypesEnums.AISAK: [
	[0, 0, 2, 0],
	[0, 1, 1, 0],
	[0, 1, 0, 0],
	[1, 1, 0, 0]],
	blockTypesEnums.PATRYCJA: [
	[2, 0, 0, 0],
	[1, 1, 0, 0],
	[0, 1, 0, 0],
	[0, 1, 2, 0]],
	blockTypesEnums.AJCYRTAP: [
	[0, 0, 2, 0],
	[0, 1, 1, 0],
	[0, 1, 0, 0],
	[2, 1, 0, 0]],
	blockTypesEnums.MAJA: [
	[2, 0, 1, 0],
	[2, 2, 1, 0],
	[0, 1, 0, 0],
	[0, 1, 0, 0]],
	blockTypesEnums.AJAM: [
	[1, 0, 2, 0],
	[1, 2, 2, 0],
	[0, 1, 0, 0],
	[0, 1, 0, 0]],
	blockTypesEnums.ULA: [
	[2, 0, 1, 0],
	[2, 1, 1, 0],
	[0, 1, 0, 0],
	[0, 1, 0, 0]],
	blockTypesEnums.ALU: [
	[1, 0, 2, 0],
	[1, 1, 2, 0],
	[0, 1, 0, 0],
	[0, 1, 0, 0]],
	blockTypesEnums.LUCJA: [
	[1, 1, 0, 0],
	[0, 1, 0, 0],
	[0, 2, 0, 0],
	[0, 1, 1, 0]],
	blockTypesEnums.AJCUL: [
	[0, 0, 1, 1],
	[0, 0, 1, 0],
	[0, 0, 2, 0],
	[0, 1, 1, 0]],
	blockTypesEnums.ALICJA: [
	[1, 1, 0, 0],
	[0, 2, 0, 0],
	[0, 2, 0, 0],
	[0, 1, 1, 0]],
	blockTypesEnums.AJCILA: [
	[0, 0, 1, 1],
	[0, 0, 2, 0],
	[0, 0, 2, 0],
	[0, 1, 1, 0]],
	blockTypesEnums.MICHALINA: [
	[1, 2, 1, 0],
	[0, 2, 0, 0],
	[0, 2, 0, 0],
	[0, 0, 0, 0]],
	blockTypesEnums.MISIA: [
	[1, 1, 1, 0],
	[0, 2, 0, 0],
	[0, 2, 0, 0],
	[0, 0, 0, 0]],
	blockTypesEnums.WERONIKA: [
	[0, 2, 0, 0],
	[2, 2, 0, 0],
	[0, 2, 0, 0],
	[0, 0, 0, 0]],
	blockTypesEnums.CECYLIA: [
	[1, 0, 0, 0],
	[1, 2, 0, 0],
	[0, 1, 1, 0],
	[0, 0, 0, 0]],
	blockTypesEnums.JOLA: [
	[0, 2, 0, 0],
	[2, 2, 0, 0],
	[0, 0, 0, 0],
	[0, 0, 0, 0]],
	blockTypesEnums.KLAUDIA: [
	[1, 1, 1, 0],
	[0, 2, 0, 0],
	[1, 1, 1, 0],
	[0, 0, 0, 0]],
	blockTypesEnums.KRYSTYNA: [
	[1, 0, 0, 0],
	[1, 1, 2, 2],
	[0, 2, 0, 0],
	[0, 2, 0, 0]],
	blockTypesEnums.DOROTA: [
	[0, 0, 1, 0],
	[1, 2, 1, 0],
	[1, 0, 0, 0],
	[0, 0, 0, 0]],
	blockTypesEnums.TEOFILIA: [
	[1, 1, 1, 0],
	[0, 2, 0, 0],
	[0, 1, 0, 0],
	[0, 1, 0, 0]],
	blockTypesEnums.OLIWIA: [
	[0, 0, 0, 1],
	[1, 1, 2, 1],
	[0, 0, 1, 0],
	[0, 0, 1, 0]],
	blockTypesEnums.AIWILO: [
	[1, 0, 0, 0],
	[1, 2, 1, 1],
	[0, 1, 0, 0],
	[0, 1, 0, 0]],
	blockTypesEnums.MAGDA: [
	[2, 0, 0, 0],
	[2, 2, 1, 1],
	[0, 1, 0, 0],
	[0, 1, 0, 0]],
	blockTypesEnums.LENA: [
	[1, 0, 1, 0],
	[1, 2, 1, 0],
	[0, 1, 0, 0],
	[0, 1, 0, 0]],
	blockTypesEnums.NELA: [
	[2, 0, 2, 0],
	[2, 1, 2, 0],
	[0, 1, 0, 0],
	[0, 0, 0, 0]],
	blockTypesEnums.MARTA: [
	[0, 2, 0, 0],
	[0, 1, 0, 0],
	[0, 1, 0, 0],
	[0, 0, 0, 0]],
	blockTypesEnums.MARTYNA: [
	[1, 1, 2, 0],
	[0, 0, 1, 0],
	[0, 0, 1, 0],
	[0, 0, 0, 0]],
	blockTypesEnums.BERNADETA: [
	[0, 1, 0, 0],
	[0, 2, 0, 0],
	[0, 1, 0, 0],
	[0, 0, 0, 0]],
	blockTypesEnums.IZOLDA: [
	[0, 2, 0, 0],
	[0, 1, 0, 0],
	[0, 2, 0, 0],
	[0, 0, 0, 0]],
	blockTypesEnums.BOZENA: [
	[0, 1, 0, 0],
	[0, 2, 0, 0],
	[0, 0, 0, 0],
	[0, 0, 0, 0]],
	blockTypesEnums.GRAZYNA: [
	[1, 1, 0, 0],
	[0, 2, 0, 0],
	[1, 1, 0, 0],
	[0, 0, 0, 0]],
	blockTypesEnums.IZA: [
	[0, 0, 0, 0],
	[2, 2, 2, 0],
	[0, 0, 0, 0],
	[0, 0, 0, 0]]
	
	}


#func blockTypeToString(blockTypesToString) -> String:
	#var blockTypeString = "NONE"
	#
	#match(blockTypesToString): # if we need to display name
		#0: blockTypeString = "NONE"
		#1: blockTypeString = "I"
		#2: blockTypeString = "O"
		#3: blockTypeString = "T"
		#4: blockTypeString = "J"
		#5: blockTypeString = "L"
		#6: blockTypeString = "S"
		#7: blockTypeString = "Z"
	#return blockTypeString
