extends Node2D

@onready var stats_component: StateComponent = $StatsComponent as StatsComponent
@onready var scale_component: StateComponent = $StatsComponent as StatsComponent
@onready var flash_component: StateComponent = $ScaleComponent as ScaleComponent
@onready var shake_component: StateComponent = $ShakeComponent as ShakeComponent


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
