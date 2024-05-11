extends Area2D
class_name HurtboxComponent

@export var HitByPlayer = false

#const HitEffect = preload("res://scenes/player_hit_effect.tscn")
## Emitted when hit by a [HitboxComponent].
signal damaged(amount: int)

## The [HealthComponent] to manipulate.
@export var health_component: HealthComponent

#func _on_area_entered(area):
	#if HitByPlayer:
		#var effect = HitEffect.instantiate()
		#var main = get_tree().current_scene
		#main.add_child(effect)
		#effect.global_position = global_position

func _ready() -> void:
	# Make sure a [member health_component] is specified
	assert(health_component, "No health_component:HealthComponent specified in %s." % [str(get_path())])

## Apply some damage to the [HealthComponent] component.
func apply_damage(amount: int) -> void:
	print(amount)
	health_component.damage(amount)
	damaged.emit(amount)

