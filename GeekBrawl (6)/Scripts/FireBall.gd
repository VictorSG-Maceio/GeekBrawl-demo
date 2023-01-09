extends KinematicBody2D

var speed = 400

func _ready():
	look_at(get_global_mouse_position())

func _physics_process(delta):
	move_and_slide( Vector2.RIGHT.rotated(rotation) * speed )
	for i in get_slide_count():
		var other = get_slide_collision(i).collider
		if "Enemy" in other.name:
			other.damage()
			queue_free()
