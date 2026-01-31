extends Node

@export var main_screen_scene: MainScreen
@export var main_screen_audio: AudioStreamPlayer2D

func _ready() -> void:
	get_tree().paused = true

func _on_main_screen_on_game_start() -> void:
	main_screen_scene.unblur()
	main_screen_scene.hide()
	main_screen_audio.stop()
	get_tree().paused = false
