extends StateMachine

@export var gameplay: GameplayOrchestrator

func get_state() -> String:
	return GAMEMANAGER.STATE_GAMEPLAY

func update(_delta: float) -> void:
	pass

func enter_state() -> void:
	gameplay.start_gameplay()
	pass

func exit_state() -> void:
	gameplay.end_gameplay()
	pass
