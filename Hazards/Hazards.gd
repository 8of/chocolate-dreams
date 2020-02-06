extends Area2D

const DYING_SPEED = 600

var is_dead = false

#func _process(delta):
#	if is_dead:
#		global_position.y += DYING_SPEED * delta
#		rotation_degrees += 5

func hurt():
	is_dead = true
	get_tree().call_group("Gamestate", "coin_up")
	rotation_degrees += 180
	position.y += 50
	if ($AnimatedSprite and $AnimationPlayer):
		$AnimatedSprite.stop()
		$AnimationPlayer.stop()

func _on_Hazard_body_entered(body):
	if is_dead:
		pass
	elif body.name == "Player":
		get_tree().call_group("Gamestate", "hurt")
	elif body.has_method("is_projectile") and body.is_projectile():
		hurt()


func _on_AnimatedSprite_animation_finished():
	pass # Replace with function body.
