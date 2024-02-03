extends Control




func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://level_1.tscn")


func _on_credits_pressed():
	pass # Replace with function body.


func _on_exit_pressed():
	get_tree().quit()
