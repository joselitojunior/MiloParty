extends Control


func _ready():
	Global.genesis.stop()


func _on_BackBtn_pressed():
	get_tree().change_scene("res://Scenes/Main.tscn")



func _on_BackBtn_mouse_entered():
	pass # Replace with function body.
