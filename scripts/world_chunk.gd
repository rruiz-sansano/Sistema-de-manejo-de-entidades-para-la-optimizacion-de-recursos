extends Node3D

@onready var curr_chunk = "A"
const chunk_1 = preload("res://prefabs/chunk_1.tscn")
const chunk_2 = preload("res://prefabs/chunk_2.tscn")
const chunk_3 = preload("res://prefabs/chunk_3.tscn")
const chunk_4 = preload("res://prefabs/chunk_4.tscn")


func load_chunk(chunk: String):
	var chunk_instance
	if chunk == "A":
		chunk_instance = chunk_1.instantiate()
	elif chunk == "B":
		chunk_instance = chunk_2.instantiate()
	elif chunk == "C":
		chunk_instance = chunk_3.instantiate()
	elif chunk == "D":
		chunk_instance = chunk_4.instantiate()
	add_child.call_deferred(chunk_instance)


func unload_chunk(chunk: String):
	if chunk == "A":
		get_node("Chunk1").queue_free()
	elif chunk == "B":
		get_node("Chunk2").queue_free()
	elif chunk == "C":
		get_node("Chunk3").queue_free()
	elif chunk == "D":
		get_node("Chunk4").queue_free()


func _on_area_a_body_entered(_body):
	curr_chunk = "A"


func _on_area_b_body_entered(_body):
	curr_chunk = "B"


func _on_area_c_body_entered(_body):
	curr_chunk = "C"


func _on_area_d_body_entered(_body):
	curr_chunk = "D"


func _on_area_a_body_exited(_body):
	load_chunk("C")


func _on_area_b_body_exited(_body):
	if curr_chunk == "C":
		unload_chunk("A")
		load_chunk("D")
	elif curr_chunk == "A":
		unload_chunk("C")


func _on_area_c_body_exited(_body):
	if curr_chunk == "B":
		unload_chunk("D")
		load_chunk("A")
	elif curr_chunk == "D":
		unload_chunk("B")


func _on_area_d_body_exited(_body):
	load_chunk("B")
