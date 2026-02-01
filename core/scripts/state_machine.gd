@abstract
class_name StateMachine extends Node

func _ready() -> void:
    _next_transition = get_state()

var next_transition: String:
    get:
        return _next_transition

var _next_transition: String = ""

func _set_next_transition(state: String) -> void:
    _next_transition = state

@abstract func update(delta: float) -> void

@abstract func get_state() -> String

@abstract func enter_state() -> void

@abstract func exit_state() -> void

func transition_to() -> String:
    return _next_transition