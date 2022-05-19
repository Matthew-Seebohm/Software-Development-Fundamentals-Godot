extends Button

func _ready():
	pass 

#This button is for sending the player back to the main menu from the retry scene
func _on_Button2_pressed():
	get_tree().change_scene("res://Main Menu.tscn")
