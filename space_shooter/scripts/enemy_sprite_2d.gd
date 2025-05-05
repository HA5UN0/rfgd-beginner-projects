extends Sprite2D

# preloading different enemy textures! it's ya boi!!
var enemy1 = preload("res://art/kenney_space-shooter-redux/PNG/Enemies/enemyBlack1.png")
var enemy2 = preload("res://art/kenney_space-shooter-redux/PNG/Enemies/enemyGreen2.png")
var enemy3 = preload("res://art/kenney_space-shooter-redux/PNG/Enemies/enemyRed3.png")

# enemy array of all textures
var enemy_texture_array = [enemy1, enemy2, enemy3]
var rand_value = enemy_texture_array.pick_random()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	texture = rand_value

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
