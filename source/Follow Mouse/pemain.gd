extends CharacterBody2D

const PELURU = preload("res://source/Follow Mouse/peluru.tscn")
const MAIN_MENU = preload("res://source/Main Menu/Main Menu.tscn")

@export var darah:int = 3
const speed:int = 1000
var darahSaatIni:int = darah
signal healthPlayerSignal(darah:int, darahSaatIni:int)
signal playerMati(isTrue:bool)

var isHoldLeft = false
var isHoldRight = false
var isHoldUp = false
var isHoldDown = false

func _ready() -> void:
	print(OS.get_name())
	print(OS.get_model_name())
	emit_signal("healthPlayerSignal", darah, darahSaatIni)
	
func _process(delta: float) -> void:
	if OS.get_name() == 'Windows':
		position = get_global_mouse_position()
	
	if isHoldLeft:
		position -= Vector2(1,0) * speed * delta
	if isHoldRight:
		position += Vector2(1,0) * speed * delta
	if isHoldUp:
		position -= Vector2(0,1) * speed * delta
	if isHoldDown:
		position += Vector2(0,1) * speed * delta
	
func tembak():
	var peluru = PELURU.instantiate()
	peluru.position = self.position
	peluru.add_to_group('peluru-pemain')
	
	get_parent().add_child(peluru)
	move_to_front()

func _on_timer_timeout() -> void:
	tembak()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group('peluru-musuh'):
		darahSaatIni = darahSaatIni - area.dmg
		emit_signal("healthPlayerSignal", darah, darahSaatIni)
		area.queue_free()
	
	if darahSaatIni <= 0:
		#if HS.score < int($"../Angka".text):
			#HS.score = int($"../Angka".text)
		emit_signal('playerMati', true)
		
		get_tree().change_scene_to_packed(MAIN_MENU)














func _on_left_pressed() -> void:
	isHoldLeft = true

func _on_left_button_up() -> void:
	isHoldLeft = false

func _on_right_pressed() -> void:
	isHoldRight = true

func _on_right_button_up() -> void:
	isHoldRight = false

func _on_down_pressed() -> void:
	isHoldDown = true
	print('bot pres')

func _on_down_button_up() -> void:
	isHoldDown = false
	print('bot reles')

func _on_top_pressed() -> void:
	print('top pres')
	isHoldUp = true

func _on_top_button_up() -> void:
	isHoldUp = false
	print('top reles')
	
