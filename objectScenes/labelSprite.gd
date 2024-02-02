extends Area2D

var label: Label
const MAX_WIDTH = 4
@export var Text: String = ''
@export var spriteTexture : Texture

func _ready():
	label = $Label
	label.visible = false
	get_node("Sprite2D").texture = spriteTexture

func _process(delta):
	label.position.x = (-1) * (label.size.x / 2)
	delta = delta

func _on_Area2D_body_entered(body: Node2D) -> void:
	if body.is_in_group("character"):
		label.text = Text
		label.visible = true

func _on_Area2D_body_exited(body: Node2D) -> void:
	if body.is_in_group("character"):
		label.visible = false



func _on_body_entered(body):
	if body.is_in_group("character"):
		label.text = Text
		label.visible = true


func _on_body_exited(body):
	if body.is_in_group("character"):
		label.visible = false # Replace with function body.
