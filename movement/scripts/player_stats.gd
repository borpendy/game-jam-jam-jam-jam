extends Node2D

const BASE_ACCELERATION = 15
const BASE_MASS = 100
const BASE_MAX_VELOCITY = Vector2(500, 500)
const BASE_MIN_VELOCITY = Vector2(0, 0)
const BASE_FRICTION = 2
const BASE_DRIFT = 2

var acceleration
var mass
var max_velocity
var min_velocity
var friction_coefficient
var drift

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	acceleration = BASE_ACCELERATION
	mass = BASE_MASS
	max_velocity = BASE_MAX_VELOCITY
	min_velocity = BASE_MIN_VELOCITY
	friction_coefficient = BASE_FRICTION
	drift = BASE_DRIFT
