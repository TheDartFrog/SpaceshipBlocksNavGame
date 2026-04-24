extends Node


@onready var audioStreamThingy = $AudioStreamPlayer

@onready var menuMusic = preload("uid://fxxynot56q0m")

@onready var mainMusic = preload("uid://dw5sjnnsiw4np")

#@onready var przegralemWGre = preload("")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func switchToMainMusic():
	audioStreamThingy.stream = mainMusic



func switchToLossMusic():
#	audioStreamThingy.stream = przegralemWGre
	print("TODO: add loss music :(")
