extends Camera2D
export (NodePath) var player_path
var player

func _ready():
	player = get_node(player_path)
	set_process(false)
	pass

func start():
	set_process(true)

func _process(delta):
	if player.position.y < self.position.y:
		self.position = Vector2(0, player.position.y)
	pass