extends CanvasLayer


func _process(delta):
	if Globals.died == true:
		finalMessage()
	
	if Input.is_action_just_released("ui_cancel"):
		pause()

func _on_Button_pressed():
	$AnimationPlayer.play("PressedKOG")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "PressedKOG":
		get_tree().change_scene("res://Demo/Demo.tscn")

func finalMessage():
	$AnimationPlayer.play("ShowFM")
	$FinalMessage/Button.disabled = false
	$Subtitles.hide()
	Globals.died = false

func pause():
	if Globals.pausedState == 0:
		get_tree().paused = true
		$AnimationPlayer.play("PausedUI")
		Globals.pausedState = 1
	elif Globals.pausedState == 2:
		get_tree().paused = false
		$AnimationPlayer.play_backwards("PausedUI")
		Globals.pausedState = 3

#PAUSE BUTTONS
func _on_PauseResume_pressed():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("PausedUI")
	Globals.pausedState = 3
	
func _on_PauseQuit_pressed():
	$AnimationPlayer.play("AnotherPageUI")
	Globals.anotherPage = true
	Globals.destination = "Quit"
