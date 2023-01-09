extends KinematicBody2D

var target

var direction = Vector2()
var speed = 150

func _ready():
	target = get_parent().get_node("Player") as KinematicBody2D

func _physics_process(delta):
	direction = global_position.direction_to(target.global_position)
	move_and_slide( direction * speed )
