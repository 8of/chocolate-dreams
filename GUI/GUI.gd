extends CanvasLayer

onready var CoinCount = $Control/TextureRect/HBoxContainer/HBoxContainerLeft/CoinCount
onready var LifeCount = $Control/TextureRect/HBoxContainer/HBoxContainerRight/LifeCount

func _ready():
	pass

func update_lives(lives):
	LifeCount.text = str(lives)

func update_coins(coins):
	CoinCount.text = str(coins)
