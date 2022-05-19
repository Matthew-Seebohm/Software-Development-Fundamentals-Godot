extends Control
#this script controls different aspects of the overall game, such as countdown, score and win/lose conditions

export(int) var countdownMax
var currentTimer

#This function creates the timer and detirmines how fast the timer runs and what happens when it finishes
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
	
	#this block of code saves the previous scores in the global variables script a displays them in the output
	GlobalVariables.previousScores.push_front( GlobalVariables.scoringInformation["currentScore"])
	print(GlobalVariables.previousScores)
	
	#this code sends the player to the endgame scene when the timer runs out
	while currentTimer < 0:
		get_tree().change_scene("res://Endscene.tscn")

#This fuction sends the layer to the "Winscene" if all the objects classed as "Covenant" (aka the enemies)
#had been deleted
func _process(delta):
	$HUD/CurrentScore.text = str(GlobalVariables.scoringInformation["currentScore"])
	if get_tree().get_nodes_in_group("Covenant").size() == 0:
		get_tree().change_scene("res://WinScene.tscn")
