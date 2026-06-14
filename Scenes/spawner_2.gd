extends Node2D

@onready var enemy2 = preload("res://Scenes/enemy2.tscn")


func _on_timer_timeout() -> void:
	var enemy2inst = enemy2.instantiate()
	enemy2inst.position = position
	get_parent().add_child(enemy2inst)
	pass # Replace with function body.
