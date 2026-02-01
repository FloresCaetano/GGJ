class_name Fade extends CanvasLayer

@export var fade_in_animation: String = "transition/fade_in"
@export var fade_out_animation: String = "transition/fade_out"

@onready var color_rect: ColorRect = $ColorRect
@onready var anim: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	color_rect.visible = false
	anim.animation_finished.connect(_on_animation_finished)

func fade_in() -> void:
	color_rect.visible = true
	anim.play(fade_in_animation)
	
func fade_out() -> void:
	color_rect.visible = true
	anim.play(fade_out_animation)


func _on_animation_finished(_anim_name: String) -> void:
	color_rect.visible = false
