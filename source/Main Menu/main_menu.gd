extends Control

const ROOM = preload("res://source/Follow Mouse/room.tscn")
@onready var HighScore: Label = $VBoxContainer/CenterContainer3/Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	HighScore.text = str(G.high_score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func gantiScene():
	get_tree().change_scene_to_packed(ROOM)

func _on_button_pressed() -> void:
	gantiScene()

func _on_exit_pressed() -> void:
	get_tree().quit()
