extends Node
var burning = false
var playerInProximity = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("notBurning")

func _process(delta):
	if playerInProximity == true && burning == false && Globals.burning == true: 
		$AnimatedSprite.play("startingBurn")
		$AnimationPlayer.play("lightUp")
		burning = true

func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "startingBurn":
		$AnimatedSprite.play("Burning")


func _on_Area2D_body_entered(body):
	if "Player" in body.name:
		playerInProximity = true

func _on_Area2D_body_exited(body):
	if "Player" in body.name:
		playerInProximity = false
