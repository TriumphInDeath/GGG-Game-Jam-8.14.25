extends AnimatableBody2D

const SHAKE = 5

@onready var _shaking = false
@onready var _collapsed = false

@onready var collapse_timer = $CollapseTimer
@onready var sprite = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (_shaking):
		
		if (randi_range(0, 5) == 0):
			sprite.transform.origin += Vector2(randi_range(-SHAKE, SHAKE), randi_range(-SHAKE, SHAKE))
	if (_collapsed):
		transform.origin.y += 10


func _on_stood_on_body_entered(body: Node2D) -> void:
	if (not _shaking and body.name == "Player"):
		_shake()
		collapse_timer.start()


func _on_stood_on_body_exited(body: Node2D) -> void:
	if (not _collapsed): _collapse()


func _on_collapse_timer_timeout() -> void:
	if (not _collapsed): _collapse()

func _shake() -> void:
	_shaking = true
	print("shake")

func _collapse() -> void:
	_collapsed = true
	_shaking = false
	print("collapse") # transform.y += 100
