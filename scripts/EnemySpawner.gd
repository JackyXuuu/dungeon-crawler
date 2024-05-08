extends Marker2D

@export var items:Array[PackedScene] = []

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_enemy()

# This function spawns enemies
func spawn_enemy():
	var enemy_scene = items.pick_random()
	var new_enemy = enemy_scene.instantiate()
	
	add_child(new_enemy)
	
