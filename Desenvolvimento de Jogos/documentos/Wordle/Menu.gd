extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$HBoxContainer/Number.text = str(Globals.get_score())


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Game_pressed():
	get_tree().change_scene("res://Game.tscn")


func _on_Options_pressed():
	get_tree().change_scene("res://Options.tscn")


func _on_Instructions_pressed():
	get_tree().change_scene("res://Instructions.tscn")
