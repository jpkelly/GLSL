# GLSL Shaders for TouchDesigner

This repository contains GLSL fragment shaders designed for use in TouchDesigner, specifically for UV texture pattern visualization.

## Shaders Included

### 1. `uv_pattern.glsl` - Advanced UV Pattern
A comprehensive UV test pattern featuring:
- 8x8 grid with checkerboard pattern
- UV gradient colors
- Grid lines for precise mapping
- Red border highlighting
- Suitable for detailed UV mapping work

### 2. `simple_uv_pattern.glsl` - Simple UV Grid
A minimal UV pattern with:
- Clean grid lines
- UV color gradient (Red = U axis, Green = V axis)
- Lightweight and efficient
- Perfect for basic UV visualization

### 3. `classic_uv_pattern.glsl` - Classic Test Pattern
A traditional UV test pattern featuring:
- Color-coded sections (Red, Green, Blue, Yellow)
- 8x8 grid layout
- Corner orientation markers
- UV gradient overlay
- Industry-standard design

## Usage in TouchDesigner

1. **Create a GLSL Material or GLSL TOP**
2. **Load the fragment shader**: Copy the contents of any shader file into TouchDesigner's fragment shader editor
3. **Apply to geometry**: Use with any geometry that has proper UV coordinates
4. **Verify UV mapping**: The pattern will reveal how your UV coordinates are mapped

## Shader Features

- **Grid Visualization**: Helps identify UV seams and stretching
- **Color Coding**: Different sections help track UV orientation
- **Border Highlights**: Red borders show UV boundaries (0,0) to (1,1)
- **Gradient Overlays**: Show smooth UV coordinate transitions

## TouchDesigner Compatibility

These shaders are designed to work with TouchDesigner's GLSL implementation:
- Use standard TouchDesigner uniform conventions
- Compatible with `vUV` input coordinates
- Output to `fragColor` for proper rendering
- No external dependencies required

## Tips for Use

1. **UV Mapping Validation**: Use these patterns to check for UV distortion
2. **Texture Alignment**: Verify texture coordinates before applying final textures
3. **Seam Detection**: Grid lines help identify UV seam issues
4. **Scale Testing**: Adjust grid size for different detail levels