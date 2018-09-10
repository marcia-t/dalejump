extends Node2D

var step = preload('res://Step.tscn')
var spring_step = preload('res://SpringStep.tscn')
var camera 
var width
var y = 0
var player 
var score = 0
var height
var started = false

func _ready():
	width = get_viewport_rect().size.x
	height = get_viewport_rect().size.y
	player = get_node("Player")
	camera = get_node("Camera")
	randomize()
	set_process(true)

	

func _process(delta):
	#Ver si se puede obtener un nro en base a la distancia al player (salta 153)
	y -= rand_range(0,140)
	var new_step
	var ran = rand_range(0, 1024)
	if (ran < 50):
		new_step = spring_step.instance()
	else:
		new_step = step.instance()
	new_step.position = Vector2(rand_range(-width/2, width/2),y)
	add_child(new_step)
	if (player.position.y > camera.position.y + height/2):
		#aca mostrar game over screen
		$Player.loose()
		$HUD.show_message("Game over")
		started = false
	#sumar ptaje
	if started:
		camera.start()
		score = round(max(score, -camera.position.y))
		$HUD.update_score(score)


func _on_HUD_start_game():
	$Player.start()
	started = true
