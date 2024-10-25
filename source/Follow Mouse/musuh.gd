extends Area2D

const PELURU = preload("res://source/Follow Mouse/peluru.tscn")

@export var speed:int = 80
@export var health:int = 5
@onready var number: Label = $"../Number"

func _ready() -> void:
	pass

func move(delta):
	position += Vector2(0, 1) * speed * delta

func _process(delta: float) -> void:
	move(delta)

func tembak():
	var peluru = PELURU.instantiate()
	peluru.position = get_parent().position
	peluru.add_to_group('enemy')
	add_child(peluru)

func _on_timer_timeout() -> void:
	tembak()

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group('player'):
		health -= area.dmg
		mati(true)

func mati(player):
	if health <= 0 and player:
		var numStr = str(int(number.text) + 1)
		number.text = numStr
		queue_free()
