extends Node2D


func _ready():
	if Global.personagem == "Kai":
		$Sprite.texture = preload("res://Sprites/Dudu.png")
	else:
		$Sprite.texture = preload("res://Sprites/Kai.png")
