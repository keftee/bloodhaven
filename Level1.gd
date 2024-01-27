extends Node2D
@onready var bullet_container = $BulletContainer
var player = null
# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_tree().get_first_node_in_group("character")
	assert(player!=null)
	player.bullet_shot.connect(_on_player_bullet_shot)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass

func _on_player_bullet_shot(bullet_scene, location):
	var bullet = bullet_scene.instantiate()
	bullet.global_position = location
	bullet_container.add_child(bullet)
