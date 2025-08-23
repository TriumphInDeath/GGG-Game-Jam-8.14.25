extends Area2D

var _active = false

func set_death_plane(boolean: bool) -> void:
	_active = boolean


func _on_body_entered(body: Node2D) -> void:
	if (body.name == "Player" and _active):
		SignalBus.kill_player.emit()
