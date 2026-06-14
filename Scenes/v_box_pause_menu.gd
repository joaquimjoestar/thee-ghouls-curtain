extends VBoxContainer

func _ready():
	visible = false
	get_tree().paused = false
	$"../blurFadein".play("RESET")
	$"../VBoxOptions".visible = false

func pause():
	visible = true
	get_tree().paused = true
	$"../blurFadein".play("blurfade")

func resume():
	visible = false
	get_tree().paused = false
	$"../blurFadein".play_backwards("blurfade")
	$"../VBoxOptions".visible = false

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Pause"):
		if get_tree().paused:
			resume()
		else:
			pause()

func options():
	visible = false
	$"../VBoxOptions".visible = true

func _on_pause_continue_pressed() -> void:
	resume()

func _on_pause_restart_pressed() -> void:
	resume()
	get_tree().call_deferred("reload_current_scene")

func _on_pause_quit_pressed() -> void:
	get_tree().quit()

func _on_pause_options_pressed() -> void:
	options()

func _on_return_pressed() -> void:
	visible = true
	$"../VBoxOptions".visible = false
	pass # Replace with function body.
