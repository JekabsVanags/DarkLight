extends Node
var burning = false
var HPloss = false
var HPgain = false
var HP = 5
var MaxHP = 5
var died = false
var damaged =  false

var pausedState = 0
var anotherPage = false
var destination = ""

var curAbility = "flash"

var playerLoc = Vector2()

func save():
	var saveData = {
		playerHP = HP,
		savePointY = playerLoc.y,
		savePointX = playerLoc.x,
	}
	return saveData

func dataSave():
	var globalDataToStore = Globals.save()
	var levelDataToStore = SaveFile.saveData()
	var file
	file = File.new()
	file.open("user://Saves/DarkLight.json",File.WRITE)
	file.store_line(to_json(globalDataToStore))
	file.store_line(to_json(levelDataToStore))
	file.close()
