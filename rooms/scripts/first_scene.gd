extends Control

func start_scene():
	PATHS.interactor.collision_mask = 0b100000000
	PATHS.player.can_move = true
	$AudioStreamPlayer.play()
