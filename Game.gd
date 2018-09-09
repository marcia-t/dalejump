extends Node2D

var step = preload('res://Step.tscn')
var dimensions
var y = 0
var player 
var score = 0

func _ready():
	dimensions = get_viewport_rect().size.x
	player = get_node("Player")
	randomize()
	set_process(true)

	

func _process(delta):
	#Ver si se puede obtener un nro en base a la distancia al player
	y -= rand_range(0,190)
	var new_step = step.instance()
	new_step.position = Vector2(rand_range(-dimensions/2, dimensions/2),y)
	add_child(new_step)
	pass

#Sumar ptaje
func _on_Player_hit():
	score+=1
