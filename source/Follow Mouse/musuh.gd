extends Area2D

const PELURU = preload("res://source/Follow Mouse/peluru.tscn")


func _ready() -> void:
	pass
func _process(delta: float) -> void:
	pass

func tembak():
	var peluru = PELURU.instantiate()
	peluru.position = get_parent().position
	
	add_child(peluru)


func _on_timer_timeout() -> void:
	tembak()
