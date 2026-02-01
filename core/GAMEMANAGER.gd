extends Node

const STATE_MAIN_MENU: String = "MAIN_MENU"
const STATE_GAMEPLAY: String = "STATE_GAMEPLAY"
const STATE_CREDITS: String = "CREDITS"
const STATE_EXIT: String = "EXIT"

var selected_mask: MaskItem = null

var current_player_hue = 0.0
var current_background_hue = 0.0

signal mask_selected
func _on_mask_selected(mask : MaskItem):
	mask_selected.emit(mask)
