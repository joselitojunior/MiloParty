extends Control


func _on_DuduBtn_pressed():
	$KaiBtn.visible = false
	$DuduBtn.rect_position = Vector2(54, 90)
	$Play.visible = true
	$Label.text = "Character: Dudu"
	$Back.visible = true
	$Label.rect_position = Vector2(15, 67)
	$ButtonSound.volume_db = -80
	Global.personagem = "Dudu"

func _on_KaiBtn_pressed():
	$DuduBtn.visible = false
	$KaiBtn.rect_position = Vector2(54, 90)
	$Play.visible = true
	$Label.text = "Character: Kai"
	$Back.visible = true
	$Label.rect_position = Vector2(15, 67)
	$ButtonSound2.volume_db = -80
	Global.personagem = "Kai"

func _on_BackBtn_pressed():
	get_tree().reload_current_scene()
	$Back.visible = false

func _on_DuduBtn_mouse_entered():
	$ButtonSound.play()

func _on_KaiBtn_mouse_entered():
	$ButtonSound2.play()

func _on_PlayBtn_pressed():
	Global.musicVolume("genesis")
	get_tree().change_scene("res://Scenes/Level1.tscn")

func _on_PlayBtn_mouse_entered():
	$Play.scale = Vector2(0.045, 0.045)
	$ButtonSound3.play()

func _on_PlayBtn_mouse_exited():
	$Play.scale = Vector2(0.038, 0.038)

func _on_SpeakersButton_pressed():
	if $SpeakersButton/SpeakerOn.visible == true:
		$SpeakersButton/SpeakerOn.visible = false
		$SpeakersButton/SpeakerOff.visible = true
		Global.genesis.stream_paused = true
	else:
		$SpeakersButton/SpeakerOff.visible = false
		$SpeakersButton/SpeakerOn.visible = true
		Global.genesis.stream_paused = false
