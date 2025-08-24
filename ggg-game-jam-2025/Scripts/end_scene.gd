extends Node2D

var _character_choice = "bunny"
var _cutscene_labeling = "end_cutscene_%s"

@onready var animated_sprite = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_character_choice = CharacterChoice.get_character_choice()
	animated_sprite.play(_cutscene_labeling % _character_choice)

func _input(event: InputEvent) -> void:
	if (Input.is_action_just_pressed("ui_accept")):
		if (animated_sprite.frame < 3):
			animated_sprite.frame += 1
