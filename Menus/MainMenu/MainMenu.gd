extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_New_Game_pressed():
	var dir = Directory.new()
	if dir.dir_exists("user://Saves"):
		dir.open("user://")
		dir.remove("user://Saves//DarkLight.json")
	get_tree().change_scene("res://Cutscenes/Cutscene1/1aina.tscn")


func _on_Load_Game_pressed():
	SaveFile.loadData()
	get_tree().change_scene(SaveFile.curScene)
