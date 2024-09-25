extends Control

#these all allow the buttons to change to another scene when pressed
func _on_level_5_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/Level5.tscn")


func _on_level_1_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/Level1.tscn")
	


func _on_level_2_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/Level2.tscn")


func _on_level_3_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/Level3.tscn")


func _on_level_4_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/Level4.tscn")




func _on_bonus_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/bonus.tscn")
