extends CharacterBody2D


const MAXSPEED = 30
const DODGESPEED = 100
const ACCELERATION = 100
const FRICTION = 100
enum {
	MOVE,
	DODGE
}

var state = MOVE
var input = Vector2.ZERO
var dodge_vector = Vector2.DOWN
var last_direction = input

@onready var animated_sprite = $AnimatedSprite2D

func get_input():
	input = Input.get_vector("move_left","move_right","move_up","move_down")
	return input.normalized()

func _physics_process(delta):
	match state:
		MOVE:
			move_state(delta)
		DODGE:
			dodge_state(delta)
	
func move_state(delta):
	input = get_input()
	
	if input == Vector2.ZERO:
		var direction_id = int(8.0 * (last_direction.rotated(PI / 8.0).angle() + PI) / TAU)
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		animated_sprite.play(str("idle_", direction_id))
	else:
		var direction_id = int(8.0 * (input.rotated(PI / 8.0).angle() + PI) / TAU)
		last_direction = input
		velocity = velocity.move_toward(input * MAXSPEED, ACCELERATION * delta)
		move_and_slide()
		animated_sprite.play(str("run_", direction_id))
	print(last_direction)
	if input != Vector2.ZERO:
		velocity = velocity.move_toward(input * MAXSPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)

	move()
	
	if Input.is_action_just_pressed("dodge"):
		state = DODGE

func dodge_state(delta):
	velocity = dodge_vector * DODGESPEED
	move()
	animated_sprite.play("dodge")
	await animated_sprite.animation_finished()
	state = MOVE
	
func move():
	move_and_slide()

