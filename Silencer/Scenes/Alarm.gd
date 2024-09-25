extends Area2D


#allows alarm to get collected
func collected():
	var broken_alarm = preload("res://Scenes/broken_alarm.tscn")
	var new_broken_object = broken_alarm.instantiate()
	get_tree().current_scene.add_child(new_broken_object)
	new_broken_object.global_position = global_position
	GameManager.score += 1
	


func _on_body_entered(body):
	if body.is_in_group("Player"):
		collected()
		queue_free()
	
