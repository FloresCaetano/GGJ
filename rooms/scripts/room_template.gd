class_name Room
extends Control

@export var scene_set : Array[MaskItem]
@export var images : Array[TextureRect]
@onready var mask_inventory : MaskInventory = get_tree().get_first_node_in_group("mask_inventory")


func _ready() -> void:
	mask_inventory.reload_masks(scene_set)
	for image in images:
		image.material = load("res://shared/shaders/hue_controller_mat.tres").duplicate()
