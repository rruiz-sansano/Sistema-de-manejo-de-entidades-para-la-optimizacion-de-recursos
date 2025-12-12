extends Node3D


var started = false


func _process(_delta):
	if Global.pickup and !started:
		started = true
		%PickedUp.visible = true
		%Timer.start()


func _on_timer_timeout():
	%PickedUp.visible = false
