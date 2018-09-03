extends RigidBody2D
var screensize

func start():
	show()

func _ready():
	screensize = get_viewport_rect().size

func _process(delta):
	var velocity = Vector2()
	
	if Input.is_action_pressed("ui_right"):
		set_linear_velocity(Vector2(600, get_linear_velocity().y))
		#velocity.x += 1000
	if Input.is_action_pressed("ui_left"):
		set_linear_velocity(Vector2(-600, get_linear_velocity().y))
		#velocity.x -= 1000
	#if !(Input.is_action_pressed("ui_right")) and !(Input.is_action_pressed("ui_left")):
		#set_linear_velocity(Vector2(0, get_linear_velocity().y)) 

	#position += velocity * delta
	#position.x = clamp(position.x, 0, screensize.x)


