shader_type canvas_item;


uniform float viscosity = 0.5;

void fragment() {
	float r = distance(UV, vec2(0.5, 0.5)); 
	float x = max(UV.x, 1.0 - UV.x);
	vec2 uv = UV;
	uv.y *= 0.5 + 0.5 * (1.0 - pow(x, 5.0));
	if (uv.y < 0.04 * cos(8.0 * uv.x + 1.5 * TIME * (0.5 + 1.0 - viscosity)) + sin(12.0 * uv.x + TIME * 2.0 * 3.0 * (0.5 + 1.0 - viscosity)) * 0.06 + 0.25) {
		COLOR.a = 0.0;
	}
	if (uv.y > 0.0 && r > 0.5) {
		COLOR.a = 0.0;
	}
	
	
}

