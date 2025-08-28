# TouchDesigner Implementation Guide

## How to Use These UV Pattern Shaders in TouchDesigner

### Method 1: Using GLSL TOP

1. **Create a GLSL TOP**
   - In TouchDesigner, create a new GLSL TOP operator
   - Go to the GLSL TOP's parameters

2. **Load Fragment Shader**
   - Copy the contents of any UV pattern shader (e.g., `simple_uv_pattern.glsl`)
   - Paste into the Fragment Shader section of the GLSL TOP
   - Set resolution as needed (e.g., 1024x1024)

3. **Configure Parameters**
   - The shader will automatically generate UV coordinates
   - No additional inputs required for basic patterns

### Method 2: Using GLSL Material

1. **Create GLSL Material**
   - Add a GLSL MAT operator to your network
   - Connect it to a Phong MAT or other material

2. **Load Shaders**
   - **Vertex Shader**: Copy contents of `basic_vertex.glsl`
   - **Fragment Shader**: Copy contents of any UV pattern shader
   - **Note**: Fragment shaders use TouchDesigner's automatic UV provision

3. **Apply to Geometry**
   - Connect the material to any geometry with UV coordinates
   - Use with Box SOP, Grid SOP, or imported 3D models

### Method 3: Custom Parameter Controls

Add these parameters to make the shaders interactive:

```glsl
// Add to fragment shader uniforms section:
uniform float uGridSize;     // Control grid density
uniform float uLineWidth;   // Control line thickness
uniform vec3 uColor1;       // Custom color 1
uniform vec3 uColor2;       // Custom color 2
```

### TouchDesigner Parameter Setup

In the GLSL TOP/MAT parameters:
- **Grid Size**: Float parameter (default: 8.0, range: 1.0-32.0)
- **Line Width**: Float parameter (default: 0.02, range: 0.001-0.1)
- **Colors**: RGB parameters for custom color schemes

### Common Use Cases

1. **UV Mapping Verification**
   - Apply to 3D models to check UV unwrapping
   - Identify stretching and seam issues

2. **Texture Development**
   - Use as reference for texture creation
   - Align artwork to UV coordinates

3. **Real-time Feedback**
   - Monitor UV changes during animation
   - Validate procedural UV generation

### Performance Notes

- **Simple Pattern**: Best for real-time applications
- **Classic Pattern**: Good balance of detail and performance  
- **Advanced Pattern**: Most detailed, use for final validation

### Troubleshooting

1. **Black Output**: Check that geometry has UV coordinates
2. **Incorrect Scale**: Adjust grid size parameter
3. **No Grid Lines**: Increase line width parameter
4. **Color Issues**: Verify color space settings in TouchDesigner
5. **vUV Redefinition Error**: Fragment shaders now use TouchDesigner's automatic UV provision to avoid conflicts