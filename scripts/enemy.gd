extends CharacterBody2D

# export 3 lines below later (export var)
var ACCELERATION = 300
var MAX_SPEED = 50
var FRICTION = 200
var KNOCKBACK_VAL = 100

enum {
	IDLE,
	WANDER,
	CHASE
}

var knockback = Vector2.ZERO
var state = IDLE

@onready var animated_sprite = $EnemyMovements
@onready var playerDetectionZone = $PlayerDetectionZone
@onready var stats = $enemy_stats
const EnemyDeathEffect = preload("res://scenes/enemy_death_effect.tscn")

# everything below relates to getting hit (5 - 15)

# When enemy is hit, knock them back
func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, FRICTION * delta)
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
				var direction = position.direction_to(player.global_position)
				velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION)
		
	move_and_slide()

# detect player if they enter their detection zone
func seek_player():
	pass
	#if playerDetectionZone.can_see_player():
		#state = CHASE

# connect hurtbox to the enemy
func _on_hurtbox_area_entered(area):
	print_debug("enemy hit")
	stats.health -= area.damage
	knockback = area.knockback_vector * KNOCKBACK_VAL

func _on_enemy_stats_no_health():
	queue_free()
	var enemyDeathEffect = EnemyDeathEffect.instantiate()
	get_parent().add_child(enemyDeathEffect)
	enemyDeathEffect.global_position = global_position
