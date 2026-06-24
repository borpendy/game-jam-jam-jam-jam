extends CharacterBody2D

@onready var input_manager = %InputManager
@onready var engine = %PhysicsEngine
@onready var printer = %DebugPrinter
@onready var stats = self.get_node("PlayerStats")
var minigame


const fishscene = preload("res://minigame/scenes/minigame.tscn")

func _ready():
	input_manager.left_clicked.connect(on_left_click)

func on_left_click(click_position: Vector2):
	var curr_position = position
	printer.debug_print(name, "Current pos " + str(curr_position))
	
	var direction_vector = click_position - curr_position
	direction_vector = (direction_vector / (direction_vector.length())) * stats.acceleration
	
	engine.add_velocity(self, direction_vector, stats.max_velocity)
	
	
	
	
	#code to use 
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("r"):
		minigame = fishscene.instantiate()
		add_child(minigame)
		print("added")
	if event.is_action_pressed("t"):
		if (minigame != null):
			minigame.queue_free()
		

func _physics_process(delta: float) -> void:
	move_and_slide()
