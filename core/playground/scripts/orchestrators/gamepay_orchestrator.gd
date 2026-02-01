extends Node2D

class_name GameplayOrchestrator

@export var begin_animation: String = "gameplay_manager/begin"
@export var first_scene: FirstScene

@onready var anim: AnimationPlayer = $AnimationPlayer

func start_gameplay() -> void:
	visible = true
	anim.play(begin_animation)
	await anim.animation_finished
	first_scene.start_scene()

func end_gameplay() -> void:
	first_scene.end_scene()
	visible = false
