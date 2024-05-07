extends Area2D

@export var HitByPlayer = false

const HitEffect = preload("res://scenes/player_hit_effect.tscn")

func _on_area_entered(area):
	if HitByPlayer:
		var effect = HitEffect.instantiate()
		var main = get_tree().current_scene
		main.add_child(effect)
		effect.global_position = global_position
