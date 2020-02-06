extends Control

func _input(event):
	if Input.is_action_pressed("jump") or Input.is_action_pressed("shit_jump"):
		restart()

func restart():
	var e = get_tree().change_scene("res://Levels/Level1.tscn")
	assert(e == 0)
