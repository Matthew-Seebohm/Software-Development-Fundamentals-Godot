extends Button
#This script allows the main menu buttons to send the player t different parts of the game

func _ready():
	pass 

#This button sends the player to the game from the mainmenu
func _on_Start_Game_pressed():
	get_tree().change_scene("res://MainGame/MainGame.tscn")

#This button quits the entire project
func _on_Quit_pressed():
	get_tree().quit()

#Ths button sends the player to the otions menu
func _on_Options_pressed():
	get_tree().change_scene("res://Options.tscn") 
