extends Control


#allows the button to change your scene to the levels scene

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/levels.tscn")


func _on_reset_button_pressed():
	get_tree().reload_current_scene()
