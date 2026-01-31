extends CharacterBody2D

@export var mask_sprite: Sprite2D

func set_mask(new_mask: MaskItem):
	mask_sprite.texture = new_mask.texture
