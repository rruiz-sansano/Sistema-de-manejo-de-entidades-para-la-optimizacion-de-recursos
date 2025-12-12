extends Control


func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED
	Global.oc_culling = false
	Global.hlod = false
	Global.obj_pool = false
	Global.chunk = false


func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/choose_level.tscn")


func _on_instructions_pressed():
	get_tree().change_scene_to_file("res://scenes/instructions.tscn")


func _on_exit_pressed():
	get_tree().quit()


func _input(event):
	if event.is_action_pressed("Fullscreen"):
		var mode := DisplayServer.window_get_mode()
		var is_window: bool = mode != DisplayServer.WINDOW_MODE_FULLSCREEN
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN if is_window else DisplayServer.WINDOW_MODE_WINDOWED)


func _on_credits_pressed():
	get_tree().change_scene_to_file("res://scenes/credits.tscn")
