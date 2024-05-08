extends Area2D
class_name HitboxComponent

## Inflict damage on a [HurtboxComponent] component.

## Emitted when the hitbox hits a [HurtboxComponent].
signal hit(hurtbox: HurtboxComponent, amount: float)

## The amount of damage this hitbox applies.
@export_range(0.0, 1000.0, 0.01, "or_greater", "hide_slider") var damage_amount := 1.0

func _on_hurtbox_entered(hurtbox: HurtboxComponent) -> void:
	# Make sure the area we are overlapping is a hurtbox
	if not hurtbox is HurtboxComponent: return
	# Make sure the hurtbox isn't invincible
	if hurtbox.is_invincible: return
	# Signal out that we hit a hurtbox (and apply damage accordingly to health)
	hurtbox.apply_damage(damage_amount)
	hit.emit(hurtbox, damage_amount)

