extends KinematicBody2D

const SPEED = 350
const GRAV = 15
const JUMP = 700

var vel = Vector2()

func _ready():
	print (global_position)

func _physics_process(delta):
	
	if Input.is_action_pressed('ui_left'):
		vel.x = -SPEED
	elif Input.is_action_pressed('ui_right'):
		vel.x = SPEED
	else:
		vel.x = 0
	
	vel.y += GRAV
	if is_on_floor(): #&& Input.is_action_just_pressed('ui_up'):
		vel.y = -JUMP ;
		
	vel = move_and_slide(vel, Vector2(0, -1))
	
	"""if position.x < -360:
		position.x = 360
	
	if position.x > 385:
		position.x = -360"""
	