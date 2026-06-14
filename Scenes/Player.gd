extends CharacterBody2D

const JUMP_VELOCITY = -500.0 

var lifeList : Array[TextureRect]
var life = 3

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		if visible == false:
			get_tree().call_deferred("reload_current_scene")
	move_and_slide()
	
func _ready() -> void:
	var lifeParent = $CanvasLayer/HBoxContainer
	for child in lifeParent.get_children():
		lifeList.append(child)
	print(lifeList)

func take_damage():
	if life > 0:
		life -= 1
		#$"../damageAnimation".play()
		update_life_display()

func update_life_display():
	for i in range(lifeList.size()):
		lifeList[i].visible = i < life
	
	if life <= 0:
		visible = false
		$CanvasLayer/Label.visible = true
		$CanvasLayer/Timer.stopped = true
