// TouchDesigner GLSL Fragment Shader - Simple UV Pattern
// Simplified version for basic UV visualization

uniform vec2 uTD2DInfos[1];

in vec2 vUV;
out vec4 fragColor;

void main() {
    vec2 uv = vUV.st;
    
    // Simple grid pattern
    float grid = 10.0;
    vec2 gridUV = fract(uv * grid);
    
    // Grid lines
    float lines = step(0.95, gridUV.x) + step(0.95, gridUV.y);
    
    // UV color gradient
    vec3 color = vec3(uv.x, uv.y, 0.5);
    
    // Apply grid
    color = mix(color, vec3(0.0), lines);
    
    fragColor = vec4(color, 1.0);
}