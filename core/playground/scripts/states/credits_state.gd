extends StateMachine

@export var canvas: CanvasLayer
@export var timer: Timer
@export var fade: Fade

func _ready() -> void:
	super._ready()
	timer.timeout.connect(_on_timeout)

func _on_timeout() -> void:
	_set_next_transition(GAMEMANAGER.STATE_MAIN_MENU)

func get_state() -> String:
	return GAMEMANAGER.STATE_CREDITS

func update(_delta: float) -> void:
	pass

func enter_state() -> void:
	await  fade.fade_in()
	canvas.visible = true
	timer.start()
	enter_finished.emit()

func exit_state() -> void:
	await fade.fade_out()
	canvas.visible = false
	exit_finished.emit()
