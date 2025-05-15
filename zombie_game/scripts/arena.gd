extends Node2D

# ----------- variables --------------- #

var enemy_1 = preload("res://scenes/enemy.tscn")

# ----------- functions --------------- #


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.node_creation_parent = self
	Global.points = 0
	
func _exit_tree() -> void:
	Global.node_creation_parent = null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# spawn enemies outside camera view
func _on_enemy_spawner_timer_timeout() -> void:
	var enemy_position = Vector2(randf_range(-120, 1250), randf_range(-90, 690))
	
	while enemy_position.x < 1000 and enemy_position.x > -25 and enemy_position.y < 670 and enemy_position.y > -30:
		enemy_position = Vector2(randf_range(-120, 1250), randf_range(-90, 690))
		Global.instance_node(enemy_1, enemy_position, self)
		
		#debug
		#print("enemy pos = " + str(enemy_position))



func _on_difficulty_timer_timeout() -> void:
	if $Enemy_spawner_timer.wait_time > 0.5:
		$Enemy_spawner_timer.wait_time -= 0.1
		
		#debug
		#print("wait time = " + str($Enemy_spawner_timer.wait_time))
