extends Sprite2D


# ----------- variables --------------- #

var speed = 75
var velocity = Vector2()
var stun = false
var hp = 3
var blood_particles = preload("res://scenes/blood_particles.tscn")

# ----------- functions --------------- #

func _process(delta: float) -> void:
	look_at(Global.player.global_position)
	
	if Global.player != null and stun == false:
		if Global.gameOff == false:
			velocity = global_position.direction_to(Global.player.global_position)
		else:
			velocity = Vector2(0, 0)
	elif stun == true:
		velocity = lerp(velocity, Vector2(0, 0), 0.3)
		
	global_position += velocity * speed * delta
	
	# what happens when enemy dies
	if hp <= 0:
		if Global.Camera != null:
			Global.Camera.screen_shake(30, 0.1)
			
			Global.points += 10
			
			if Global.node_creation_parent != null:
				var blood_partiles_instance = Global.instance_node(blood_particles, global_position, Global.node_creation_parent)
				blood_partiles_instance.rotation = velocity.angle()
			queue_free()


func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy_damager") and stun == false:
		modulate = Color("ff0056")
		velocity = -velocity * 6
		hp -= 1
		stun = true
		$stun_timer.start()
		area.get_parent().queue_free() # deletes bullet once it hits enemy


func _on_stun_timer_timeout() -> void:
	modulate = Color("ffffff")
	stun = false
