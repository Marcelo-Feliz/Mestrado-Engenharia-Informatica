extends Control


func _ready():
	if Globals.get_language() == 1:
		$VBoxContainer/OptionButton.selected = 1
	$VBoxContainer/OptionButton2.selected = Globals.get_Difficulty()



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
