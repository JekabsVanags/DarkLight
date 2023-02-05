extends Node

var curScene;

var LV1scene1Triggered;
var LV1scene2Triggered;
var LV1scene3Triggered;
var LV1scene4Triggered;
var LV1scene5Triggered;
var LV1firstHitTriggered;
var LV1Nexus1Active;
var LV1Nexus2Active;
var LV1Nexus3Active;
var LV1cutscene1Seen;
var LV1cutscene2Seen;

var LV2Nexus1Active;
var LV2Nexus2Active;
var LV2Nexus3Active;


func saveData():
	var saveData = {
		currentScene = curScene,
		
		scene1TriggeredLV1 = LV1scene1Triggered,
		scene2TriggeredLV1 = LV1scene2Triggered,
		scene3TriggeredLV1 = LV1scene3Triggered,
		scene4TriggeredLV1 = LV1scene4Triggered,
		scene5TriggeredLV1 = LV1scene5Triggered,
		firstHitTriggeredLV1 = LV1firstHitTriggered,
		nexus1ActiveLV1 = LV1Nexus1Active,
		nexus2ActiveLV1 = LV1Nexus2Active,
		nexus3ActiveLV1 = LV1Nexus3Active,
		cutscene1SeenLV1 = LV1cutscene1Seen,
		cutscene2SeenLV1 = LV1cutscene2Seen,
		
		nexus1ActiveLV2 = LV2Nexus1Active,
		nexus2ActiveLV2 = LV2Nexus2Active,
		nexus3ActiveLV2 = LV2Nexus3Active
	}
	return saveData

func loadData():
	var dir = Directory.new()
	if !dir.dir_exists("user://Saves"):
		dir.open("user://")
		dir.make_dir("user://Saves")
	
	var file = File.new()
	var dataStorage = {}
	if file.file_exists("user://Saves/DarkLight.json"):
		file.open("user://Saves/DarkLight.json", File.READ)
		dataStorage = parse_json(file.get_line())
		dataStorage = parse_json(file.get_line())
		curScene = dataStorage.currentScene
		LV1scene1Triggered = dataStorage.scene1TriggeredLV1
		LV1scene2Triggered = dataStorage.scene2TriggeredLV1
		LV1scene3Triggered = dataStorage.scene3TriggeredLV1
		LV1scene4Triggered = dataStorage.scene4TriggeredLV1
		LV1scene5Triggered = dataStorage.scene5TriggeredLV1
		LV1firstHitTriggered = dataStorage.firstHitTriggeredLV1
		LV1Nexus1Active = dataStorage.nexus1ActiveLV1
		LV1Nexus2Active = dataStorage.nexus2ActiveLV1
		LV1Nexus3Active = dataStorage.nexus3ActiveLV1
		LV1cutscene1Seen = dataStorage.cutscene1SeenLV1
		LV1cutscene2Seen = dataStorage.cutscene2SeenLV1 
		
		LV2Nexus1Active = dataStorage.nexus1ActiveLV2
		LV2Nexus2Active = dataStorage.nexus2ActiveLV2
		LV2Nexus3Active = dataStorage.nexus3ActiveLV2
		file.close()
