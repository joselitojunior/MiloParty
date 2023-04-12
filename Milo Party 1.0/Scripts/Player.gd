extends KinematicBody2D

var movement = Vector2.ZERO
var speed = 27
var last_movement

func _physics_process(delta):
	movement.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	movement.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	if movement.x != 0 and movement.y == 0:
		$Sprite.scale.x = movement.x
	if movement.y == 1:
		$Animation.play("Down")
		last_movement = "down"
	elif movement.y == -1:
		$Animation.play("Up")
		last_movement = "up"
	elif movement.x == 1 or movement.x == -1:
		$Animation.play("Right")
		if movement.x == 1:
			last_movement = "right"
		else:
			last_movement = "left"
	if movement == Vector2.ZERO:
		$Animation.stop()
		if last_movement == "up":
			$Sprite.frame = 3
		elif last_movement == "down":
			$Sprite.frame = 0
		elif last_movement == "right":
			$Sprite.frame = 6
			$Sprite.scale.x = 1
		elif last_movement == "left":
			$Sprite.frame = 6
			$Sprite.scale.x = -1
	movement = move_and_slide(movement * speed)
