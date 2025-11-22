@tool
extends MeshInstance3D

@export var scroll_speed: float = 15.0
@export var dash_length: float = 3.0
@export var gap_length : float = 2.0
@export var line_length : float = 1000.0
@export var line_color : Color = Color.WHITE
@export var is_dashed : bool = false

var mat: ShaderMaterial

func _ready() -> void:
	mat = get_surface_override_material(0)

func _process(_delta: float) -> void:
	if mat:
		mat.set_shader_parameter("scroll_speed", scroll_speed)
		mat.set_shader_parameter("dash_length", dash_length)
		mat.set_shader_parameter("gap_length", gap_length if is_dashed else 0.0)
		mat.set_shader_parameter("line_length", line_length)
		mat.set_shader_parameter("line_color", line_color)
