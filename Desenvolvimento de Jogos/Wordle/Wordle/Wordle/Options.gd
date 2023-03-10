extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Globals.get_language() == 1:
		$VBoxContainer/OptionButton.selected = 1
	$VBoxContainer/OptionButton2.selected = Globals.get_Difficulty()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Menu_pressed():
	get_tree().change_scene("res://menu.tscn")


func _on_OptionButton_item_selected(index):
	if index == 1:
		Globals.set_language(1)
	elif index ==0:
		Globals.set_language(0)


func _on_OptionButton2_item_selected(index):
	if index == 0:
		Globals.set_Difficulty(0)
	elif index ==1:
		Globals.set_Difficulty(1)
	elif index ==2:
		Globals.set_Difficulty(2)
