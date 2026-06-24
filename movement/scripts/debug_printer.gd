extends Node
@onready var config = %Config

func debug_print(node_name, msg):
	if config.DEBUG_MODE:
		print(node_name.to_upper() + ": " + msg)
