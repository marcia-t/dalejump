extends KinematicBody2D

const SPEED = 350
const GRAV = 15
const JUMP = 800

var vel = Vector2()
var screensize
var doodle


func _ready():
	doodle = get_node("doodle")
	screensize = get_viewport_rect().size
	print(screensize.x)

func _physics_process(delta):
	
	if Input.is_action_pressed('ui_left'):
		vel.x = -SPEED
		doodle.set_flip_h(true)
	elif Input.is_action_pressed('ui_right'):
		vel.x = SPEED
		doodle.set_flip_h(false)
	else:
		vel.x = 0
	
	vel.y += GRAV
	if is_on_floor():
		vel.y = -JUMP ;

	vel = move_and_slide(vel, Vector2(0, -1))
	
	if position.x < -244:
		position.x = -244
	
	if position.x > 300:
		position.x = 300
	