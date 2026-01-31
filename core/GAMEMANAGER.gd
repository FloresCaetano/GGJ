extends Node

var selected_mask: MaskItem = null

var current_player_hue = 0.0
var current_background_hue = 0.0

signal mask_selected
func _on_mask_selected(mask : MaskItem):
	mask_selected.emit(mask)
