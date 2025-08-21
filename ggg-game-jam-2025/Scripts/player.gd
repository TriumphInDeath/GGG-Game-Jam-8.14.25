extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -800.0
const GRAVITY = 1000 # default gravity is 980

var _airTime = 0
var _canJump = true

# @onready delays calling this until after children have loaded so the sprite can be found
@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += GRAVITY * delta
		_airTime += 1
	else:
		_airTime = 0
		_canJump = true

	# Handle jump.
	if Input.is_action_just_pressed("jump") and _airTime < 9 and _canJump:
		velocity.y = JUMP_VELOCITY
		_canJump = false

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		animated_sprite.flip_h = velocity.x > 0
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	
	
	# Play animations
	if is_on_floor():
		if not direction == 0: animated_sprite.play("running")
		else: animated_sprite.play("idle")
		
	# else:
		# if velocity.y < 0: animated_sprite.play("Jump")
		# else: animated_sprite.play("Fall")
