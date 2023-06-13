extends Area2D

onready var animationPlayer = $body
	
func _on_SilverSCoin_body_entered(body):
	
	if body.is_in_group("Player"):
		animationPlayer.play("pick")
		body.addcoin()


func _on_body_animation_finished(anim_name):
	queue_free()
