extends Area2D
var isLight = false

func _ready():
	if isLight == false:
		$AnimatedSprite.play("notLight")
		$Light2D.enabled = false
		$Light2D2.enabled = true
		$AnimatedSprite.modulate = Color(0.42,0.24,0.24,1)
		z_index = -1

func _on_save1_bonfire_body_entered(body):
	if "Player" in body.name:
		if isLight == false:
			$AnimatedSprite.modulate = Color(1,1,1,1)
			$AnimatedSprite.play("Lighting")
			$Light2D2.enabled = false
			$Light2D.enabled = true
			isLight = true
		if Globals.HP < Globals.MaxHP:
			Globals.HPgain = true
			Globals.HP = Globals.MaxHP;
		Globals.dataSave()


func _on_AnimatedSprite_animation_finished():
	if isLight == true:
		$AnimatedSprite.play("Light")
		z_index = 1


func _on_Nexus1_body_exited(body):
	if "Player" in body.name:
			Globals.dataSave()
