@tool
extends Node

var _ShellCount = 256;
var _ShellLength = 1
var density = 1000.0
var scene = preload("res://shells.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(_ShellCount):
		createShell(i);
		await get_tree().create_timer(0.05).timeout
		
		
func createShell(index:int):
	var instance = scene.instantiate();
	add_child(instance);
	var material_instance = instance.get_surface_override_material(0).duplicate();
	instance.set_surface_override_material(0, material_instance);
	material_instance.set_shader_parameter("_Density", density);
	material_instance.set_shader_parameter("_ShellIndex", index);
	material_instance.set_shader_parameter("_ShellCount", _ShellCount);
	material_instance.set_shader_parameter("_ShellLength", 0.1);
	
	print("shell created");
