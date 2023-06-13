extends KinematicBody2D

const MAX_SPEED : float = 35.0
const GRAVITY : float = 25.0

var motion := Vector2()
onready var animationPlayer = $Sprite/AnimationPlayer

func _ready():
	motion.x = MAX_SPEED

func _physics_process(_delta):
	motion.y += GRAVITY
	_move()

	motion = move_and_slide(motion)
	
func _next_to_left_wall() -> bool:
	return $Left.is_colliding()

func _next_to_right_wall() -> bool:
	return $Right.is_colliding()

func _floor_detection() -> bool:
	return $Sprite/FloorDetection.is_colliding()

func _flip():
	motion.x *= -1
	$Sprite.scale.x *= -1

func _move():
	if _next_to_right_wall() or _next_to_left_wall() or !_floor_detection():
		_flip()


func _on_sides_body_entered(body):
	if body.is_in_group("Player"):
		print("atras")
		body.damage1()
		
func _on_sides2_body_entered(body):
	if body.is_in_group("Player"):
		print("delante")
		body.damage2()

func _on_top_body_entered(body):
	if body.is_in_group("Player"):
		animationPlayer.play("dead")
		print("top")
	body.bounce()



func _on_delante_body_entered(body):
	if body.is_in_group("Player"):
		body.damage1()

func _on_atras_body_entered(body):
	if body.is_in_group("Player"):
		body.damage2()

func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()




