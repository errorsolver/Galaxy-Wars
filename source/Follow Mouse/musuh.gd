extends Area2D

const PELURU = preload("res://source/Follow Mouse/peluru.tscn")
@onready var angka: Label = $"../Angka"
@export var health:int = 1
@export var speed:int = 100

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	position += Vector2(0, 1) * speed * delta

func tembak():
	var peluru = PELURU.instantiate()
	peluru.position = get_parent().position
	peluru.add_to_group('musuh')
	
	add_child(peluru)

func _on_timer_timeout() -> void:
	tembak()



func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group('pemain'):
		print('damage: ', area.dmg)
		health -= area.dmg
	
	if health <= 0:
		var intHS = int(angka.text)
		intHS += 1
		angka.text = str(intHS)
		
		queue_free()
