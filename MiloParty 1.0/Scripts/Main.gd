extends Control


func _ready():
	Global.genesis.play()


func _on_SpeakersButton_pressed():
	if $SpeakersButton/SpeakerOn.visible == true:
		$SpeakersButton/SpeakerOn.visible = false
		$SpeakersButton/SpeakerOff.visible = true
		Global.genesis.stream_paused = true
	else:
		$SpeakersButton/SpeakerOff.visible = false
		$SpeakersButton/SpeakerOn.visible = true
		Global.genesis.stream_paused = false

func _on_QuitBtn_mouse_entered():
	$Quit.modulate = "731dd8"
	$ButtonSound.play()

func _on_QuitBtn_mouse_exited():
	$Quit.modulate = "ffffff"

func _on_StartBtn_mouse_entered():
	$Start.modulate = "731dd8"
	$ButtonSound2.play()

func _on_StartBtn_mouse_exited():
	$Start.modulate = "ffffff"

func _on_QuitBtn_pressed():
	get_tree().quit()

func _on_StartBtn_pressed():
	get_tree().change_scene("res://Scenes/Characters.tscn")

func _on_AboutBtn_mouse_entered():
	$About.modulate = "731dd8"
	$ButtonSound3.play()

func _on_AboutBtn_mouse_exited():
	$About.modulate = "ffffff"

func _on_AboutBtn_pressed():
	get_tree().change_scene("res://Scenes/About.tscn")
