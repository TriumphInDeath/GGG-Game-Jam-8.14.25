extends StaticBody2D

@onready var sprite = $WhiteboardSprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_chore_erase_body_entered(body: Node2D) -> void:
	if (body.name == "Player"):
		sprite.texture = load("res://Sprites/FridgeMagnets/NEWwhiteboard_erased(1).PNG")
