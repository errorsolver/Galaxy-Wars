extends Area2D

@export var speed:int = 1000
@export var dmg:int = 1

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	move(delta)

func move(delta):
	position -= (Vector2(0, 1) * speed) * delta
	if position.y < -600:
		queue_free()
