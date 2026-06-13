extends Node2D

@onready var enemy1 = preload("res://Scenes/Enemy1.tscn")


func _on_timer_timeout() -> void:
	var enemy1inst = enemy1.instantiate()
	enemy1inst.position = position
	get_parent().add_child(enemy1inst)
	pass # Replace with function body.
