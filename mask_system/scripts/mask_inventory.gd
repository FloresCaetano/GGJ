class_name MaskInventory
extends Control

@export var mask_container: GridContainer
var masks : Array[Mask] = []

var active_mask : Mask

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
