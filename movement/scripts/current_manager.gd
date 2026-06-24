extends Node
class_name Current
const current_scene: PackedScene = preload("res://movement/scenes/current.tscn")
@onready var config = %Config
@onready var entities = %MovingEntities

static func create(velocity: Vector2, lifespan: int) -> Current:
	var new_current: Current = current_scene.instantiate()
	new_current.velocity = velocity
	new_current.lifespan = lifespan
	return new_current


# Lifespan of each current is randomly allocated 
# Should store all currents scenes and visualise them if enabled by config
# Each current is responsible on its own for adjusting direction vectors of movable objects
