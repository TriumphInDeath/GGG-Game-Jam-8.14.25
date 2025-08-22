extends Node

var _character_choice = "bunny"




func set_character_choice(choice: String) -> void:
	_character_choice = choice

func get_character_choice() -> String:
	return _character_choice

func kill_player() -> void:
	pass # Look into using a singleton and/or custom signals to tell player to die
