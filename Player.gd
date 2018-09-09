extends RigidBody2D
var jump_speed = 650
var speed = 300
var sprite
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	sprite = get_node("Sprite")
	set_physics_process(true)
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		set_linear_velocity(Vector2(-speed, get_linear_velocity().y))
		sprite.set_flip_h(true)
	if Input.is_action_pressed("ui_right"):
		set_linear_velocity(Vector2(speed, get_linear_velocity().y))
		sprite.set_flip_h(false)
	if !Input.is_action_pressed("ui_left")  and !Input.is_action_pressed("ui_right"):
		set_linear_velocity(Vector2(0, get_linear_velocity().y))

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func collision(body):
	if body.is_in_group("Paddles") and get_linear_velocity().y > 0:
		set_linear_velocity(Vector2(0, -jump_speed)) 
	pass # replace with function body
