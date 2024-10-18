extends CharacterBody2D

const PELURU = preload("res://source/Follow Mouse/peluru.tscn")

func _process(delta: float) -> void:
	position = get_global_mouse_position()
	

func tembak():
	var peluru = PELURU.instantiate()
	peluru.position = get_parent().position
	
	add_child(peluru)


func _on_timer_timeout() -> void:
	tembak()
