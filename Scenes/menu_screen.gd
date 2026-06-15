extends Node2D
@onready var buttonselectsound : AudioStreamPlayer = $buttonselect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	buttonselectsound.play()
	get_tree().change_scene_to_file("res://Scenes/mainScene.tscn")


func _on_options_pressed() -> void:
	buttonselectsound.play()
	$CanvasLayer/MarginContainer/VBoxMenu.visible = false
	$CanvasLayer/VBoxOptions.visible = true
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	buttonselectsound.play()
	get_tree().quit()


func _on_return_pressed() -> void:
	buttonselectsound.play()
	$CanvasLayer/MarginContainer/VBoxMenu.visible = true
	$CanvasLayer/VBoxOptions.visible = false
