extends Area2D

@export var bullet_speed = 700
var multiplier = 1


func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	global_position.x += bullet_speed * _delta * multiplier
		


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


