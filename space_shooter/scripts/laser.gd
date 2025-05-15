extends Area2D

@export var speed: float = 600

# cosistent speed for every setup
func _process(delta):
	position.y -= speed * delta
	

# deletes self if collids with enemy
func _on_area_entered(area):
	if area.is_in_group("enemy"):
		self.queue_free()
