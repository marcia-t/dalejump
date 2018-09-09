extends Node2D

var platform = preload('res://Step.tscn')
var dimensions
var y = -3000

func _ready():
	dimensions = get_viewport_rect().size.x
	randomize()
	set_process(true)

	

func _process(delta):
	y += rand_range(0,216)
	var new_step = platform.instance()
	new_step.position = Vector2(rand_range(-dimensions/2, dimensions/2),y)
	add_child(new_step)
	#y -= rand_range(0,216)
	pass
