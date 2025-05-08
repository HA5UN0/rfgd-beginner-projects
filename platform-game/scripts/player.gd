extends CharacterBody2D

# exported vars -----------------------------
@export var speed = 300
@export var gravity = 30
@export var jump_force = 30



# on ready vars ------------------------------
@onready var sprite = $Sprite2D
@onready var hurtBox = $hurtBox
@onready var jumpBox = $jumpBox

@onready var anim = $AnimationPlayer
@onready var hurtAnim = $AnimationPlayerHurt
@onready var hurtTimer = $Timer

# !need to make!
@onready var cam = $"../Camera2D"
@onready var heart1 = $"../Camera2D/fullHeart1"
@onready var heart2 = $"../Camera2D/fullHeart2"
@onready var heart3 = $"../Camera2D/fullHeart3"

# -------------- none player vars -------------- #

@onready var gameOverLabel = $"../Camera2D/GameOverLabel"
@onready var winLabel = $"../Camera2D/WinLabel"
@onready var coinText = $"../Camera2D/LabelCoin"

# --- screen shake vars ---
var randomStrength: float = 30.0 # for screen shake
var shakeFade: float = 5.0
var shake_strength: float = 0.0
var rng = RandomNumberGenerator.new()

# --- coin vars ---
var coinCount: int = 0

# -- game state vars --
var gameOver: bool = false
var timesJumped = 0 # for double jump effect
var hurting: bool = false # for hurting state
var playerHealth: int = 3
var timesShook: int = 0 # screen shake tracker
var gameWin: bool = false
