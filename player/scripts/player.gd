class_name Player
extends CharacterBody2D

@export var mask_slot: Node2D

@export var left_input: String = "ui_left"
@export var right_input: String = "ui_right"
@export var up_input: String = "ui_up"
@export var down_input: String = "ui_down"

@export var animated_sprite_2d: AnimatedSprite2D


@export var interaction_input: String = "ui_accept"

@onready var interactor: Interactor = $Interactor

@export var speed: float = 10000

var can_move : bool = false

func _ready() -> void:
	PATHS.player = self

func set_mask(new_mask):
	new_mask.position = Vector2.ZERO
	mask_slot.add_child(new_mask)


func _physics_process(_delta: float) -> void:
	velocity = _move_character(Input.get_vector(left_input, right_input, up_input, down_input), velocity)
	interactor.interact(Input.is_action_just_pressed(interaction_input))
	if can_move:
		move_and_slide()

func set_anim(input : Vector2):
	animated_sprite_2d.play("walking")
	if input.x > 0:
		animated_sprite_2d.scale.x = 0.4
	else:
		animated_sprite_2d.scale.x = -0.4
	

func _move_character(input: Vector2, current_velocity: Vector2) -> Vector2:
	if input != Vector2.ZERO:
		if not $AudioStreamPlayer2D.playing:
			$AudioStreamPlayer2D.play()
		set_anim(input)
		return input * speed
	else:
		$AudioStreamPlayer2D.stop()
		animated_sprite_2d.play("idle")
		return Vector2(move_toward(current_velocity.x, 0, speed), move_toward(current_velocity.y, 0, speed))
