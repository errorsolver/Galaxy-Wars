extends Node2D

const MUSUH = preload("res://source/Follow Mouse/musuh.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func munculkanMusuh():
	var musuh = MUSUH.instantiate()
	var random = randf()
	
	musuh.position = Vector2(1, 0) * random * get_viewport().size.x
	add_child(musuh)

func _on_timer_timeout() -> void:
	munculkanMusuh()


func _on_area_2d_area_exited(area: Area2D) -> void:
	if !area.is_in_group('player'):
		print('cleared: ', area.name)
		area.queue_free()
