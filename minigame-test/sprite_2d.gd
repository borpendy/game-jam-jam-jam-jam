extends Sprite2D
@onready var minigame: Node2D = $".."
var newposy
@onready var sprite_2d: Sprite2D = $"."
var size
var velocity = 0
var acceleration = 0.01
var current = 0
var current_target = 0
var frame_counter : int = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	
	size = sprite_2d.get_rect().size * sprite_2d.scale
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	frame_counter += 1
	if frame_counter % 180 == 0:
		current_target = randf_range(-0.01,0.01)
		#print(current_target)
	
	current = current + (current_target-current)/90
	print(current)
		
	if Input.is_action_pressed("upclick"):
		velocity = velocity + acceleration
		
			
	if Input.is_action_pressed("downclick"):
		velocity = velocity - acceleration
		
	if minigame.rectposition.has_point(Vector2(position.x, position.y + velocity + size.y/2)) and minigame.rectposition.has_point(Vector2(position.x, position.y + velocity - size.y/2)):
			velocity = velocity + current
			#print(velocity)
			position.y = position.y + velocity
	else:
		velocity = current
	
	if minigame.targetposition.has_point(Vector2(position.x, position.y-size.y/2)) or minigame.targetposition.has_point(Vector2(position.x, position.y+size.y/2)):
		pass
			#print("in target")
	else:
		pass
		#print("not target")
	
			
	
	
	
	pass
