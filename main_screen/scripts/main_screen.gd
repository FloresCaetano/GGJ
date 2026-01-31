extends Control

class_name MainScreen

signal on_game_start
signal on_credits_start

@onready var blur_material: Material = $Blur.material

func _on_start_pressed() -> void:
    on_game_start.emit()

func _on_credits_pressed() -> void:
    on_credits_start.emit()

func _on_exit_pressed() -> void:
    get_tree().quit()

func unblur() -> void:
    blur_material.set_shader_parameter("amount", 0)
