extends Node3D

@onready var dir := $"."
@onready var it = 0
@onready var it2 = 0
@export var burst: int
@export var start := 1.0
@export var cadence := 1.0
@export var cooldown := 1.0
var throwed = 0
var cap = false
var force = -30
var upDir = 0
var ammo = []
var throwable = preload("res://prefabs/throwable.tscn")


func _ready():
	$Start.wait_time = start
	$Cadence.wait_time = cadence
	$Cooldown.wait_time = cooldown
	if Global.obj_pool:
		for i in range(11):
			ammo.append(throwable.instantiate())
	$Start.start()

func throw():
	if Global.obj_pool:
		if it == 10 && !cap:
			cap = true
			hide_throw()
			var currObj = ammo[it]
			currObj.position = dir.global_position
			currObj.set_rotation_degrees(Vector3(-90, 0, 0))
			currObj.rotation = currObj.rotation + dir.global_rotation
			get_tree().current_scene.add_child(currObj)
			currObj.apply_central_impulse(dir.global_transform.basis.z.normalized() * force + Vector3(0, upDir, 0))
			it = 0
		elif it == 10 && cap:
			hide_throw()
			var currObj = ammo[it]
			currObj.sleeping = true
			currObj.position = dir.global_position
			currObj.set_rotation_degrees(Vector3(-90, 0, 0))
			currObj.rotation = currObj.rotation + dir.global_rotation
			currObj.get_node("Spear").visible = true
			currObj.apply_central_impulse(dir.global_transform.basis.z.normalized() * force + Vector3(0, upDir, 0))
			it = 0
		elif cap:
			hide_throw()
			var currObj = ammo[it]
			currObj.sleeping = true
			currObj.position = dir.global_position
			currObj.set_rotation_degrees(Vector3(-90, 0, 0))
			currObj.rotation = currObj.rotation + dir.global_rotation
			currObj.get_node("Spear").visible = true
			currObj.apply_central_impulse(dir.global_transform.basis.z.normalized() * force + Vector3(0, upDir, 0))
			it += 1
		else:
			var currObj = ammo[it]
			currObj.position = dir.global_position
			currObj.set_rotation_degrees(Vector3(-90, 0, 0))
			currObj.rotation = currObj.rotation + dir.global_rotation
			get_tree().current_scene.add_child(currObj)
			currObj.apply_central_impulse(dir.global_transform.basis.z.normalized() * force + Vector3(0, upDir, 0))
			it += 1
	elif !Global.obj_pool:
		var currObj = throwable.instantiate()
		currObj.position = dir.global_position
		currObj.set_rotation_degrees(Vector3(-90, 0, 0))
		currObj.rotation = currObj.rotation + dir.global_rotation
		get_tree().current_scene.add_child(currObj)
		currObj.apply_central_impulse(dir.global_transform.basis.z.normalized() * force + Vector3(0, upDir, 0))

func hide_throw():
	ammo[it2].get_node("Spear").visible = false
	if it2 == 10:
		it2 = 0
	else:
		it2 += 1

func _on_start_timeout():
	throw()
	throwed += 1
	print(throwed)
	if throwed >= burst:
		throwed = 0
		$Cooldown.start()
	else:
		$Cadence.start()

func _on_cadence_timeout():
	throw()
	throwed += 1
	print(throwed)
	if throwed >= burst:
		throwed = 0
		$Cooldown.start()
	else:
		$Cadence.start()

func _on_cooldown_timeout():
	throw()
	throwed += 1
	print(throwed)
	if throwed >= burst:
		throwed = 0
		$Cooldown.start()
	else:
		$Cadence.start()
