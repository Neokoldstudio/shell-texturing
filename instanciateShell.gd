extends Node

var _ShellCount = 16;
var _Layers = []

# Called when the node enters the scene tree for the first time.
func _ready():
	var scene = preload("res://shells.tscn")

	for i in range(_ShellCount):
		var instance = scene.instantiate();
		add_child(instance);
		print("shell created");
		

	for i in _Layers:
		pass
