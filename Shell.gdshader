shader_type spatial;
render_mode cull_disabled;

uniform float _Dentsity = 100.0;
uniform float _ShellIndex = 0;
uniform float _ShellCount = 16;
uniform float _ShellLength = 0.01;
uniform float _ShellDistanceAttenuation = 2;

float rand(vec2 uv){
    return fract(sin(dot(uv, vec2(12.9898, 78.233))) * 43758.5453);
}

void vertex(){
	float shellHeight = _ShellIndex / _ShellCount;
	// Place vertex code here.
	shellHeight = pow(_ShellDistanceAttenuation, shellHeight);
	VERTEX.xyz += NORMAL.xyz * _ShellLength * shellHeight;
	NORMAL = normalize((VIEW_MATRIX * vec4(VERTEX,0.0)).xyz);
}

void fragment() {
	
	vec2 new_UV = floor(UV*_Dentsity);
	
	float rng = rand(new_UV);
	float h = _ShellIndex / _ShellCount;
	
	if(rng>h){
		ALBEDO = vec3(0.0,1.0,0.0);
	}
	else{
		discard;
		//ALBEDO = vec3(0.0,0.0,0.0);
	}
		
}