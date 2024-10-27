extends Area2D

const PELURU = preload("res://source/Follow Mouse/peluru.tscn")
#@onready var angka: Label = $"../Angka"
signal musuh_mati(poin)
const poin = 1
@export var health:int = 2
@export var speed:int = 50

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	position += Vector2(0, 1) * speed * delta

func tembak():
	var peluru = PELURU.instantiate()
	peluru.position = get_parent().position
	peluru.add_to_group('peluru-musuh')
	
	add_child(peluru)
	move_to_front()

func _on_timer_timeout() -> void:
	tembak()

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group('peluru-pemain'):
		print('damage: ', area.dmg)
		health -= area.dmg
		area.queue_free()
	
	if health <= 0:
		#var intHS = int(angka.text)
		#intHS += 1
		#angka.text = str(intHS)
		emit_signal("musuh_mati", poin)
		
		queue_free()
