extends Node

export (NodePath) var dropdown_path
onready var dropdown = get_node(dropdown_path)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	get_tree().change_scene("res://MainScene.tscn")
	pass # Replace with function body.


func _on_VideoPlayer_finished():
	$VideoPlayer.visible = false
	pass # Replace with function body.
