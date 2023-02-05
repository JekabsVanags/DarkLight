extends Node2D

var readyToSkip = false


# Called when the node enters the scene tree for the first time.
func _ready():
	readyToSkip = false
	$AnimationPlayer.play("deg1")
	$RichTextLabel.bbcode_text = "[center]Once the world was full of flames. Burning souls, bringing light and warmth around themselves.[/center]"
func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "deg1":
		$AnimationPlayer.play("ala")
		$RichTextLabel.bbcode_text = "[center]But where there is light, there are shadows. And where there are shadows, there is darkness.[/center]"
	if anim_name == "ala":
		$AnimationPlayer.play("attack")
		$RichTextLabel.bbcode_text = "[center]And whereas light creates shadows, darkness creates nothing. And the darker the shadow, the harder it is for the ligth to shine trough.[/center]"
	if anim_name == "attack":
		get_tree().change_scene("res://Level1/Demo.tscn")

func _process(delta):
	if Input.is_action_just_pressed("ui_accept") && readyToSkip == true:
		get_tree().change_scene("res://Level1/Demo.tscn")
	if Input.is_action_just_pressed("ui_accept") && readyToSkip == false:
		$Skip.visible = true
		$Skip/Timer.start()
		readyToSkip = true

func _on_Skip_pressed():
	get_tree().change_scene("res://Level1/Demo.tscn")

func _on_Timer_timeout():
	$Skip.visible = false
	readyToSkip = false
