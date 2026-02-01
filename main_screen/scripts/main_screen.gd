extends Control

class_name MainScreen

signal on_game
signal on_credits
signal on_exit

func _on_start_pressed() -> void:
    on_game.emit()

func _on_credits_pressed() -> void:
    on_credits.emit()

func _on_exit_pressed() -> void:
    on_exit.emit()