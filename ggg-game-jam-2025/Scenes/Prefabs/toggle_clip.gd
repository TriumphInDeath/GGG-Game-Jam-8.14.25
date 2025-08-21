extends AnimatableBody2D


var _opened = false

@onready var animated_sprite = $AnimatedSprite2D
@onready var collision_shape = $CollisionShape2D
@onready var held_object = $HeldObject


func _on_stood_on_body_exited(body: Node2D) -> void:
	if (not _opened): _open()


func _process(delta: float) -> void:
	if (_opened):
		held_object.transform.origin.y += 10


func _open() -> void:
	_opened = true
	animated_sprite.play("open")
	collision_shape.disabled = true
	print("open") # transform.y += 100
