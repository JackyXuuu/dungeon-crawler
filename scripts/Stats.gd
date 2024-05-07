extends Node

@export var MAX_HEALTH = 1
@onready var health = MAX_HEALTH:
	set(value):
		health = value
		if health <= 0:
			emit_signal("no_health")
	get:
		return health

signal no_health
