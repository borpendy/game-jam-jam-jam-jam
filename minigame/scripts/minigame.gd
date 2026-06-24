extends Node2D
@onready var pointer: Sprite2D = $Pointer

var sc = 4
var basesize := Vector2(32*sc, 160*sc)


var rect_size_orig := Vector2(32*sc, 32*sc)
var yset := Vector2(0, 64*sc)
var xset := Vector2(0, 32*sc)
var rectposition
var targetposition


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
	
	

func _draw() -> void:
	draw_rect(Rect2(-(basesize / 2),basesize),Color.BLUE,true)
	var yoffset = round(yset*randf_range(-1,1))
	var xoffset = round(xset*randf_range(0,1))
	var rect_size = round(rect_size_orig-xoffset)
	print(yoffset)
	rectposition = Rect2(-(basesize / 2),basesize)
	targetposition = Rect2(-(rect_size / 2)-yoffset,rect_size)
	draw_rect(Rect2(-(rect_size / 2)-yoffset,rect_size),Color.MEDIUM_PURPLE,true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass
	
func _input(event):
	# Check for a specific action setup in your Input Map
	if event.is_action_pressed("test"):
		queue_redraw()
