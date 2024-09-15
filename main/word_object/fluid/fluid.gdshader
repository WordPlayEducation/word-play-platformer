shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	if (UV.y < 0.04 * sin(4.0 * UV.x + 1.5 * TIME) + sin(6.0 * UV.x + TIME * 2.0) * 0.1 + 0.25) {
		COLOR.a = 0.0;
	}
}

