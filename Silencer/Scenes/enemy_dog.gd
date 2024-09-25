extends CharacterBody2D

var direction = 1
const SPEED = 100.0
const JUMP_VELOCITY = -400.0

func die():
	queue_free()

func _physics_process(delta: float):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.

	velocity.x = direction * SPEED

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
 


	move_and_slide()
	$AnimatedSprite2D.flip_h = direction > 0

func _on_timer_timeout():
	direction *= -1  # Replace with function body.
