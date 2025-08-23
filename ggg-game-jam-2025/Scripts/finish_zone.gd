extends Area2D

@export var next_level = ""
var _level_path = "res://Scenes/Levels/%s.tscn"

@onready var timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_body_entered(body: Node2D) -> void:
	timer.start()


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file(_level_path % next_level)
