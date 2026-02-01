class_name MainMenuOrchestrator extends CanvasLayer

@export var on_exit_animation: String = "main_menu/on_exit"
@export var on_enter_animation: String = "main_menu/on_enter"

@onready var anim: AnimationPlayer = $AnimationPlayer
@onready var menu: MainScreen = $MainScreen

signal on_button_clicked(event: String)

const EVENT_GAME: String = "game"
const EVENT_CREDIT: String = "credits"
const EVENT_EXIT: String = "exit"

func _ready() -> void:
	menu.on_game.connect(_game_start)
	menu.on_credits.connect(_credit_start)
	menu.on_exit.connect(_exit_start)


func _game_start() -> void:
	on_button_clicked.emit(EVENT_GAME)

func _credit_start() -> void:
	on_button_clicked.emit(EVENT_CREDIT)

func _exit_start() -> void:
	on_button_clicked.emit(EVENT_EXIT)

func open_menu() -> void:
	anim.play(on_enter_animation)
	await anim.animation_finished

func close_menu() -> void:
	anim.play(on_exit_animation)
	await anim.animation_finished
