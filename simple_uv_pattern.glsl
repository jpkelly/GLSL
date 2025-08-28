// TouchDesigner GLSL Fragment Shader - Simple UV Pattern
// Simplified version for basic UV visualization

uniform vec2 uTD2DInfos[1];

out vec4 fragColor;

void main() {
    // Get UV coordinates from TouchDesigner's automatic provision
    vec2 uv = gl_FragCoord.xy / uTD2DInfos[0].xy;
    
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