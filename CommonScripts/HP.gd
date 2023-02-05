extends Node2D

var animations = AnimationNodeStateMachinePlayback

func _ready():
	animations = $AnimationTree.get("parameters/playback")
	Globals.HP = 5

func _process(delta):
	if Globals.HPloss == true:
		if Globals.HP > 0:
			animations.travel(String(-Globals.HP))
			Globals.HPloss = false
		else:
			animations.travel("0")
			Globals.HPloss = false

	if Globals.HPgain == true:
		animations.travel(String(Globals.HP-1))
		Globals.HPgain = false

func fullHeal():
	animations.travel("-5")
