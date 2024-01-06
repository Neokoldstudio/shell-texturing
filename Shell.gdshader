shader_type spatial;
render_mode cull_disabled;

// GrassTex Parameters
uniform float _Density = 100.0;
uniform float _ShellIndex = 0;
uniform float _ShellCount = 16;
uniform float _ShellLength = 0.01;
uniform float _ShellDistanceAttenuation = 0.4;
uniform float _Thickness = 1;

// Random function
float rand(vec2 uv){
    return fract(sin(dot(uv, vec2(12.9898, 78.233))) * 43758.5453);
}

void vertex(){
    // Adjust the shell height based on the specified parameters
    float shellHeight = _ShellIndex / _ShellCount;
    shellHeight = pow(shellHeight, _ShellDistanceAttenuation);

    // Move the vertex based on the shell height
    VERTEX.xyz += NORMAL.xyz * shellHeight * _ShellLength;

    // Recalculate the normal vector
    NORMAL = normalize((VIEW_MATRIX * vec4(VERTEX, 0.0)).xyz);
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

    // Check if the fragment should be discarded based on thickness and random value
    if (dst > _Thickness * (rng - h) && h != 0.0) {
        discard;
    } else {
        // Set the albedo color based on the shell height
        ALBEDO = vec3(1.0, 0.0, 1.0) * h;
    }
}
