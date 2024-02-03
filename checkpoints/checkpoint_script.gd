extends Area2D
@export var level: int = 0
func _on_body_entered(body):
	GlobalScript.level = level
