extends CharacterBody3D
class_name Player

@onready var dir := %Eyes
@onready var it = 0
@onready var it2 = 0
var cap = false
var force = -20
var upDir = 3.5
var ammo = []
var throwable = preload("res://prefabs/throwable.tscn")
const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var MOUSE_SENSITIVITY = 0.008
const MAX_STEP_HEIGHT = 0.5


func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	Global.exit = false


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	var input_dir = Input.get_vector("Left", "Right", "Forward", "Back")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		
	move_and_slide()


func _unhandled_input(event):
	if event is InputEventMouseMotion:
		rotation.y = rotation.y - MOUSE_SENSITIVITY * event.relative.x
		dir.rotation.x = clamp((dir.rotation.x - MOUSE_SENSITIVITY * event.relative.y), -PI/2, PI/2)


func _input(event):
	if event.is_action_pressed("Exit"):
		Global.exit = true
		Input.mouse_mode = Input.MOUSE_MODE_CONFINED
		Global.entities = 0
		Global.targets = 0
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
	if event.is_action_pressed("Fullscreen"):
		var mode := DisplayServer.window_get_mode()
		var is_window: bool = mode != DisplayServer.WINDOW_MODE_FULLSCREEN
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN if is_window else DisplayServer.WINDOW_MODE_WINDOWED)
