extends Area2D

#Player

func _on_DeadZone_body_entered(body):
	if body.get_name() == "Player":
		get_tree().reload_current_scene()
	pass # Replace with function body.
