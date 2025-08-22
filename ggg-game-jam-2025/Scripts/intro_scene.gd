extends Node2D


var _in_character_selection = false
var _selected_character = ""

var _cutscene_labeling = "intro_cutscene_%s"


@onready var animated_sprite = $AnimatedSprite2D

@onready var bear_outline = $BearOutline
@onready var bunny_outline = $BunnyOutline


func _ready() -> void:
	bear_outline.self_modulate.a = 0.0
	bunny_outline.self_modulate.a = 0.0


func _choose_character(character: String) -> void:
	CharacterChoice.set_character_choice(character)
	_in_character_selection = false
	bear_outline.self_modulate.a = 0.0
	bunny_outline.self_modulate.a = 0.0
	animated_sprite.play(_cutscene_labeling % _selected_character)

# Adjusts opacity of both areas, along with current value of _selected_character
func _hover_bunny() -> void:
	bunny_outline.self_modulate.a = 0.3
	bear_outline.self_modulate.a = 0.8
	_selected_character = "bunny"
func _hover_bear() -> void:
	bear_outline.self_modulate.a = 0.3
	bunny_outline.self_modulate.a = 0.8
	_selected_character = "bear"
func _stop_hovering() -> void:
	bear_outline.self_modulate.a = 0.5
	bunny_outline.self_modulate.a = 0.5
	_selected_character = ""


func _input(event: InputEvent) -> void:
	if (Input.is_action_just_pressed("ui_accept")):
		# Goes to test_level when cutscene is finished. CHANGE TO LEVEL 1 WHEN CREATED
		if (animated_sprite.frame == 4):
			get_tree().change_scene_to_file("res://Scenes/Levels/test_level.tscn")
		
		if (not _in_character_selection and animated_sprite.frame < 4):
			if (not (animated_sprite.animation == "intro_cutscene_start" and animated_sprite.frame == 3)):
				animated_sprite.frame += 1
	
	
	if (not _in_character_selection and animated_sprite.animation == "intro_cutscene_start" and animated_sprite.frame == 3):
		bear_outline.self_modulate.a = 0.5
		bunny_outline.self_modulate.a = 0.5
		_in_character_selection = true
	
	
	# Allows UI buttons to navigate character selection screen
	if (_in_character_selection):
		if (Input.is_action_just_pressed("ui_left")):
			_hover_bunny()
		if (Input.is_action_just_pressed("ui_right")):
			_hover_bear()
		if (Input.is_action_just_pressed("ui_accept") and not _selected_character == ""):
			_choose_character(_selected_character)


# Selects character when hovered over by mouse
func _on_bunny_area_2d_mouse_entered() -> void:
	if (_in_character_selection): _hover_bunny()
func _on_bear_area_2d_mouse_entered() -> void:
	if (_in_character_selection): _hover_bear()

# Deselects both characters when mouse moves out of Area2D
func _on_bunny_area_2d_mouse_exited() -> void:
	if (_in_character_selection): _stop_hovering()
func _on_bear_area_2d_mouse_exited() -> void:
	if (_in_character_selection): _stop_hovering()

# Handles mouse clicking on either character
func _on_bunny_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (_in_character_selection and Input.is_action_just_pressed("ui_accept")):
		_choose_character(_selected_character)
func _on_bear_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (_in_character_selection and Input.is_action_just_pressed("ui_accept")):
		_choose_character(_selected_character)
