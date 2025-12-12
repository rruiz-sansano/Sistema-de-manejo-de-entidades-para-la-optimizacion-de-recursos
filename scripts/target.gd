extends Node3D


var hit = false
var check = true
@export var max_dist = 625 #25*25
@export var half_dist = 225 #15*15
var far : bool
var far_lod : bool
var vis : bool


func mesh_on_ready(dist:int):
	if dist > half_dist and Global.lod and !Global.edm:
		$FarMesh.visible = true
		far_lod = true
		$CloseMesh.lod_bias = 0.05
	elif dist <= half_dist and Global.lod and !Global.edm:
		$FarMesh.visible = true
		far_lod = false
		$CloseMesh.lod_bias = 1
	elif dist > half_dist and Global.lod and Global.edm:
		$FarMesh.visible = false
		far_lod = true
		$CloseMesh.lod_bias = 0.05
	elif dist <= half_dist and Global.lod and Global.edm:
		$FarMesh.visible = false
		far_lod = false
		$CloseMesh.lod_bias = 1
	elif !Global.lod and !Global.edm and !Global.static_lod:
		$FarMesh.visible = false
		$CloseMesh.visibility_range_end = 0
	elif !Global.lod and !Global.static_lod and Global.edm:
		$FarMesh.visible = false
	elif Global.static_lod and Global.edm:
		$CloseMesh.lod_bias = 0.5
		$FarMesh.visible = false
	elif Global.static_lod and !Global.edm:
		$CloseMesh.lod_bias = 0.5
		

func change_mesh(dist:int):
	if dist > half_dist && !far_lod:
		$CloseMesh.lod_bias = 0.05
		far_lod = true
	elif dist < half_dist && far_lod:
		$CloseMesh.lod_bias = 1
		far_lod = false


func _on_area_3d_area_entered(_area):
	target_hit()

func target_hit():
	hit = true


func _on_visible_on_screen_notifier_3d_screen_entered():
	Global.entities += 1
	vis = true


func _on_visible_on_screen_notifier_3d_screen_exited():
	Global.entities -= 1
	vis = false
