extends Node2D

func add_friction(body, coef, max_vel):
	if body.velocity.x > 0:
		body.velocity.x -= coef
	elif body.velocity.x < 0:
		body.velocity.x += coef

	if body.velocity.y < 0:
		body.velocity.y += coef
	elif body.velocity.y > 0:
		body.velocity.y -= coef
		
# Assumes body has a max_velocity attribute that it must obey
func add_velocity(body, velocity, max):
	if abs(body.velocity.x + velocity.x) < max.x:
		body.velocity.x += velocity.x

	if abs(body.velocity.y + velocity.y) < max.y:
		body.velocity.y += velocity.y
