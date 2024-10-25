extends CharacterBody2D

const PELURU = preload("res://source/Follow Mouse/peluru.tscn")
@export var darah:int = 3
 
func _process(delta: float) -> void:
	position = get_global_mouse_position()

func tembak():
	var peluru = PELURU.instantiate()
	peluru.position = self.position
	peluru.add_to_group('pemain')
	
	get_parent().add_child(peluru)

func _on_timer_timeout() -> void:
	tembak()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group('musuh'):
		darah -= area.dmg
	
	print(darah)
	if darah <= 0:
		if HS.score < int($"../Angka".text):
			HS.score = int($"../Angka".text)
		get_tree().change_scene_to_file("res://source/Main Menu/Main Menu.tscn")
