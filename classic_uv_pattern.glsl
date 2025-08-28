// TouchDesigner GLSL Fragment Shader - Classic UV Test Pattern
// Based on common UV mapping test patterns used in 3D graphics

uniform vec2 uTD2DInfos[1];
uniform float uTime;

out vec4 fragColor;

void main() {
    // Get UV coordinates from TouchDesigner's automatic provision
    vec2 uv = gl_FragCoord.xy / uTD2DInfos[0].xy;
    
    // Create numbered grid sections (8x8)
    float sections = 8.0;
    vec2 sectionUV = floor(uv * sections) / sections;
    vec2 localUV = fract(uv * sections);
    
    // Base colors for alternating pattern
    vec3 color1 = vec3(0.8, 0.2, 0.2); // Red
    vec3 color2 = vec3(0.2, 0.8, 0.2); // Green
    vec3 color3 = vec3(0.2, 0.2, 0.8); // Blue
    vec3 color4 = vec3(0.8, 0.8, 0.2); // Yellow
    
    // Create pattern based on section
    vec2 sectionID = floor(uv * sections);
    float pattern = mod(sectionID.x + sectionID.y, 4.0);
    
    vec3 baseColor;
    if (pattern < 1.0) baseColor = color1;
    else if (pattern < 2.0) baseColor = color2;
    else if (pattern < 3.0) baseColor = color3;
    else baseColor = color4;
    
    // Add UV gradient overlay
    vec3 uvOverlay = vec3(uv.x, uv.y, 0.5) * 0.3;
    baseColor = mix(baseColor, uvOverlay, 0.4);
    
    // Grid lines
    float lineWidth = 0.02;
    float gridX = step(1.0 - lineWidth, localUV.x) + step(localUV.x, lineWidth);
    float gridY = step(1.0 - lineWidth, localUV.y) + step(localUV.y, lineWidth);
    float grid = clamp(gridX + gridY, 0.0, 1.0);
    
    // Apply grid
    baseColor = mix(baseColor, vec3(0.0), grid * 0.8);
    
    // Corner markers for orientation
    float cornerSize = 0.1;
    float corner = step(uv.x, cornerSize) * step(uv.y, cornerSize) +
                   step(1.0 - cornerSize, uv.x) * step(uv.y, cornerSize) +
                   step(uv.x, cornerSize) * step(1.0 - cornerSize, uv.y) +
                   step(1.0 - cornerSize, uv.x) * step(1.0 - cornerSize, uv.y);
    
    baseColor = mix(baseColor, vec3(1.0, 1.0, 1.0), corner * 0.8);
    
    fragColor = vec4(baseColor, 1.0);
}