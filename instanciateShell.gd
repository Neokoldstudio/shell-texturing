extends Node

var _ShellCount = 16;
var scene = preload("res://shells.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	
	for i in range(_ShellCount):
		var instance = scene.instantiate();
		add_child(instance);
		print("shell created");
