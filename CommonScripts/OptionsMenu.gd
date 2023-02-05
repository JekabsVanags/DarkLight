extends Node2D

func _ready():
	self.hide()

func _on_Windowed_toggled(button_pressed):
	OS.window_fullscreen = !OS.window_fullscreen


func _on_Button_pressed():
	self.hide()
	get_parent().get_parent().get_parent().get_node("AnimationPlayer").play_backwards("AnotherPageUI")
