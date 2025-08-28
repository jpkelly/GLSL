// TouchDesigner GLSL Vertex Shader - Basic UV Passthrough
// Use this vertex shader with the UV pattern fragment shaders

uniform mat4 uTDMats[4];
uniform vec3 uTD2DInfos[1];

in vec3 P;
in vec2 uv;

out vec2 vUV;

void main() {
    // Pass through UV coordinates to fragment shader
    vUV = uv;
    
    // Standard TouchDesigner vertex transformation
    vec4 worldSpacePos = uTDMats[0] * vec4(P, 1.0);
    gl_Position = uTDMats[3] * uTDMats[2] * uTDMats[1] * worldSpacePos;
}