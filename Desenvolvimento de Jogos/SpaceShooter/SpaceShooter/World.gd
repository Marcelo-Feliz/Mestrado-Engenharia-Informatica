extends Node2D

var Laser = preload("res://projectiles/PlayerLaser.tscn")
var score = 0

func _ready():
	if Globals.get_MG():
		$ammo.text = "∞"
	else:
		$ammo.text = str(+ Globals.get_ammo() * 5 + Globals.get_level() * 5 + 20)
	$Life.max_value = Globals.get_hp()+3
	$Life.value = Globals.get_hp()+3
	pass # Replace with function body.


func _on_Player_spawn_laser(location):
	var l = Laser.instance()
	l.global_position = location
	add_child(l)
	#OS.delay_msec(1000)
	#yield(get_tree().create_timer(1), "timeout")

func score():
	score += 1
	$HBoxContainer/Number.text = str(score)
	if score == 10 and Globals.get_level()==1:
		Globals.set_level()
		get_tree().change_scene("res://menu.tscn")
	elif score == 20:
		Globals.set_level()
		get_tree().change_scene("res://menu.tscn")

