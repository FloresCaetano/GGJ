extends Node

class_name GameplayOrchestrator

@export var begin_animation: String = "gameplay_manager/begin"

@onready var anim: AnimationPlayer = $AnimationPlayer

func start_gameplay() -> void:
    print(begin_animation)
    anim.play(begin_animation)
    pass

func end_gameplay() -> void:
    pass