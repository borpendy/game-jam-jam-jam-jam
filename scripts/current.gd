extends Node2D

@onready var config = %Config
@onready var printer = %DebugPrinter
@onready var engine = %PhysicsEngine

var velocity = Vector2(5, -5)
var max_velocity = Vector2(200, 200)
var lifespan = 1000
var time_alive = 0
var alive = true
var entities_inside = []

func _ready():
	self.visible = false
	if config.VISUALISE_CURRENTS:
		self.visible = true
		
func _physics_process(delta: float) -> void:
	if alive == false:
		return
		
	if time_alive > lifespan:
		alive = false
		printer.debug_print(name, "Current has died, deactivating...")
		return
	
	for entity in entities_inside:
		engine.add_velocity(entity, velocity, max_velocity)
		
	time_alive += 1
	
	alive = true

func _on_area_2d_body_entered(body: Node2D) -> void:
	entities_inside.append(body)

func _on_area_2d_body_exited(body: Node2D) -> void:
	entities_inside.erase(body)
	
