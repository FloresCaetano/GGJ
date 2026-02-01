extends Control

class_name FirstScene

func start_scene():
	PATHS.interactor.collision_mask = 0b100000000
	PATHS.player.can_move = true
	$AudioStreamPlayer.play()

func end_scene():
	PATHS.interactor.collision_mask = 0
	PATHS.player.can_move = false
	$AudioStreamPlayer.stop()
