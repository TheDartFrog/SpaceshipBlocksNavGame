shader_type canvas_item;

uniform float transparency : hint_range(0.0,1.0) = 1.0;

void vertex() {
	// Called for every vertex the material is visible on.
}

float random(vec2 uv) {
	return fract(sin(dot(uv, vec2(12.9898, 78.233))) * 43758.5453);
}

void fragment() {

	float pix_color_r = random(UV + (TIME/10.0));
	float pix_color_g = random(UV + (TIME/10.0));
	float pix_color_b = random(UV + (TIME/10.0));
	COLOR = vec4(pix_color_r,pix_color_g,pix_color_b, transparency);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
