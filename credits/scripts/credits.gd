extends Control

@export var authors: Array[String] = []
@onready var credit_container: BoxContainer = %CreditContainer


var template: Control

func _ready() -> void:
	var child = credit_container.get_child(0)
	if "text" in child:
		template = child
		template.visible = false

	init_credits()

func init_credits() -> void:
	for child in credit_container.get_children():
		if child != template:
			child.queue_free()
	
	for author in authors:
		var instance = template.duplicate(DUPLICATE_SIGNALS | DUPLICATE_GROUPS)
		instance.text = author
		instance.visible = true
		credit_container.add_child(instance)
