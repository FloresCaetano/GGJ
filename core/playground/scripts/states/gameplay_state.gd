extends StateMachine

@export var gameplay: GameplayOrchestrator
@export var fade: Fade

func get_state() -> String:
	return GAMEMANAGER.STATE_GAMEPLAY

func update(_delta: float) -> void:
	pass

func enter_state() -> void:
	await gameplay.start_gameplay()
	enter_finished.emit()
	await fade.fade_in()

func exit_state() -> void:
	gameplay.end_gameplay()
	await fade.fade_out()
