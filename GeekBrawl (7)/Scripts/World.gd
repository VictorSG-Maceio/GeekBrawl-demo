extends Node2D

var enemy = preload("res://Instances/Enemy.tscn")

func _on_Spawner_timeout():
	randomize()
	var clone = enemy.instance()
	clone.global_position.x = rand_range(0, 1024)
	clone.global_position.y = rand_range(0, 600)
	add_child(clone)
