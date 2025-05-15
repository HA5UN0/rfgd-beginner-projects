extends Sprite2D

var velocity = Vector2(1, 0)
var speed = 400
var look_once: bool = true

func _process(delta: float) -> void:
	if look_once == true:
		look_at(get_global_mouse_position())
		look_once = false
		
	# make object go toward where it rotated to
	global_position += velocity.rotated(rotation) * speed * delta
	


func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	queue_free()
