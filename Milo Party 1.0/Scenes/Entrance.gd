extends Node2D


func _process(_delta):
	$Bg/Money.text = String(Global.money)


func _on_TicketBtn_pressed():
	if Global.money - 20 >= 0:
		Global.money -= 20
		Global.status = "win"
		Global.task3 = true
		$MoneySound.play()
	else:
		Global.status = "lose"

func _on_TicketBtn_mouse_entered():
	$Bg/Label.modulate = "ff007f"
	$ButtonSound.play()

func _on_TicketBtn_mouse_exited():
	$Bg/Label.modulate = "ffffff"
