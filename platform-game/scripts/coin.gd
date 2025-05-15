extends Area2D

@onready var box = $"."

func _physics_process(delta: float) -> void:
	for area in box.get_overlapping_areas():
		if area.name == "hurtBox":
			queue_free()
