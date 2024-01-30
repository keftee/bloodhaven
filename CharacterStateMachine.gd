extends Node

class_name CharacterStateMachine

var states : Array[State]
# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		if (child is State):
			states.append(child)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
