extends Node2D

class_name GameplayOrchestrator

@export var begin_animation: String = "gameplay_manager/begin"

@onready var anim: AnimationPlayer = $AnimationPlayer

func start_gameplay() -> void:
	visible = true
	anim.play(begin_animation)
	await anim.animation_finished

func end_gameplay() -> void:
	visible = false
