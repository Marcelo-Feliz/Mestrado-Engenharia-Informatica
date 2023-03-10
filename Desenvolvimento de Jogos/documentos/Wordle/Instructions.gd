extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Language_pressed():
	if $ScrollContainer/VBoxContainer/Label2.visible == true:
		$ScrollContainer/VBoxContainer/Label2.visible = false
		$ScrollContainer/VBoxContainer/Label.visible = true
		$Language.text = "English"
	elif $ScrollContainer/VBoxContainer/Label2.visible == false:
		$ScrollContainer/VBoxContainer/Label2.visible = true
		$ScrollContainer/VBoxContainer/Label.visible = false
		$Language.text = "Portugues"


func _on_Button_pressed():
	get_tree().change_scene("res://menu.tscn")
