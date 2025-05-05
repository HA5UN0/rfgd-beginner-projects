extends Label


@onready var maninScene = $"../.."

func _process(delta: float) -> void:
	if maninScene.is_game_over == true:
		self.visible = true
	
	# resets game
	if Input.is_action_just_pressed("ui_accept") and maninScene.is_game_over == true:
		get_tree().reload_current_scene()
		maninScene.reset_values()
