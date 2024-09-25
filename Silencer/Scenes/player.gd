extends CharacterBody2D


@export var speed = 300.0
@export var jump_velocity = -400.0
@export var acceleration : float = 15.0
@export var jumps = 1

enum state {IDLE, RUNNING, JUMP, JUMPDOWN, HURT}

var anim_state = state.IDLE

@onready var animator = $AnimatedSprite2D
@onready var animation_player = $AnimationPlayer

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var start_pos = global_position

func reset():
	global_position = start_pos
	set_physics_process(true)
	anim_state = state.IDLE
	get_tree().reload_current_scene()



func update_state():
	if anim_state == state.HURT:
		return
	if is_on_floor():
		if velocity == Vector2.ZERO:
			anim_state = state.IDLE
#		elif velocity.x != 0:
#			anim_state state.RUNNING
	else:
		pass
		if velocity.y < 0:
			anim_state = state.JUMP
		else:
			anim_state = state.JUMPDOWN

func update_animation (direction):
	if direction > 0:
		animator.flip_h = false
	elif direction < 0:
		animator.flip_h = true
	match anim_state:
		state.IDLE:
			animation_player.play("idle")
		state.RUNNING:
			animation_player.play("running")
		state.JUMP:
			animation_player.play("jump")
		state.JUMPDOWN:
			animation_player.play("jumpdown")
		state.HURT:
			animation_player.play("hurt")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = move_toward(velocity.x, direction * speed, acceleration)
	else:
		velocity.x = move_toward(velocity.x, 0, acceleration/2)

	update_state()
	update_animation(direction)
	move_and_slide()

func enemy_checker(enemy):
	if enemy.is_in_group("Enemy") and velocity.y > 0:
		enemy.die()
		velocity.y = jump_velocity
	elif enemy.is_in_group("Hurt"):
		anim_state = state.HURT




func _on_hit_box_area_entered(area: Area2D) -> void:
	enemy_checker(area)


func _on_hit_box_body_entered(body: Node2D) -> void:
	enemy_checker(body)
