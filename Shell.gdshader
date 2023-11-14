shader_type spatial;
render_mode cull_disabled;

uniform float _Dentsity = 100.0;
uniform float _ShellIndex = 0;
uniform float _ShellCount = 16;
uniform float _ShellLength = 1;
uniform float _ShellDistanceAttenuation;

float rand(vec2 uv){
    return fract(sin(dot(uv, vec2(12.9898, 78.233))) * 43758.5453);
}

void vertex(){
	float shellHeight = _ShellIndex / _ShellCount;
	// Place vertex code here.
	shellHeight = pow(_ShellDistanceAttenuation, shellHeight);
	VERTEX.xyz = NORMAL.xyz * _ShellLength * shellHeight;
}

void fragment() {
	
	vec2 new_UV = floor(UV*_Dentsity);
	
	float rng = rand(new_UV);
	
	if(rng>0.0){
		ALBEDO = vec3(0.0,1.0,0.0);
	}
	else{
		ALBEDO = vec3(0.0,0.0,0.0);
	}
		
}