extends Area2D
@export var flip_time = 0.5
var direction = 1
#codes bat enemies movement
func _ready():
	$Timer.wait_time = flip_time

func die():
	queue_free()

func _process(delta):
	translate(Vector2.RIGHT * direction)
	$AnimatedSprite2D.flip_h = direction > 0




func _on_timer_timeout():
	direction *= -1 
