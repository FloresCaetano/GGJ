extends Node

@export var main_screen_scene: MainScreen
@export var main_screen_audio: AudioStreamPlayer2D
@export var start_paused: bool = true

func _ready() -> void:
	get_tree().paused = start_paused
	main_screen_scene.visible = start_paused
	main_screen_audio.visible = start_paused

func _on_main_screen_on_game_start() -> void:
	main_screen_scene.unblur()
	main_screen_scene.hide()
	main_screen_audio.stop()
	get_tree().paused = false
