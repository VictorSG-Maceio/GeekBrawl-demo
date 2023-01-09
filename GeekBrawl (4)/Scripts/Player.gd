extends KinematicBody2D

var fireball = preload("res://Instances/FireBall.tscn")

var direction = Vector2()
var speed = 200

func _physics_process(delta):
	if Input.is_key_pressed(KEY_D):
		direction.x = 1
	elif Input.is_key_pressed(KEY_A):
		direction.x = -1
	else:
		direction.x = 0
	
	if Input.is_key_pressed(KEY_S):
		direction.y = 1
	elif Input.is_key_pressed(KEY_W):
		direction.y = -1
	else:
		direction.y = 0
	
	if Input.is_action_just_pressed("ui_accept"):
		var shoot = fireball.instance()
		shoot.global_position = self.global_position
		get_parent().add_child(shoot)
	
	move_and_slide( direction * speed )
	_animate()

func _animate():
	if global_position.x > get_global_mouse_position().x:
		$AnimatedSprite.flip_h = true
	elif global_position.x < get_global_mouse_position().x:
		$AnimatedSprite.flip_h = false
	
	if direction == Vector2.ZERO:
		$AnimatedSprite.animation = "Idle"
	else:
		$AnimatedSprite.animation = "Walk"
