class_name MainMenuOrchestrator extends Node

@export var on_exit_animation: String = "main_menu/on_exit"

@onready var anim: AnimationPlayer = $AnimationPlayer
@onready var menu: MainScreen = $MainScreen

signal on_button_clicked(event: String)

const EVENT_GAME: String = "game"
const EVENT_CREDIT: String = "credits"
const EVENT_EXIT: String = "exit"

func _ready() -> void:
	menu.on_game.connect(_game_start)


func _game_start() -> void:
	on_button_clicked.emit(EVENT_GAME)

func _credit_start() -> void:
	on_button_clicked.emit(EVENT_CREDIT)

func _exit_start() -> void:
	on_button_clicked.emit(EVENT_EXIT)

func close_menu() -> void:
	anim.play(on_exit_animation)
