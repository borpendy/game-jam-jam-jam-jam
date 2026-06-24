extends CharacterBody2D

@onready var input_manager = %SignalRouter
@onready var engine = %PhysicsEngine
@onready var printer = %DebugPrinter
@onready var stats = self.get_node("PlayerStats")
var minigame

var actions = {
	"left_clicked": [on_left_click, on_left_click_released],
	"sprint_pressed": [on_sprint_pressed, on_sprint_released]
}

var accel
var max_vel
var min_vel
var mass
var direction_vector
var friction_coefficient
var drift

const fishscene = preload("res://minigame/scenes/minigame.tscn")

func initialise_variables():
	accel = stats.acceleration
	max_vel = stats.max_velocity
	min_vel = stats.min_velocity
	mass = stats.mass
	friction_coefficient = stats.friction_coefficient
	drift = stats.drift
	direction_vector = Vector2(0, 0)

func _ready():
	initialise_variables()
	for action in actions:
		input_manager.get_indexed(action).connect(actions[action][0])

func on_left_click(click_position: Vector2):
	var curr_position = position
	printer.debug_print(name, "Current pos " + str(curr_position))
	
	direction_vector = click_position - curr_position
	direction_vector = (direction_vector / (direction_vector.length())) * accel

func on_left_click_released():
	direction_vector = Vector2(0, 0)
	
func on_sprint_pressed():
	printer.debug_print(name, "Current sprinting velocity: " + str(velocity))
	max_vel = stats.max_velocity * 1.5
	accel = stats.acceleration * 2
	
func on_sprint_released():
	max_vel = stats.max_velocity
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("r"):
		minigame = fishscene.instantiate()
		add_child(minigame)
		print("added")
	if event.is_action_pressed("t"):
		if (minigame != null):
			minigame.queue_free()
	for action in actions:
		if event.is_action_released(action):
			actions[action][1].call()

func _physics_process(delta: float) -> void:
	engine.add_velocity(self, direction_vector, max_vel)
	engine.add_friction(self, friction_coefficient, max_vel)
	move_and_slide()
