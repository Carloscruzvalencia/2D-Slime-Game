extends Node2D


func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		$Sprite/AnimationPlayer.play("start")
		body.addcoinGold()
		$Timer.start(1)


func _on_Timer_timeout():
	queue_free()
