@tool
extends Node

var _ShellCount = 16;
var scene = preload("res://shells.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(_ShellCount):
		var instance = scene.instantiate();
		instance.mesh.material.set_shader_parameter("_Dentsity", 100.0);
		instance.mesh.material.set_shader_parameter("_ShellIndex", i);
		instance.mesh.material.set_shader_parameter("_ShellCount", _ShellCount);
		instance.mesh.material.set_shader_parameter("_ShellLength", 1);
		add_child(instance);
		print("shell created");
