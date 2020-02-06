extends Control

func _input(event):
	if Input.is_action_pressed("jump") or Input.is_action_pressed("jump_shit"):
		restart()
		
func restart():
	var e = get_tree().change_scene("res://Levels/Level1.tscn")
	assert(e == 0)

func _on_RestartButton_pressed():
	restart()
