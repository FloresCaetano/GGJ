extends Area2D

class_name Interactor

@export var interaction_group: String = "interactable"

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

var current_interactable = null

func _on_body_entered(body) -> void:
	if body.is_in_group(interaction_group):
		current_interactable = body

func _on_body_exited(body) -> void:
	if body == current_interactable:
		current_interactable = null

func interact(can_interact: bool) -> void:
	if current_interactable and can_interact:
		print("Hi! I'm interacting!")
