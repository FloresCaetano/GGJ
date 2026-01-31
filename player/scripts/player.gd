extends CharacterBody2D

@export var mask_sprite: Sprite2D

@export var left_input: String = "ui_left"
@export var right_input: String = "ui_right"
@export var up_input: String = "ui_up"
@export var down_input: String = "ui_down"

@export var interaction_input: String = "ui_accept"

@onready var interactor: Interactor = $Interactor

@export var speed: float = 10000
func set_mask(new_mask: MaskItem):
	mask_sprite.texture = new_mask.texture

func _physics_process(_delta: float) -> void:
	velocity = _move_character(Input.get_vector(left_input, right_input, up_input, down_input), velocity)
	interactor.interact(Input.is_action_just_pressed(interaction_input))
	move_and_slide()

func _move_character(input: Vector2, current_velocity: Vector2) -> Vector2:
	if input != Vector2.ZERO:
		return input * speed
	else:
		return Vector2(move_toward(current_velocity.x, 0, speed), move_toward(current_velocity.y, 0, speed))
