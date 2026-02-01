extends StateMachine

func get_state() -> String:
	return GAMEMANAGER.STATE_EXIT

func update(_delta: float) -> void:
	pass

func enter_state() -> void:
	get_tree().quit()
	pass

func exit_state() -> void:
	pass