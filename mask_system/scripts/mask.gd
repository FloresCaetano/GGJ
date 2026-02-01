class_name Mask
extends Control

var mask_inventory : MaskInventory
@export var mask_item : MaskItem
@export var texture_rect: TextureRect
@export var audio_stream_player_2d: AudioStreamPlayer2D

@onready var hover_sound : AudioStream = load("uid://c43sowi52rysn")
@onready var select_sound : AudioStream = load("uid://b3mfcglt6opv3")

var backgrounds: Array[Node]:
	get:
		return get_tree().get_nodes_in_group("background")

@onready var player = get_tree().get_first_node_in_group("player")

@onready var scaled_size : Vector2 = Vector2(1.2, 1.2)

#FLAGS
var is_being_dragged : bool = false
var original_position : Vector2
var is_on_drop_area : bool = false

var tween : Tween

signal mask_selected

func _ready() -> void:
	mask_selected.connect(GAMEMANAGER._on_mask_selected)

func load_image():
	texture_rect.texture = mask_item.texture

func _on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click"):
		GAMEMANAGER.selected_mask = mask_item
		GAMEMANAGER.current_player_hue += mask_item.player_value
		GAMEMANAGER.current_background_hue += mask_item.scene_value
		for background in backgrounds:
			background.material.set_shader_parameter("hue", GAMEMANAGER.current_background_hue)
		player.material.set_shader_parameter("hue", GAMEMANAGER.current_player_hue)
		
		mask_selected.emit(mask_item)
		
		mask_inventory.mask_select_animation(self)
		
		audio_stream_player_2d.stream = select_sound
		audio_stream_player_2d.play()
		await audio_stream_player_2d.finished
		
		queue_free()
		

func _on_mouse_entered() -> void:
	if tween: tween.stop()
	tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "scale", scaled_size, 0.5)
	audio_stream_player_2d.stream = hover_sound
	audio_stream_player_2d.play()


func _on_mouse_exited() -> void:
	tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "scale", Vector2.ONE, 0.5)
