extends Control

class_name MainScreen

@export var start_input: String = "ui_accept"
@export var game_scene: PackedScene

func _unhandled_input(event: InputEvent) -> void:
    if event.is_action_pressed(start_input):
        get_tree().change_scene_to_packed(game_scene)