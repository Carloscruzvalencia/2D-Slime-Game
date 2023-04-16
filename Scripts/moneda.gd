extends Area2D

func _on_SilverSCoin_body_entered(body):
	if body.is_in_group("Player"):
		body.addcoin()
		queue_free()
