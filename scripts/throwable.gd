extends RigidBody3D
#var pickup = false


func _on_area_3d_body_entered(body):
	#if body is Player and !pickup:
	#	pickup = true
	#elif body is not Player and pickup:
	if body is Player:
		body.global_position = Vector3(3.15, 0, 3.15)
		body.global_rotation = Vector3(0, 0, 0)
	else:
		sleeping = true


func is_pickup():
	freeze = true
