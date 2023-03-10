extends Node

var score1 = -1
var score2 = 0
var a = 1


onready var panel = get_node("/root/Node/Node/pause_popup")
onready var panel1 = get_node("/root/Node/Node/pause_popup/p1")
onready var panel2 = get_node("/root/Node/Node/pause_popup/p2")

func get_score1():
	return score1
	
func set_score1(c):
	score1 = c
	if score1 == 3:
		get_tree().paused = true
		panel.visible = !panel.visible
		panel2.visible = !panel2.visible
		

func get_score2():
	return score2
	
func set_score2(c):
	score2 = c
	if score2 == 3:
		get_tree().paused = true
		panel.visible = !panel.visible
		panel1.visible = !panel1.visible

func get_a():
	return a
	
func set_a(b):
	a = b

func _ready():
	pass # Replace with function body.
