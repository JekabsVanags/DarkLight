extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	SaveFile.loadData()
	if SaveFile.LV2Nexus1Active != true:
		print("this")
		$Player.global_position = Vector2(7268,1739)

func _process(delta):
	if $Nexus1.isLight == true:
		SaveFile.LV2Nexus1Active = true
	if $Nexus2.isLight == true:
		SaveFile.LV2Nexus2Active = true
	if $Nexus3.isLight == true:
		SaveFile.LV2Nexus3Active = true
