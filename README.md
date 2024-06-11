# Shell Texturing Algorithm For Fake Fur Or Grass

This is a shell texturing algorithm designed for creating somewhat realistic fur textures for 3D environments in Godot. This shader implementation provides an efficient way to simulate the appearance of fur using parameters like density, shell index, shell count, and more.

## Features

- **Dynamic Shell Height:** dynamically adjusts the height of each fur shell, creating a natural variation in the fur.
- **Configurable Parameters:** Easily customize the fur appearance by adjusting parameters such as density, shell count, shell length, and shell distance attenuation.
- **Multiple Rendering Modes:** Choose between different modes for strand coloring, including texture sampling and linear interpolation.
- **Custome Half Lambert Lighting:** This shader implements the half lambert lighting model, feel free to change it for your own !
- **Ambient Occlusion:** Optional ambient occlusion for enhanced depth and realism.
- **Efficient Rendering:** The shader is optimized for performance, ensuring smooth rendering even with a high density of fur.
  
## Usage

1. Clone the repository:
```bash
git clone https://github.com/Neokoldstudio/shell-texturing.git
```
2. Include the shader [`Shell.gdshader`](./Shell.gdshader) and [`instanciateShell.gd`](./instanciateShell.gd) files in your godot project.
3. Adjust the parameters to achieve the desired fur appearance.
4. Run the shader to render the fake fur in your 3D scene.

## Parameters

- **`color`:** Color picker; control the color of the fur.
- **`_Density`:** Controls the overall density of the fur.
- **`_ShellIndex`:** Specifies the current index of the fur shell.
- **`_ShellCount`:** Sets the total number of fur shells.
- **`_ShellLength`:** Defines the length of each fur shell.
- **`_ShellDistanceAttenuation`:** Adjusts the attenuation of shell height based on distance.
- **`_Thickness`:** Specifies the thickness of the fur.
- **`_Attenuation:`** Controls the attenuation of ambient occlusion.
- **`_OcclusionBias:`** Bias for ambient occlusion.
- **`_Shininess`:** Defines the shininess for specular highlights (lower values result in larger highlights).

## Examples

![Alt text](exemple.png?raw=true "Exemple showcasing the use of this shader of a sphere mesh")

## License

This project is licensed under the MIT License.

## Acknowledgments

Special thanks to Garrett Gunnell form the Youtube channel [Acerola](https://www.youtube.com/@Acerola_t "Acerola's Channel") who granted a solid explanation of the logic behind this algorithm.
His video was my primary ressource throughout the implementation process.
