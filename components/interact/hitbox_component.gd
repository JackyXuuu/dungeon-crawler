extends Area2D
class_name HitboxComponent

## Inflict damage on a [HurtboxComponent] component.

## Emitted when the hitbox hits a [HurtboxComponent].
signal hit_hurtbox(hurtbox, amount: int)

## The amount of damage this hitbox applies.
@export var damage_amount := 1

func _on_hurtbox_entered(hurtbox) -> void:
	# Make sure the area we are overlapping is a hurtbox
	if not hurtbox is HurtboxComponent: return
	print("here")
	# Make sure the hurtbox isn't invincible
	#if hurtbox.is_invincible: return
	# Signal out that we hit a hurtbox (and apply damage accordingly to health)
	hurtbox.apply_damage(damage_amount)
	hit_hurtbox.emit(hurtbox, damage_amount)
