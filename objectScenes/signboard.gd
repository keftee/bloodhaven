extends Area2D

var label: Label
@export var Text: String = ''
# Called when the node enters the scene tree for the first time.
func _ready():
	label = $Label
	label.visible = false


func _on_Area2D_body_entered(body: Node2D) -> void:
	if body.is_in_group("character"):
		label.text = Text
		label.visible = true

func _on_Area2D_body_exited(body: Node2D) -> void:
	if body.is_in_group("character"):
		label.visible = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
