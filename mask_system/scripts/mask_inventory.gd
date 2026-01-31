class_name MaskInventory
extends Control

@export var mask_container: GridContainer
var masks : Array[Mask] = []

var active_mask : Mask

func _ready() -> void:
	PATHS.mask_inventory = self

func mask_select_animation(mask : Mask):
	close()
	var placeholder : Mask = mask.duplicate()
	placeholder.set_script(null)
	get_tree().current_scene.add_child(placeholder)
	placeholder.pivot_offset = Vector2.ZERO
	var tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property(placeholder, "global_position", PATHS.mask_slot.global_position, 1.0)
	var tween2 = get_tree().create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween2.tween_property(placeholder, "scale", Vector2(0.4, 0.4), 1.0)
	await tween.finished
	PATHS.player.set_mask(placeholder)
	placeholder.queue_free()

func reload_masks(scene_set : Array[MaskItem]):
	if mask_container.get_child_count() > 0:
		for mask in mask_container.get_children():
			mask.queue_free()
	
	for i in range(scene_set.size()):
		var mask_scene = load("uid://fav75tua3y7t")
		var s_mask : Mask = mask_scene.instantiate()
		s_mask.mask_item = scene_set[i]
		s_mask.mask_inventory = self
		mask_container.add_child(s_mask)
		s_mask.load_image()

func open():
	visible = true

func close():
	visible = false
