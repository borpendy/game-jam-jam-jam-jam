extends Sprite2D
@onready var sprite_2d: Sprite2D = $"../Sprite2D"



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotation = (PI*sprite_2d.current/(2*0.01))+PI/2
	print(rotation *180/PI)
	pass
