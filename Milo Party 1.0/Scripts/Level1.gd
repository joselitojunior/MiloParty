extends Node2D

var space_already_pressed = false
var already_win = false

func _ready():
	if Global.personagem == "Kai":
		$Player/Player/Sprite.texture = preload("res://Sprites/Kai.png")
		$Player/Npc/Sprite.texture = preload("res://Sprites/Dudu.png")
	else:
		$Player/Player/Sprite.texture = preload("res://Sprites/Dudu.png")
		$Player/Npc/Sprite.texture = preload("res://Sprites/Kai.png")
	initialAnimation()
	playSong()


func _process(delta):
	if Global.status == "win" and already_win == false:
		yield(get_tree().create_timer(0.5), "timeout")
		already_win = true
		$Entrance.visible = false
		Global.musicVolume("tameimpala")
		$Victory.visible = true
		$VictorySound.play()
		$BackGroundWOpacity.visible = true
		yield(get_tree().create_timer(2.5), "timeout")
		$NextLevelBtn.visible = true
	elif Global.status == "lose":
		$Loss.visible = true
		$BackGroundWOpacity.visible = true
		$Entrance.visible = false
		$Lost.play()
		Global.tameimpala.stop()
		Global.status = null
		Global.money = 27
		Global.task1 = false
		Global.task2 = false
		Global.task3 = false
		yield(get_tree().create_timer(4), "timeout")
		get_tree().reload_current_scene()


func initialAnimation():
	yield(get_tree().create_timer(1.5), "timeout")
	$BgAnimation.play("Background")
	yield(get_tree().create_timer(1.2), "timeout")
	$BackgroundAnimated.visible = false


func playSong():
	yield(get_tree().create_timer(1.5), "timeout")
	Global.crimewave.play()
	Global.crimewave.volume_db = 0
	Global.tameimpala.volume_db = 0


func npcTalk():
	$BackGroundWOpacity.visible = true
	$Talk.visible = true
	$GetOutTalk.visible = true
	

func _on_SpeakersButton_pressed():
	if $SpeakersButton/SpeakerOnBlack.visible == true:
		$SpeakersButton/SpeakerOnBlack.visible = false
		$SpeakersButton/SpeakerOffBlack.visible = true
		Global.crimewave.stream_paused = true
		Global.tameimpala.stream_paused = true
	else:
		$SpeakersButton/SpeakerOffBlack.visible = false
		$SpeakersButton/SpeakerOnBlack.visible = true
		Global.crimewave.stream_paused = false
		Global.tameimpala.stream_paused = false

func _input(event):
	if event.is_action_pressed("space"):
		if Global.task2 == true and space_already_pressed == false:
			space_already_pressed = true
			$Talk.visible = false
			$GetOutTalk.visible = false
			$TalkSound.play()
			$BackGroundWOpacity.visible = true
			$ClockAnimation.play("Scale")
			$ClockSound.play()
			Global.crimewave.volume_db = -17
			yield(get_tree().create_timer(9.1), "timeout")
			$Characters.hide()
			yield(get_tree().create_timer(0.9), "timeout")
			Global.musicVolume("crimewave")
			Global.tameimpala.play()
			$ClockSound.stop()
			$TalkSound.stop()
			$BackGroundWOpacity.visible = false
			$"Characters/Random 1/CollisionShape2D".disabled = true
			$"Characters/Random 2/CollisionShape2D".disabled = true
			$"Characters/Random 3/CollisionShape2D".disabled = true
			$"Characters/Random 4/CollisionShape2D".disabled = true
			$"Characters/Random 8/CollisionShape2D".disabled = true
			$"Characters/Random 9/CollisionShape2D".disabled = true


func _on_TasksBtn_pressed():
	$BackGroundWOpacity.visible = true
	$Tasks.visible = true
	$GetOutTasksBtn1.visible = true
	$GetOutTasksBtn2.visible = true
	$GetOutTasksBtn3.visible = true
	$GetOutTasksBtn4.visible = true

func _on_GetOutTasksBtn1_pressed():
	$BackGroundWOpacity.visible = false
	$Tasks.visible = false
	$GetOutTasksBtn1.visible = false
	$GetOutTasksBtn2.visible = false
	$GetOutTasksBtn3.visible = false
	$GetOutTasksBtn4.visible = false
	$Back.play()

func _on_GetOutTasksBtn2_pressed():
	$BackGroundWOpacity.visible = false
	$Tasks.visible = false
	$GetOutTasksBtn1.visible = false
	$GetOutTasksBtn2.visible = false
	$GetOutTasksBtn3.visible = false
	$GetOutTasksBtn4.visible = false
	$Back.play()

func _on_GetOutTasksBtn3_pressed():
	$BackGroundWOpacity.visible = false
	$Tasks.visible = false
	$GetOutTasksBtn1.visible = false
	$GetOutTasksBtn2.visible = false
	$GetOutTasksBtn3.visible = false
	$GetOutTasksBtn4.visible = false
	$Back.play()

func _on_GetOutTasksBtn4_pressed():
	$BackGroundWOpacity.visible = false
	$Tasks.visible = false
	$GetOutTasksBtn1.visible = false
	$GetOutTasksBtn2.visible = false
	$GetOutTasksBtn3.visible = false
	$GetOutTasksBtn4.visible = false
	$Back.play()

func _on_StoreArea_body_entered(body):
	if body == $Player/Player:
		$BackGroundWOpacity.visible = true
		$Store2.visible = true

func _on_StoreArea_body_exited(body):
	if body == $Player/Player:
		$BackGroundWOpacity.visible = false
		$Store2.visible = false

func _on_LineArea_body_entered(body):
	if body == $Player/Player and $Characters.visible:
		if Global.task1 == true:
			Global.task2 = true
			yield(get_tree().create_timer(4), "timeout")
			npcTalk()

func _on_GetOutTalk_pressed():
	$BackGroundWOpacity.visible = false
	$Talk.visible = false
	$GetOutTalk.visible = false
	$Back.play()

func _on_LineArea_body_exited(body):
	if $Characters.visible == true and Global.task1:
		$Loss.visible = true
		$BackGroundWOpacity.visible = true
		$Talk.visible = false
		$Lost.play()
		$Clock.visible = false
		$TalkSound.stop()
		$ClockSound.stop()
		Global.musicVolume("crimewave")
		Global.musicVolume("tameimpala")
		if body == $Player/Player:
			if Global.task1 == true:
				Global.money = 27
				Global.task1 = false
				Global.task2 = false
				Global.task3 = false
				yield(get_tree().create_timer(4), "timeout")
				get_tree().reload_current_scene()

func _on_EntranceArea_body_entered(body):
	if body == $Player/Player:
		$BackGroundWOpacity.visible = true
		$Entrance.visible = true

func _on_NextLevelBtn_pressed():
	get_tree().change_scene("res://Scenes/Level2.tscn")

func _on_TasksBtn_mouse_entered():
	$ButtonSound.play()
	$TasksBoard.scale = Vector2(0.05, 0.05)

func _on_SpeakersButton_mouse_entered():
	$ButtonSound.play()
	$SpeakersButton/SpeakerOffBlack.scale = Vector2(0.05, 0.05)
	$SpeakersButton/SpeakerOnBlack.scale = Vector2(0.05, 0.05)

func _on_SpeakersButton_mouse_exited():
	$SpeakersButton/SpeakerOffBlack.scale = Vector2(0.04, 0.04)
	$SpeakersButton/SpeakerOnBlack.scale = Vector2(0.04, 0.04)

func _on_TasksBtn_mouse_exited():	
	$TasksBoard.scale = Vector2(0.04, 0.04)
