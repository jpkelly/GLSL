// TouchDesigner GLSL Fragment Shader
// Standard UV Texture Pattern
// Author: Generated for TouchDesigner
// Purpose: Display a standard UV grid pattern for texture mapping visualization

// TouchDesigner uniforms
uniform float iTime;
uniform vec2 iResolution;
uniform sampler2D sTD2DInputs[1];

// Input from vertex shader
in vec2 vUV;

// Output color
out vec4 fragColor;

void main() {
    // Get UV coordinates (0.0 to 1.0)
    vec2 uv = vUV;
    
    // Create a grid pattern
    float gridSize = 8.0; // Number of grid divisions
    vec2 grid = fract(uv * gridSize);
    
    // Create grid lines
    float lineWidth = 0.05;
    float gridLineX = step(1.0 - lineWidth, grid.x) + step(grid.x, lineWidth);
    float gridLineY = step(1.0 - lineWidth, grid.y) + step(grid.y, lineWidth);
    float gridLines = clamp(gridLineX + gridLineY, 0.0, 1.0);
    
    // Create checkerboard pattern
    vec2 checker = floor(uv * gridSize);
    float checkerboard = mod(checker.x + checker.y, 2.0);
    
    // Create UV gradient colors
    vec3 uvGradient = vec3(uv.x, uv.y, 0.5);
    
    // Combine patterns
    vec3 baseColor = mix(vec3(0.2), vec3(0.8), checkerboard);
    vec3 finalColor = mix(baseColor, uvGradient, 0.3);
    
    // Add grid lines
    finalColor = mix(finalColor, vec3(0.0), gridLines * 0.8);
    
    // Add border highlighting
    float border = 0.02;
    float borderMask = step(border, uv.x) * step(border, uv.y) * 
                      step(uv.x, 1.0 - border) * step(uv.y, 1.0 - border);
    finalColor = mix(vec3(1.0, 0.0, 0.0), finalColor, borderMask);
    
    // Output final color
    fragColor = vec4(finalColor, 1.0);
}