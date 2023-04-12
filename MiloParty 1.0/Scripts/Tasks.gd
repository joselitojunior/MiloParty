extends Node2D


func _process(delta):
	if Global.task1 == true:
		$Label/Check/ColorRect.visible = true
	if Global.task2 == true:
		$Label/Check2/ColorRect2.visible = true
	if Global.task3 == true:
		$Label/Check3/ColorRect3.visible = true
