shader_type canvas_item;

void fragment() {
	if (mod(0.5 * (TIME *0.20 + UV.x + UV.y), 0.25) < 0.1) {
		COLOR *= 0.85;
	}
}

