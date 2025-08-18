extends AnimatableBody2D

# @onready var animated_sprite = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_stood_on_body_entered(body: Node2D) -> void:
	pass # start platform shaking/showing signs of falling




func _on_stood_on_body_exited(body: Node2D) -> void:
	pass # if not already falling, make platform fall


func _collapse() -> void:
	pass # transform.y += 100
