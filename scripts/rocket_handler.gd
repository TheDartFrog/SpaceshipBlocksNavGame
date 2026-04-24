extends Node2D
class_name Rocket

var can_move: bool = false
var current_path: Array = []
var speed = 150.0

func _process(_delta: float) -> void:
	if !can_move:
		return
	moving()

func start_moving(path: Array):
	current_path = path
	global_position = path.front()
	can_move = true

func moving():
	if !current_path.is_empty():
		var target_position = current_path.front() + Vector2(15.0,15.0)
		global_position = global_position.move_toward(target_position, speed * get_process_delta_time())
		if global_position == target_position && !current_path.is_empty():
			current_path.pop_front()
		elif current_path.is_empty():
			can_move = false
	else:
		can_move = false
		SignalBus.rocket_finished.emit()
