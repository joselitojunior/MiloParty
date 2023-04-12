extends Node2D

var money = Global.money

func _process(delta):
	$Bg/Money.text = String(money)

func _on_OusadiaBtn_pressed():
	if money - 7 >= 0:
		money -= 7
		$MoneySound.play()
		Global.task1 = true
		Global.money = money
	

func _on_IceBtn_pressed():
	if money - 10 >= 0:
		money -= 10
		$MoneySound.play()
		Global.task1 = true
		Global.money = money

func _on_OusadiaBtn_mouse_entered():
	$Bg/Ousadia.modulate = "ff007f"
	$ButtonSound.play()

func _on_OusadiaBtn_mouse_exited():
	$Bg/Ousadia.modulate = "ffffff"

func _on_IceBtn_mouse_entered():
	$Bg/Ice.modulate = "ff007f"
	$ButtonSound2.play()

func _on_IceBtn_mouse_exited():
	$Bg/Ice.modulate = "ffffff"
