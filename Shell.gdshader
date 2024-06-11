shader_type spatial;
render_mode cull_disabled;

// GrassTex Parameters
uniform sampler2D texture_albedo; // Texture sampler for the albedo color

uniform int MODE = 2;
uniform bool AmbiantOcclusion = false;
uniform vec4 color : source_color;
uniform float _Density = 100.0;
uniform float _ShellIndex = 0;
uniform float _ShellCount = 16;
uniform float _ShellLength = 0.01;
uniform float _ShellDistanceAttenuation = 0.4;
uniform float _Thickness = 2;
uniform float _Attenuation=1;
uniform float _OcclusionBias = 0;
uniform float _Shininess = 10; //the less this value, the larger the highlight is

// Random function
float rand(vec2 uv){
    return fract(sin(dot(uv, vec2(12.9898, 78.233))) * 43758.5453);
}

void light(){//half blinn-phong lighting (blinn-phong specular + valve's half lambert)
	vec3 diffuse_color = ALBEDO;
	vec3 light_color = LIGHT_COLOR;
	float NdotL = max(0.0,dot(NORMAL, LIGHT));
	float halfLambertDiffuse = pow(NdotL*0.5+0.5,2);
	DIFFUSE_LIGHT +=halfLambertDiffuse* diffuse_color * light_color;
	
    vec3 halfDir = normalize(LIGHT + VIEW);
    float specAngle = max(dot(halfDir, NORMAL), 0.0);
   	float specular = pow(specAngle, _Shininess);
	SPECULAR_LIGHT += specular * diffuse_color * light_color;
}

void vertex(){
    // Adjust the shell height based on the specified parameters
    float shellHeight = _ShellIndex / _ShellCount;
    shellHeight = pow(shellHeight, _ShellDistanceAttenuation);

    // Move the vertex based on the shell height
    VERTEX.xyz += NORMAL.xyz * shellHeight * _ShellLength;

    // Recalculate the normal vector
    NORMAL = normalize(vec4(VERTEX, 1.0).xyz);
}

void fragment() {
    // Map UV coordinates based on density
    vec2 new_UV = UV * _Density;
    
    // Calculate local UV coordinates
    vec2 LocalUV = 2.0 * fract(new_UV) - 1.0;

    // Calculate distance from the center
    float dst = length(LocalUV);

    // Generate a random value based on UV coordinates
    float rng = rand(floor(new_UV));

    // Calculate normalized height for the shell
    float h = _ShellIndex / _ShellCount;
	
	float ambientOcclusion = pow(h, _Attenuation);
	
	ambientOcclusion += _OcclusionBias;
	ambientOcclusion = clamp(ambientOcclusion, 0.0, 1.0);
    // Check if the fragment should be discarded based on thickness and random value
    if (dst > _Thickness * (rng - h) && h != 0.0) {
        discard;
    } else {
        // Set the albedo color based on the shell height
		vec3 fragmentColor = vec3(0.0,0.0,0.0);
		
		switch(MODE){
			case 0://colored strands only
			 fragmentColor = color.xyz ;
			 break;
			case 1://texture sampled colors only
			 fragmentColor = texture(texture_albedo, UV).rgb;
			 break;
			case 2://linear interpolation from texture to color
			 fragmentColor = mix(texture(texture_albedo, UV).rgb, color.xyz, h);
			 break;
		}
		
		ALBEDO = fragmentColor * ((AmbiantOcclusion==true)? ambientOcclusion : 1.0);  
    }
}
