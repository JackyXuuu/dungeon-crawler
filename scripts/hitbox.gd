class_name Hitbox
extends Area2D

#export (int) var damage : int = 10

func _init() -> void:
	collision_layer = 1
	collision_mask = 0
