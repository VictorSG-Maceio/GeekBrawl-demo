extends KinematicBody2D

var target

var direction = Vector2()
var speed = 150

var life_max = 3
var life 

func _ready():
	life = life_max
	target = get_parent().get_node("Player") as KinematicBody2D

func _physics_process(delta):
	direction = global_position.direction_to(target.global_position)
	move_and_slide( direction * speed )
	
	for i in get_slide_count():
		var other = get_slide_collision(i).collider
		if "Player" in other.name:
			other.damage()
			$AnimatedSprite.animation = "Death"
			$CollisionShape2D.disabled = true
			target = self

func damage():
	life -= 1
	if life <= 0:
		$AnimatedSprite.animation = "Death"
		$CollisionShape2D.disabled = true
		target = self


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "Death":
		queue_free()
