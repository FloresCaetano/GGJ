class_name Mask
extends Control

@export var mask_item : MaskItem
var mask_inventory : MaskInventory
@export var texture_rect: TextureRect

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
		
		$"../../../BG".visible = false
		tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
		tween.tween_property(self, "global_position", PATHS.mask_slot.global_position, 1.0)
		await tween.finished
		

func _on_mouse_entered() -> void:
	if tween: tween.stop()
	tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "scale", scaled_size, 0.5)


func _on_mouse_exited() -> void:
	if tween: tween.stop()
	tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "scale", Vector2.ONE, 0.5)
