extends Node2D

@onready var printer = %DebugPrinter
signal left_clicked
const INPUT_CODE = "left_click"
var click_position = Vector2()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed(INPUT_CODE):
		click_position = get_global_mouse_position()
		printer.debug_print(name, "Clicked at pos " + str(click_position))
		emit_signal("left_clicked", click_position)
