extends CharacterBody2D

const PELURU = preload("res://source/Follow Mouse/peluru.tscn")
#const MAIN_MENU = preload("res://source/Main Menu/main_menu.tscn")

@export var health:int = 3

func _process(delta: float) -> void:
	position = get_global_mouse_position()

func tembak():
	var peluru = PELURU.instantiate()
	peluru.position = self.position
	peluru.add_to_group("player")
	
	get_parent().add_child(peluru)

func _on_timer_timeout() -> void:
	tembak()
	#pass

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group('enemy'):
		if ('dmg' in area):
			health -= area.dmg
	if health <= 0:
		if G.high_score < int($"../Number".text):
			G.high_score = int($"../Number".text)
		print('mati')
		get_tree().change_scene_to_file("res://source/Main Menu/main_menu.tscn")
