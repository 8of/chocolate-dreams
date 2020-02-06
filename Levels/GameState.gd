extends Node2D

var lives = 3
var coins = 0
var target_number_of_coins = 10

func _ready():
	add_to_group("Gamestate")
	update_GUI()

func coin_up():
	coins += 1
	get_tree().call_group("GUI", "update_coins", coins)

	var multiple_of_coins = (coins % target_number_of_coins) == 0
	if multiple_of_coins:
		life_up()

func hurt():
	lives -= 1
	$Player.hurt()
	update_GUI()
	if lives < 0:
		end_game()

func life_up():
	lives += 1
	update_GUI()

func update_GUI():
	var e = get_tree().call_group("GUI", "update_lives", lives)
	assert(e == null)

func end_game():
	var e = get_tree().change_scene("res://Levels/EndGame.tscn")
	assert(e == 0)

func win_game():
	var e = get_tree().change_scene("res://Levels/Victory.tscn")
	assert(e == 0)
