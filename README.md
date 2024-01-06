# GrassTex: Shell Texturing Algorithm for Fake Grass

This is a shell texturing algorithm designed for creating realistic grass for 3D environments in Godot. This shader implementation provides an efficient way to simulate the appearance of grass using parameters like density, shell index, shell count, and more.

## Features

- **Dynamic Shell Height:** GrassTex dynamically adjusts the height of each grass shell, creating a natural variation in the grass landscape.
- **Configurable Parameters:** Easily customize the grass appearance by adjusting parameters such as density, shell count, shell length, and shell distance attenuation.
- **Efficient Rendering:** The shader is optimized for performance, ensuring smooth rendering even with a high density of grass.
  
## Usage

1. Clone the GrassTex repository:
```bash
git clone https://github.com/Neokoldstudio/shell-texturing.git
```
2. Include the shader `Shell.gdshader` and `instanciateShell.gd` files in your project.
3. Adjust the parameters to achieve the desired grass appearance.
4. Run the shader to render the fake grass in your 3D scene.

##Parameters

- **`_Density`:** Controls the overall density of the grass.
-**`_ShellIndex`:** Specifies the current index of the grass shell.
-**`_ShellCount`:** Sets the total number of grass shells.
-**`_ShellLength`:** Defines the length of each grass shell.
-**`_ShellDistanceAttenuation`:** Adjusts the attenuation of shell height based on distance.
-**`_Thickness`:** Specifies the thickness of the grass.

##Examples

Screenshot to come

##License

This project is licensed under the MIT License.

##Acknowledgments

Special thanks to Garrett Gunnell form the Youtube channel Acerola who granted a really good explanation of the logic behind this algorithm.
His video was my primary ressource throughout the implementation process.



[Any acknowledgments or credits you want to mention]
