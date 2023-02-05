extends KinematicBody2D

const GRAVITY = 24
var speed = 6
var jump = 11
var movement = Vector2()

var canShine = true
var knockback = false
var killed = false

func _ready():
	var dir = Directory.new()
	if !dir.dir_exists("user://Saves"):
		dir.open("user://")
		dir.make_dir("user://Saves")
	
	var file = File.new()
	var dataStorage = {}
	if file.file_exists("user://Saves/DarkLight.json"):
		file.open("user://Saves/DarkLight.json", File.READ)
		dataStorage = parse_json(file.get_line())
		Globals.HP = dataStorage.playerHP
		global_position = Vector2(dataStorage.savePointX,dataStorage.savePointY)
		file.close()
	modulate = Color(1,1,1,1)

func _physics_process(delta):
	deathCheck()
	
	if Globals.pausedState == 1:
		$AnimationPlayer.play("Paused")
		Globals.pausedState = 2 
	elif Globals.pausedState == 3:
		$AnimationPlayer.play()
		$AnimationPlayer.play_backwards("Paused")
		Globals.pausedState = 0
	
	if Globals.anotherPage == true:
		$AnimationPlayer.play("AnotherPage")
		Globals.anotherPage = false


	if Input.is_action_just_pressed("ui_accept") && canShine == true && Globals.pausedState == 0:
		ability()

	if Globals.pausedState == 0:
		movement()

func movement():
	movement.y += GRAVITY
	
	if knockback == false:
		if Input.is_action_pressed("ui_left"):
			movement.x = -speed*100
		elif Input.is_action_pressed("ui_right"):
			movement.x = speed*100
		else:
			movement.x = 0
	movement = move_and_slide(movement,Vector2(0,-1))
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_select"):
			movement.y = jump*-100
	elif Input.is_action_just_released("ui_select"):
		movement.y = movement.y/2

func deathCheck():
	if Globals.HP <= 0 && killed == false:
		Globals.died = true
		$AnimationPlayer.play("FadeOut")

func _on_Memory_timeout():
	Globals.burning = false
	$LightControll.play("ZoomIn")
	$Memory.stop()

func _on_LightControll_animation_finished(anim_name):
	if anim_name == "ZoomIn":
		canShine = true

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "FadeOut":
		$AnimatedSprite.hide()
		killed = true
	elif anim_name == "Paused":
		$AnimationPlayer.stop()
	elif anim_name == "AnotherPage":
		if Globals.destination == "Quit":
			get_tree().quit()
		elif Globals.destination == "Map":
			print("To map menu")
		elif Globals.destination == "Options":
			get_tree().change_scene("res://Menus/Options.tscn")

func _on_DamageChecker_area_entered(area):
	if "damage" in area.name && knockback == false:
		if area.global_position.x > global_position.x + 50:
			movement = Vector2(-200,-20)
			knockback = true
			$Stunned.start()
		elif area.global_position.x < global_position.x - 50:
			movement = Vector2(200,-20)
			knockback = true
			$Stunned.start()
		else:
			movement = Vector2(0,-100)
			knockback = true
			$Stunned.start()
		if canShine == true:
			$LightControll.play("DamagedShine")
		$AnimationPlayer.play("Damaged")
		Globals.damaged = true
		Globals.HPloss = true
		Globals.HP -= 1
	if "Nexus" in area.name:
		print(123)
		Globals.playerLoc = self.global_position

func _on_Stunned_timeout():
	knockback = false
	Globals.damaged = false
	$Stunned.stop()


func ability():
	if Globals.curAbility == "flash":
		Globals.HP -= 1
		Globals.HPloss = true
		Globals.burning = true
		$LightControll.play("ZoomOut")
		$Memory.start()
		canShine = false
