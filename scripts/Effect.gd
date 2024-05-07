extends AnimatedSprite2D  # Change the class name to AnimatedSprite2D if that's the class you're extending

func _ready():
	self.animation_finished.connect(_on_animation_finished)
	play("default")

func _on_animation_finished():
	queue_free()
