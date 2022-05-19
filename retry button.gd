extends Button
#this script is solely for the retry button in the endscene

func _ready():
	pass 

#This code is linked to the retry button, allowing the player to be sent bak to the game from the endscene
func _on_retry_button_pressed():
	get_tree().change_scene("res://MainGame/MainGame.tscn")
