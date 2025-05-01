extends Area2D

@export var laser_tcsn: PackedScene
@onready var mainScene = $".."

func _process(delta):
	var mouse_pos = get_global_mouse_position()
	position.x = mouse_pos
	
	#shoot laser
	if Input.is_action_just_pressed("fire"):
		var new_laser = laser_tcsn.instantiate()
		add_sibling(new_laser)
		new_laser.position = self.position


func _on_area_entered(area):
	if area.is_in_group("enemy"):
		self.queue_free()
		mainScene.is.game_over = true
