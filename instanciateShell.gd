@tool
extends Node3D

var _ShellCount = 256;
var _ShellLength = 0.1;
var density = 500.0
var scene = preload("res://shells.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(_ShellCount):
		createShell(i);
		
		
func createShell(index:int):
	var instance = scene.instantiate();
	add_child(instance);
	var material_instance = instance.get_surface_override_material(0).duplicate();
	instance.set_surface_override_material(0, material_instance);
	material_instance.set_shader_parameter("_Density", density);
	material_instance.set_shader_parameter("_ShellIndex", index);
	material_instance.set_shader_parameter("_ShellCount", _ShellCount);
	material_instance.set_shader_parameter("_ShellLength", _ShellLength);
	
	print("shell created");

#func _process(delta):
#	if not Engine.is_editor_hint():
#		rotate(Vector3.UP, 1.0 * delta);
#		rotate(Vector3.FORWARD, 2.0 * delta);
#		rotate(Vector3.RIGHT, -1.0 * delta);	
		
	
