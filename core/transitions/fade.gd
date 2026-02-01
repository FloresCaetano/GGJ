class_name Fade extends CanvasLayer

@export var fade_in_animation: String = "transition/fade_in"
@export var fade_out_animation: String = "transition/fade_out"

@onready var color_rect: ColorRect = $ColorRect
@onready var anim: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	print(color_rect)
	color_rect.visible = false
	anim.animation_finished.connect(_on_animation_finished)

func fade_in() -> void:
	color_rect.visible = true
	anim.play(fade_in_animation)
	await anim.animation_finished
	
func fade_out() -> void:
	color_rect.visible = true
	anim.play(fade_out_animation)
	await anim.animation_finished


func _on_animation_finished(anim_name: String) -> void:
	if anim_name == fade_in_animation:
		color_rect.visible = false
