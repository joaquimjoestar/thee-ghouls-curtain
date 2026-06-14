extends CharacterBody2D

const JUMP_VELOCITY = -500.0 

var lifeList : Array[TextureRect]
var life = 3
@onready var blinkanimation = $AnimatedSprite2D/damageAnimation
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var explosion: AnimatedSprite2D = $Explosion
@onready var PlayerSprite: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		if PlayerSprite.visible == false:
			get_tree().call_deferred("reload_current_scene")
	move_and_slide()
	
	if Input.is_action_just_pressed("Pause"):
		return
	
func _ready() -> void:
	var lifeParent = $CanvasLayer/HBoxContainer
	for child in lifeParent.get_children():
		lifeList.append(child)
	print(lifeList)

func take_damage():
	if life > 0 and !blinkanimation.is_playing():
		life -= 1
		update_life_display()
		explosion.play("default")
		audio_stream_player.play()
		blinkanimation.play("DamageBlink")
		await get_tree().create_timer(1).timeout
		blinkanimation.stop()

func update_life_display():
	for i in range(lifeList.size()):
		lifeList[i].visible = i < life
	
	if life <= 0:
		PlayerSprite.visible = false
		$CanvasLayer/Label.visible = true
		$CanvasLayer/Timer.stopped = true
		$Explosion.visible = true
