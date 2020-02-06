extends KinematicBody2D

const SPEED = 600
const GRAVITY = 100 # temp, was 200
const UP = Vector2(0,-1)
const JUMP_SPEED = 2000
const WORLD_LIMIT = 3000 # in px
const BOOST_MULTIPLIER = 1.5

onready var JumpSFX = $JumpSFX
onready var PainSFX = $PainSFX

signal animate

var motion = Vector2(0,0)

func _physics_process(delta):
	apply_gravity()
	jump()
	move()
	animate()
	move_and_slide(motion, UP)

func apply_gravity():
	if position.y > WORLD_LIMIT:
		end_game()
	if is_on_floor() and motion.y > 0:
		motion.y = 0
	elif is_on_ceiling():
		motion.y = 1
	else:
		motion.y += GRAVITY

func jump():
	if (Input.is_action_pressed("jump") or Input.is_action_pressed("jump_shit")) and is_on_floor():
		motion.y -= JUMP_SPEED
		JumpSFX.play()
	elif Input.is_action_pressed("jump_shit") and not is_on_floor():
		shoot()
	elif Input.is_action_just_pressed("jump") and not is_on_floor():
		shoot()
		

func move():
	if Input.is_action_pressed("left") and Input.is_action_pressed("right"):
		pass
	elif Input.is_action_pressed("left"):
		motion.x = -SPEED
	elif Input.is_action_pressed("right"):
		motion.x = SPEED
	else:
		motion.x = 0

func animate():
	emit_signal("animate", motion)

func hurt():
	position.y -= 1
	yield(get_tree(), "idle_frame")
	motion.y = -JUMP_SPEED
	PainSFX.play()

func boost():
	position.y -= 1
	yield(get_tree(), "idle_frame")
	motion.y = - BOOST_MULTIPLIER * JUMP_SPEED

func shoot():
	add_child(load("res://Projectiles/Poo.tscn").instance())

func end_game():
	get_tree().call_group("Gamestate", "end_game")
