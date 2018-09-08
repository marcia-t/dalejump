extends Area2D
var kinematic
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func start():
	self.position = kinematic.position

func _ready():
	kinematic = self.get_node("KinematicBody2D")
	self.position = kinematic.position
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	self.position = kinematic.position