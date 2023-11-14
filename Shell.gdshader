shader_type spatial;
render_mode cull_disabled;

float rand(vec2 uv){
    return fract(sin(dot(uv, vec2(12.9898, 78.233))) * 43758.5453);
}

void vertex(){
	// Place vertex code here.
}

void fragment() {
	
	vec2 new_UV = floor(UV*100.0);
	
	float rng = rand(new_UV);
	
	if(rng>0.0){
		ALBEDO = vec3(0.0,1.0,0.0);
	}
	else{
		ALBEDO = vec3(0.0,0.0,0.0);
	}
		
}
