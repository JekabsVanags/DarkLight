extends Node2D

func _ready():
#loading the data
	SaveFile.loadData()
	SaveFile.curScene = "res://Level1/Demo.tscn"

	$Dragger_Level1.hide()
	$BackgroundAccents/ParallaxLayer/circles/AnimationPlayer.play("rotating_idle")
	if SaveFile.LV1cutscene1Seen == false:
		$Events/AnimationPlayer.play("cutscene1")
		SaveFile.LV1cutscene1Seen = true
		$UI/Subtitles.text = "Vilage destoryed, darkness coming. Cold creeping and embers dying."
		$UI/Subtitles/AnimationPlayer.play("Subtitles_show")
		$Player.knockback = true
		Globals.dataSave()

#checking if nexuses have been activated
	if SaveFile.LV1Nexus1Active == true:
		$Nexus1.isLight = true
		$Nexus1.z_index = 1
		$Nexus1/AnimatedSprite.play("Light")
		$Nexus1/Light2D.enabled = true
	if SaveFile.LV1Nexus2Active == true:
		$Nexus2.isLight = true
		$Nexus2.z_index = 1
		$Nexus2/AnimatedSprite.play("Light")
		$Nexus2/Light2D.enabled = true
	if SaveFile.LV1Nexus3Active == true:
		$Nexus3.isLight = true
		$Nexus3.z_index = 1
		$Nexus3/AnimatedSprite.play("Light")
		$Nexus3/Light2D.enabled = true


func _process(delta):
	#checking if nexus is activated to send info to event controll
	if $Nexus1.isLight == true:
		SaveFile.LV1Nexus1Active = true
	if $Nexus2.isLight == true:
		SaveFile.LV1Nexus2Active = true
	if $Nexus3.isLight == true:
		SaveFile.LV1Nexus3Active = true

	$UI/Subtitles.bbcode_text = "[center]"+$UI/Subtitles.text+"[/center]"

	if Globals.damaged == true && SaveFile.LV1firstHitTriggered != true:
		$UI/Subtitles.text = "The lazy darkness, lying in wait, for its pray comes to it, cought a taste of the flame."
		$UI/Subtitles/AnimationPlayer.play("Subtitles_show")
		SaveFile.LV1firstHitTriggered = true;

func _on_Scene1_body_exited(body):
	if "Player" in body.name && SaveFile.LV1scene1Triggered != true:
		$Dragger_Level1.show()
		$Dragger_Level1/Dragger_Spike1/Dragger_Spike4/AnimationPlayer.play("Scene_1")
		$Events/Scene1.queue_free()
		$UI/Subtitles.text = "The last Flame, lost in the dark. Running form a shadow, looking for light."
		$UI/Subtitles/AnimationPlayer.play("Subtitles_show")
		SaveFile.LV1scene1Triggered = true;


func _on_Scene2_body_entered(body):
	if "Player" in body.name && SaveFile.LV1scene2Triggered != true:
		$Dragger_Level1.show()
		$Dragger_Level1/Dragger_Spike1/Dragger_Spike4/AnimationPlayer.play("Scene_2")
		$Events/Scene2.queue_free()
		$UI/Subtitles.text = "Unknow is wheather the shadow had glimpsed its light, or was as blind, as it made others."
		$UI/Subtitles/AnimationPlayer.play("Subtitles_show")
		SaveFile.LV1scene2Triggered = true;


func _on_Scene3_body_entered(body):
	if "Player" in body.name && SaveFile.LV1scene3Triggered != true:
		$Dragger_Level1.show()
		$Dragger_Level1/Dragger_Spike1/Dragger_Spike4/AnimationPlayer.play("Scene_3")
		$Events/Scene3.queue_free()
		$UI/Subtitles.text = "But the flame knew, it had to get below the village. Where its light would not pierce the dark."
		$UI/Subtitles/AnimationPlayer.play("Subtitles_show")
		SaveFile.LV1scene3Triggered = true;


func _on_Scene4_body_entered(body):
	if "Player" in body.name && SaveFile.LV1scene4Triggered != true:
		$Dragger_Level1.show()
		$Dragger_Level1/Dragger_Spike1/Dragger_Spike4/AnimationPlayer.play("Scene_4")
		$Events/Scene4.queue_free()
		SaveFile.LV1scene4Triggered = true

func _on_Scene5_body_entered(body):
	if "Player" in body.name && SaveFile.LV1scene5Triggered != true:
		$UI/Subtitles/AnimationPlayer.play("Subtitles_show")
		$UI/Subtitles.text = "The tinder forrest, now only few saplings left, the rest- shriveled and dark."


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Scene_4":
		$Dragger_Level1.show()
		$UI/Subtitles.text = "The last Flame, escaped. The Flame, exhausted, lying next to the Nexus of its kind."
		$UI/Subtitles/AnimationPlayer.play("Subtitles_show")
		$Dragger_Level1.hide()
	elif anim_name == "cutscene1":
		$Player.knockback = false
	else:
		$Dragger_Level1.hide()

func _on_Timer_timeout():
	$Player.global_position = Vector2(7268,1739)
	Globals.playerLoc = Vector2(7268,1739)
	get_tree().change_scene("res://Level2/UnburningForest.tscn")


func _on_Scene6_body_entered(body):
	if "Player" in body.name:
		$UI/Subtitles.text = "For there was a place that its people might have gone. A single place of hope, in forest of dark."
		$UI/Subtitles/AnimationPlayer.play("Subtitles_show")
		$Events/Scene6/Timer.start()
