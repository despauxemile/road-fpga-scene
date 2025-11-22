extends Node3D

@export var move_value: float = 5.0
@export var move_max: float = 3.5
@export var scroll_speed : float = 10.0

@onready var cam = $Camera3D
@onready var center_line = $lines/center_line
@onready var road = $road

func _process(delta: float) -> void:
	road.scroll_speed = scroll_speed
	center_line.scroll_speed = scroll_speed
	
	if Input.is_action_pressed("exit"):
		get_tree().quit()
		
	if Input.is_action_just_pressed("toggle"):
		center_line.is_dashed = not center_line.is_dashed

	var move_axis = Input.get_axis("left", "right")
	var move_val = move_axis * move_value * delta
	var new_cam_pos = cam.position.x + move_val
	
	cam.position.x = clampf(new_cam_pos, -move_max, move_max)
