extends Sprite2D

# ----------- variables --------------- #

var speed = 300
var velocity = Vector2()

# need to make still! uncomment after
var bullet = preload("res://scenes/bullet.tscn")

var can_shoot = true
var is_dead = false

@onready var aimSpot = $aimspot

# ----------- functions --------------- #

func _ready() -> void:
	# add to area script later then delete
	#Global.node_creation_parent = $".."
	# add to area script later then delete

	
	Global.player = self
	Global.gameOff = false
	
func _exit_tree() -> void:
	Global.player = null

# everything updated throughout the game
func _process(delta: float) -> void:
	velocity.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	velocity.y = int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
	
	velocity = velocity.normalized() # keeps diagonal movement speed consistent
	
	# limits player movement to viewport 
	global_position.x = clamp(global_position.x, 20, 1152)
	global_position.y = clamp(global_position.y, 20, 648)
	
	if is_dead == false:
		global_position += speed * velocity * delta
		
	if Input.is_action_pressed("click") and Global.node_creation_parent != null and can_shoot and is_dead == false:
		look_at(get_global_mouse_position())
		Global.instance_node(bullet, aimSpot.global_position, Global.node_creation_parent)
		$Reload_speed.start()
		can_shoot = false
		


func _on_reload_speed_timeout() -> void:
	can_shoot = true
	


func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemy"):
		is_dead = true
		visible = false
		Global.gameOff = true
		await  (get_tree().create_timer(1.0).timeout)
		get_tree().reload_current_scene()
