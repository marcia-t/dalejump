extends RigidBody2D
var jump_speed = 650
var speed = 300
var sprite
signal hit

func _ready():
	sprite = get_node("Sprite")
	#Para que no se mueva
	sleeping = true
	set_physics_process(false)
	pass


func start():
	set_physics_process(true)
	sleeping = false
#	position = Vector2(360, 400)
	
func loose():
	hide()
	$Area2D/Collision.disabled=true

func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		set_linear_velocity(Vector2(-speed, get_linear_velocity().y))
		sprite.set_flip_h(true)
	if Input.is_action_pressed("ui_right"):
		set_linear_velocity(Vector2(speed, get_linear_velocity().y))
		sprite.set_flip_h(false)
	if !Input.is_action_pressed("ui_left")  and !Input.is_action_pressed("ui_right"):
		set_linear_velocity(Vector2(0, get_linear_velocity().y))


#Acá salto
func collision(body):
	if body.is_in_group("Spring") and get_linear_velocity().y > 0:
		set_linear_velocity(Vector2(0, -jump_speed*2)) 
	if body.is_in_group("Paddles") and get_linear_velocity().y > 0:
		set_linear_velocity(Vector2(0, -jump_speed)) 
	pass 
