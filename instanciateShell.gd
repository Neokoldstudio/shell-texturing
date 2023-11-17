extends Node

var _ShellCount = 16;
var scene = preload("res://shells.tscn")
var density = 100.0

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(_ShellCount):
		var instance = scene.instantiate();
		add_child(instance);
		print("shell created");
		
	#for i in range(get_child_count()):
		#var child = get_child(i)
		#child.mesh.material.sets_shader_parameter("_Density", density);
		#child.mesh.material.set_shader_parameter("_ShellIndex", i);
		#child.mesh.material.set_shader_parameter("_ShellCount", _ShellCount);
		#child.mesh.material.set_shader_parameter("_ShellLength", 1);
