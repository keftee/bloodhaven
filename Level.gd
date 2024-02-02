extends Node2D
@onready var bullet_container = $BulletContainer
var player = null
var dir = 1
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
	bullet.multiplier = dir


func _on_character_facing_l():
	dir = -1


func _on_character_facing_r():
	dir = 1
