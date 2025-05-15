extends Label

# ----------- variables --------------- #


# ----------- functions --------------- #

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.points > Global.highscore:
		Global.highscore = Global.points # new highscore baby!


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = str(Global.points) # set score text
	$"../Highscore".text = str(Global.highscore) # set highschore text
