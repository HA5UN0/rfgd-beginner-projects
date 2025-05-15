extends Camera2D

# ----------- variables --------------- #
var screen_shake_start = false
var shake_intensity = 0

# ----------- functions --------------- #

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.Camera = self
	
func _exit_tree() -> void:
	Global.Camera = null


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	zoom = lerp(zoom, Vector2(1, 1), .3)
	
	if screen_shake_start == true:
		global_position += Vector2(randf_range(-shake_intensity, shake_intensity), randf_range(-shake_intensity, shake_intensity))
	
func screen_shake(intensity, time):
	zoom = Vector2(1, 1) - Vector2(intensity * 0.002, intensity * 0.02)
	shake_intensity = intensity
	$"screen _shake_timer".wait_time = time
	$"screen _shake_timer".start()
	screen_shake_start = true
	
func _on_screen_shake_timer_timeout() -> void:
	screen_shake_start = false
	global_position = Vector2(576, 328)
	
