shader_type spatial;

uniform sampler2D noise_tex;
uniform float scroll_speed = 15.0;

uniform vec4 back_color : source_color = vec4(0.1, 0.1, 0.1, 1.0);

void fragment() {
	vec2 uv = UV * vec2(10.0, 1000.0);
	
	uv += vec2(0.0, TIME * scroll_speed);
	
	vec4 noise_col = texture(noise_tex, uv) * back_color;
	
	ALBEDO = noise_col.rgb;
}
