extends KinematicBody2D

const moveSpeed = 25
const maxSpeed = 70

const jumpHeight = -300
const up = Vector2(0,-1)
const gravity = 15

onready var sprite = $Sprite
onready var animationPlayer = $AnimationPlayer

var motion = Vector2() 

func _physics_process(_delta):
	motion.y +=gravity
	var friction = false
	
	if Input.is_action_pressed("ui_right"):
		sprite.flip_h = true
		animationPlayer.play("walk")
		motion.x = min(motion.x + moveSpeed,maxSpeed)
		
	elif Input.is_action_pressed("ui_left"):
		sprite.flip_h = false
		animationPlayer.play("walk")
		motion.x = max(motion.x - moveSpeed, -maxSpeed)
		
	else:
		animationPlayer.play("idle")
		friction = true
		
	if is_on_floor():
		if Input.is_action_pressed("ui_accept"):
			motion.y = jumpHeight
		if friction == true:
			motion.x = lerp(motion.x,0,0.5)
	else:
		if friction ==true:
			motion.x = lerp(motion.x,0,0.01)
	motion = move_and_slide(motion,up)
	

func addcoin():
	var canvasLayer = get_tree().get_root().find_node("UI-CANVAS",true,false)
	canvasLayer.SilverCoinHandler()
	
func addcoinGold():
	var canvasLayer = get_tree().get_root().find_node("UI-CANVAS",true,false)
	canvasLayer.GoldCoinHandler()

func bounce():
	motion.y = jumpHeight * 0.7

func anDamage():
	$Sprite/AnimationPlayer.play("damage")

func damage1():
	motion.x = jumpHeight * -0.7
	anDamage()
	
func damage2():
	motion.x = jumpHeight * 0.7
	anDamage()

