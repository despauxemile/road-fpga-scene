shader_type spatial;

uniform float scroll_speed = 15.0;
uniform float dash_length = 3.0;
uniform float gap_length = 2.0;

uniform float line_length = 1000.0;

uniform vec3 line_color : source_color = vec3(1.0, 1.0, 1.0);

void fragment() {
	float uv_norm = UV.y * line_length;

	float period = dash_length + gap_length;

	float u = uv_norm + TIME * -scroll_speed * gap_length;

	float pos = mod(u, period);

	if (pos > dash_length) {
		discard;
	}

	ALBEDO = line_color;
}
