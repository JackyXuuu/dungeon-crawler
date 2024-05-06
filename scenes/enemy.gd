extends CharacterBody2D

# export 3 lines below later (export var)
var ACCELERATION = 300
var MAX_SPEED = 50
var FRICTION = 200

enum {
	IDLE,
	WANDER,
	CHASE
}

var knockback = Vector2.ZERO

var state = IDLE

@onready var animated_sprite = $AnimatedSprite2D
@onready var playerDetectionZone = $PlayerDetectionZone

# everything below relates to getting hit (5 - 15)

# When enemy is hit, knock them back
func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, 150 * delta)
	move_and_slide()
	
	match state:
		IDLE:
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
			animated_sprite.play("idle")
			seek_player()
			
		WANDER:
			pass
			
		CHASE:
			var player = playerDetectionZone.player
			if player != null:
				var direction = (player.global_position - global_position).normalized()
				velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
		
	move_and_slide()

# detect player if they enter their detection zone
func seek_player():
	if playerDetectionZone.can_see_player():
		state = CHASE

# connect hurtbox to the enemy
func _on_hurtbox_area_entered(area):
	knockback = area.knockback_vector * 100
