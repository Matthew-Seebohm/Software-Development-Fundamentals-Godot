extends Button
#This script is for the button sin the retry scene

func _ready():
	pass

#this function sends the player to the "MainGame" scene if pressed
#it also resets the score when pressed
func _on_Button_pressed():
	GlobalVariables.scoringInformation["currentScore"] = 0
	get_tree().change_scene("res://MainGame/MainGame.tscn")

#This fuction sends the player back to the "Main Menu" scene if pressed
#it also resets the score when pressed
func _on_Button2_pressed():
	GlobalVariables.scoringInformation["currentScore"] = 0
	get_tree().change_scene("res://Main Menu.tscn")
