extends Button
#This script is for activating a harder difficulty, by setting the switch as false when the game opens,
#when the player flips the switch it allows the game to run through a series of decisions to allow the enemies
# to move faster and shoot more

func _ready():
	$PAIN.pressed = GlobalVariables.pain
	print ("here")

#This sends the player bakc to the main menu from the options menu
func _on_Back_pressed():
	get_tree().change_scene("res://Main Menu.tscn")

#The famous "Pain Difficulty" 
func _on_Pain_Just_pain_toggled(button_pressed):
	GlobalVariables.pain = button_pressed
