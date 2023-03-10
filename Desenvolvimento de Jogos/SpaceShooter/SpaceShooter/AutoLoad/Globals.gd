extends Node

#var score = 0
var level = 1
var language = 0
var Difficulty = 1
var tries = 1
var speed = 0
var hp = 0
var ammo = 0
var rate = 0

var lazer = false
var MG = false
var penetration = false

func son():
	var sum = hp + speed + ammo + rate
	speed = 0
	hp = 0
	ammo = 0
	rate = 0
	while sum > 0:
		var rand_var = randi() % 4
		if rand_var == 0:
			speed += 1
		elif rand_var == 1:
			hp += 1
		elif rand_var == 1:
			ammo += 1
		else:
			rate += 1
		sum -= 1
	

func get_lazer():
	return lazer

func set_lazer(c):
	if c == 1:
		lazer = true
	else:
		lazer = false

func get_MG():
	return MG

func set_MG(c):
	if c == 1:
		MG = true
	else:
		MG = false

func get_penetration():
	return penetration

func set_penetration(c):
	if c == 1:
		penetration = true
	else:
		penetration = false


func get_rate():
	return rate

func set_rate(c):
	rate = c

func get_ammo():
	return ammo

func set_ammo(c):
	ammo = c


func get_hp():
	return hp

func set_hp(c):
	hp = c
	
func get_speed():
	return speed

func set_speed(c):
	speed = c
	
func get_tries():
	return tries

func set_tries(c):
	tries = c

func get_Difficulty():
	return Difficulty

func set_Difficulty(c):
	Difficulty = c

func get_level():
	return level

func set_level():
	level = level + 1

#func get_score():
#	return score
	
#func set_score(c):
#	score = score + c

func get_language():
	return language

func set_language(c):
	language = c
