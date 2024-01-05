shader_type spatial;
render_mode cull_disabled;

uniform float _Dentsity = 100.0;
uniform float _ShellIndex = 0;
uniform float _ShellCount = 16;
uniform float _ShellLength = 0.01;
uniform float _ShellDistanceAttenuation = 2;
uniform float _Thickness = 1;

float rand(vec2 uv){
    return fract(sin(dot(uv, vec2(12.9898, 78.233))) * 43758.5453);
}

void vertex(){
	float shellHeight = _ShellIndex / _ShellCount;
	// Place vertex code here.
	VERTEX.xyz += NORMAL.xyz * shellHeight * _ShellLength;
	NORMAL = normalize((VIEW_MATRIX * vec4(VERTEX,0.0)).xyz);
}

void fragment() {
	
	vec2 new_UV = UV*_Dentsity;
	vec2 LocalUV = 2.0*fract(new_UV)-1.0;
	float dst = length(LocalUV);
	float rng = rand(floor(new_UV));
	float h = _ShellIndex / _ShellCount;
	
	if(dst>_Thickness*(rng-h) && h != 0.0){
		discard;
	}
	else{ALBEDO = vec3(1.0,0.0,1.0)*h;}
}