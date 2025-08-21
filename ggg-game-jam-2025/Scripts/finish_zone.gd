extends Area2D

@export var next_level = ""
var level_path = "res://Scenes/Levels/%s.tscn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file(level_path % next_level)
