extends CharacterBody2D


const MAXSPEED = 100
const DODGESPEED = 150
const ACCELERATION = 400
const FRICTION = 100
enum {
	MOVE,
	DODGE,
	ATTACK
}

var state = MOVE
var input = Vector2.ZERO
var dodge_vector = Vector2.DOWN
var last_direction = input
var last_mouse_position = Vector2()

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
		ATTACK:
			attack_state(delta)
	
func move_state(delta):
	input = get_input()
	if input == Vector2.ZERO:
		var direction_id = int(8.0 * (last_direction.rotated(PI / 8.0).angle() + PI) / TAU)
		velocity = Vector2.ZERO
		animated_sprite.play(str("idle_", direction_id))
	else:
		var direction_id = int(8.0 * (input.rotated(PI / 8.0).angle() + PI) / TAU)
		last_direction = input
		velocity = velocity.move_toward(input * MAXSPEED, ACCELERATION * delta)
		animated_sprite.play(str("run_", direction_id))

	move()
	
	if Input.is_action_just_pressed("dodge"):
		state = DODGE
	if Input.is_action_just_pressed("attack"):
		state = ATTACK
		last_mouse_position = get_local_mouse_position()

func dodge_state(delta):
	velocity = last_direction * DODGESPEED
	move()
	animated_sprite.play("dodge")
	
func attack_state(delta):
	var direction_id = snapped(last_mouse_position.angle(), PI/4) / (PI/4)
	direction_id = wrapi(int(direction_id),0,8)
	# Update last_direction to match the attack direction
	last_direction = Vector2(cos(direction_id * (PI / 4)), sin(direction_id * (PI / 4)))
	velocity = Vector2.ZERO
	animated_sprite.play(str("attack_", direction_id))
	
func move():
	move_and_slide()

func _on_animated_sprite_2d_animation_finished():
	state = MOVE
	if animated_sprite.animation == "dodge":
		velocity = velocity*0.5
