class_name StateManager extends Node

var states: Dictionary[String, StateMachine] = {}
var current_state: String = ""

var is_transitioning: bool = false

func _ready() -> void:
	var children = get_children()
	for child in children:
		if child is StateMachine:
			if current_state == "":
				current_state = child.get_state()
			states[child.get_state()] = child

func _process(delta: float) -> void:
	var next_state: String = states[current_state].transition_to()
	if !is_transitioning && next_state == current_state:
		states[current_state].update(delta)
	elif !is_transitioning:
		print(next_state)
		_transition_to_state(next_state)

func _transition_to_state(new_state: String) -> void:
	is_transitioning = true

	states[current_state].exit_state()
	await states[current_state].exit_finished

	current_state = states[new_state].get_state()
	
	states[current_state].enter_state()
	await states[current_state].enter_finished

	is_transitioning = false
