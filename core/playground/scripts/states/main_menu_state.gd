extends StateMachine

@export var main_menu: MainMenuOrchestrator

func _ready() -> void:
	super._ready()
	main_menu.on_button_clicked.connect(_on_button_clicked_event)

func _on_button_clicked_event(event: String) -> void:
	match event:
		main_menu.EVENT_GAME:
			_set_next_transition(GAMEMANAGER.STATE_GAMEPLAY)
		main_menu.EVENT_CREDIT:
			_set_next_transition(GAMEMANAGER.STATE_CREDITS)
		main_menu.EVENT_EXIT:
			_set_next_transition(GAMEMANAGER.STATE_EXIT)
		var _default:
			_set_next_transition(get_state())

func update(_delta: float) -> void:
	pass

func get_state() -> String:
	return GAMEMANAGER.STATE_MAIN_MENU

func enter_state() -> void:
	pass

func exit_state() -> void:
	_next_transition = get_state()
	main_menu.close_menu()
