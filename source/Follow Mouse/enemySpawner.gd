extends Node2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_enemy_timer_timeout() -> void:
	const MUSUH = preload("res://source/Follow Mouse/musuh.tscn")
	var musuh = MUSUH.instantiate()
	var spawnR = randf()

	musuh.position = Vector2(get_viewport().size.x * spawnR, 0)

	add_child(musuh)
