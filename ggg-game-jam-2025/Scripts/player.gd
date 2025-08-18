extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -1000.0
const GRAVITY = 2000 # default gravity is 980

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		animated_sprite.flip_h = velocity.x > 0
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	
	
	# Play animations
	if is_on_floor():
		if not direction == 0: animated_sprite.play("running")
		if randi_range(0, 99) == 0: animated_sprite.play("blink")
		elif not animated_sprite.is_playing(): animated_sprite.play("still")
		
	# else:
		# if velocity.y < 0: animated_sprite.play("Jump")
		# else: animated_sprite.play("Fall")
