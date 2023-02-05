extends Node2D

var animation = AnimationNodeStateMachinePlayback

func _ready():
	animation = $AnimationPlayer/AnimationTree.get("parameters/playback")
	
func _process(delta):
	animation.travel("Idle")
	if Globals.playerLoc.x > global_position.x:
		$Sprite.flip_h = false
	else:
		$Sprite.flip_h = true

func _on_HarmAreadamage_body_entered(body):
	if "Player" in body.name:
		if $Sprite.flip_h == true:
			animation.travel("AttackL")
		elif $Sprite.flip_h == false:
			animation.travel("AttackR")

