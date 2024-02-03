extends Area2D
@export var level: int = 0
func _on_body_entered(body):
	GlobalScript.level = level
func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		get_tree().change_scene_to_file("res://level_1.tscn")
