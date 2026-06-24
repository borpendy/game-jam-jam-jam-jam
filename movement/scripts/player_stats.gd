extends Node2D

const BASE_ACCELERATION = 15
const BASE_MASS = 100
const BASE_MAX_VELOCITY = Vector2(500, 500)

var acceleration
var mass
var max_velocity

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	acceleration = BASE_ACCELERATION
	mass = BASE_MASS
	max_velocity = BASE_MAX_VELOCITY
