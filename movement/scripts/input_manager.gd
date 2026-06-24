extends Node2D

@onready var printer = %DebugPrinter
signal left_clicked
const LCLICK_CODE = "left_clicked"
var click_position = Vector2()

signal sprint_pressed
const SPRINT_CODE = "sprint_pressed" 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta:float) -> void:
	if Input.is_action_pressed(LCLICK_CODE):
		click_position = get_global_mouse_position()
		printer.debug_print(name, "Clicked at pos " + str(click_position))
		emit_signal(LCLICK_CODE, click_position)
	if Input.is_action_pressed(SPRINT_CODE):
		emit_signal(SPRINT_CODE)
