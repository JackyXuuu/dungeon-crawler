extends Node2D

@onready var stats_component: StatsComponent = $StatsComponent as StatsComponent
@onready var scale_component: ScaleComponent = $ScaleComponent as ScaleComponent
@onready var flash_component: FlashComponent = $FlashComponent as FlashComponent
@onready var shake_component: ShakeComponent = $ShakeComponent as ShakeComponent
@onready var health_component: HealthComponent = $HealthComponent as HealthComponent
@onready var hurtbox_component: Area2D = $HurtboxComponent
@onready var hitbox_component: Area2D = $HitboxComponent


func _on_health_component_damaged(amount):
	pass # Replace with function body.

func _on_health_component_died():
	queue_free()

