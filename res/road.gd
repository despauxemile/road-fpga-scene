@tool
extends MeshInstance3D

@export var scroll_speed: float = 15.0

var mat: ShaderMaterial

func _ready() -> void:
	mat = get_surface_override_material(0)

func _process(_delta: float) -> void:
	if mat:
		mat.set_shader_parameter("scroll_speed", scroll_speed)
