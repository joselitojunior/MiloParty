extends KinematicBody2D

var movement = Vector2.ZERO
var speed = 27
var last_movement
onready var player = $"../Player"
var go = false

func _physics_process(delta):
	if go == true:
		movement = position.direction_to(player.position)
		movement = move_and_slide(movement * speed)

func _on_Area_body_exited(body):
	if body == $"../Player":
		go = true
		Global.npc_nearly = false

func _on_Area2D_body_entered(body):
	if body == $"../Player":
		go = false

func _on_Area_body_entered(body):
	Global.npc_nearly = true
