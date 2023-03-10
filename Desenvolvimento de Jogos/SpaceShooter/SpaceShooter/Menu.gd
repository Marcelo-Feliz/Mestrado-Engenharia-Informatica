extends Control


func _ready():
	$HBoxContainer/Number.text = str(Globals.get_level())
	if Globals.get_MG() or Globals.get_lazer() or Globals.get_penetration():
		$GridContainer.visible = false
	
	
		
	if Globals.get_level()>1:
		$VBoxContainer/Options.visible = false
		$VBoxContainer/Instructions.visible = false
		$GridContainer2.visible = true
		$GridContainer2/Label.text = "SPEED: " + str(Globals.get_speed())
		$GridContainer2/Label2.text = "ARMOR: " + str(Globals.get_hp())
		$GridContainer2/Label3.text = "AMMO/RECOIL: " + str(Globals.get_ammo())
		$GridContainer2/Label4.text = "RATE: " + str(Globals.get_rate())
		
		if Globals.get_tries() > 0:
			$VBoxContainer/SPEED.visible = true
			$VBoxContainer/ARMOR.visible = true
			$VBoxContainer/AMMO.visible = true
			$VBoxContainer/RATE.visible = true
		Globals.set_tries(1)
		
	else:
		pass
	if Globals.get_MG():
		$VBoxContainer/AMMO.text = "Reduce recoil"


func _on_Game_pressed():
	get_tree().change_scene("res://World.tscn")


func _on_Options_pressed():
	get_tree().change_scene("res://Options.tscn")


func _on_Instructions_pressed():
	get_tree().change_scene("res://Instructions.tscn")


func _on_Button_pressed():
	Globals.set_speed(Globals.get_speed()+1)
	$VBoxContainer/SPEED.visible = false
	$VBoxContainer/ARMOR.visible = false
	$VBoxContainer/AMMO.visible = false
	$VBoxContainer/RATE.visible = false
	
func _on_Button2_pressed():
	Globals.set_hp(Globals.get_hp()+1)
	$VBoxContainer/SPEED.visible = false
	$VBoxContainer/ARMOR.visible = false
	$VBoxContainer/AMMO.visible = false
	$VBoxContainer/RATE.visible = false


func _on_AMMO_pressed():
	Globals.set_ammo(Globals.get_ammo()+1)
	$VBoxContainer/SPEED.visible = false
	$VBoxContainer/ARMOR.visible = false
	$VBoxContainer/AMMO.visible = false
	$VBoxContainer/RATE.visible = false
	
func _on_RATE_pressed():
	Globals.set_rate(Globals.get_rate()+1)
	$VBoxContainer/SPEED.visible = false
	$VBoxContainer/ARMOR.visible = false
	$VBoxContainer/AMMO.visible = false
	$VBoxContainer/RATE.visible = false



func lazer():
	$GridContainer.visible = false
	Globals.set_lazer(1)


func _on_MG_pressed():
	$GridContainer.visible = false
	Globals.set_MG(1)
	pass # Replace with function body.

func _on_penetration_pressed():
	$GridContainer.visible = false
	Globals.set_penetration(1)
	pass # Replace with function body.


func _on_Exit_pressed():
	get_tree().quit()











