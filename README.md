# Shell Texturing Algorithm to Fake Hair

This is a shell texturing algorithm designed for creating somewhat realistic hair textures for 3D environments in Godot. This shader implementation provides an efficient way to simulate the appearance of hair using parameters like density, shell index, shell count, and more.

## Features

- **Dynamic Shell Height:** dynamically adjusts the height of each hair shell, creating a natural variation in the hair.
- **Configurable Parameters:** Easily customize the hair appearance by adjusting parameters such as density, shell count, shell length, and shell distance attenuation.
- **Efficient Rendering:** The shader is optimized for performance, ensuring smooth rendering even with a high density of hair.
  
## Usage

1. Clone the repository:
```bash
git clone https://github.com/Neokoldstudio/shell-texturing.git
```
2. Include the shader [`Shell.gdshader`](./Shell.gdshader) and [`instanciateShell.gd`](./instanciateShell.gd) files in your godot project.
3. Adjust the parameters to achieve the desired hair appearance.
4. Run the shader to render the fake hair in your 3D scene.

## Parameters

- **`color`:** Color picker; control the color of the hair.
- **`_Density`:** Controls the overall density of the hair.
- **`_ShellIndex`:** Specifies the current index of the hair shell.
- **`_ShellCount`:** Sets the total number of hair shells.
- **`_ShellLength`:** Defines the length of each hair shell.
- **`_ShellDistanceAttenuation`:** Adjusts the attenuation of shell height based on distance.
- **`_Thickness`:** Specifies the thickness of the hair.

## Examples

Screenshot to come

## License

This project is licensed under the MIT License.

## Acknowledgments

Special thanks to Garrett Gunnell form the Youtube channel [Acerola](https://www.youtube.com/@Acerola_t "Acerola's Channel") who granted a solid explanation of the logic behind this algorithm.
His video was my primary ressource throughout the implementation process.
