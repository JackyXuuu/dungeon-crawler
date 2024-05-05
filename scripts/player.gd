extends CharacterBody2D


const SPEED = 50.0
const JUMP_VELOCITY = -400.0

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	var isMoving = false
	# Checking Horizontal movement
	var direction = Input.get_axis("move_left", "move_right")
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	if direction:
		velocity.x = direction * SPEED
		isMoving = true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	# Checking vertical movement
	direction = Input.get_axis("move_up", "move_down")
	if direction:
		velocity.y = direction * SPEED
		isMoving = true
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	# Updating sprite animation
	if !isMoving:
		animated_sprite.play("idle-nosword")
	elif Input.is_action_just_pressed("dodge"):
		animated_sprite.play("dodge")
	else:
		animated_sprite.play("run")

	move_and_slide()
