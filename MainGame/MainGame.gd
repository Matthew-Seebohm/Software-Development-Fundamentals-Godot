extends Control

export(int) var countdownMax
var currentTimer

# Called when the node enters the scene tree for the first time.
func _ready():
	currentTimer = countdownMax
	$HUD/Countdown.text = str(currentTimer)
	
	while currentTimer > -1:
		yield(get_tree().create_timer(1.0), "timeout")
		$HUD/Countdown.text = str(currentTimer)
		currentTimer = currentTimer - 1
		print(currentTimer)
	print ("Game Over")
	$HUD/Countdown.text = str ("Gama Ovar")
	
	GlobalVariables.previousScores.push_front( GlobalVariables.scoringInformation["currentScore"])
	print(GlobalVariables.previousScores)
	
	if GlobalVariables.scoringInformation["currentScore"] >= 320:
		get_tree().change_scene("res://WinScene.tscn")
	
	if GlobalVariables.scoringInformation["currentScore"] < 320:
		get_tree().change_scene("res://Endscene.tscn") 
	
func _process(delta):
	$HUD/CurrentScore.text = str(GlobalVariables.scoringInformation["currentScore"])
	if get_tree().get_nodes_in_group("Covenant").size() == 0:
		get_tree().change_scene("res://WinScene.tscn")
