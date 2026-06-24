extends Node2D

# Assumes body has a max_velocity attribute that it must obey
func add_velocity(body, velocity, max):
	if abs(body.velocity.x + velocity.x) < max.x:
		body.velocity.x += velocity.x

	if abs(body.velocity.y + velocity.y) < max.y:
		body.velocity.y += velocity.y
