extends Node2D

signal base_damage
signal add_score
var spawn_positions = null

var Enemy = preload("res://characters/enemy/Enemy.tscn")
var Boss = 1

func _ready():
	if Globals.get_Difficulty() == 0:
		$SpwanTimer.wait_time = 3 - 0.1 * Globals.get_level()
	if Globals.get_Difficulty() == 1:
		$SpwanTimer.wait_time = 2.0 - 0.1* Globals.get_level()
	if Globals.get_Difficulty() == 2:
		$SpwanTimer.wait_time = 2.0 - 0.1* Globals.get_level()
	
	randomize()
	spawn_positions = $SpawnPositions.get_children()
	

func spawn_enemy():
	var index = randi() % spawn_positions.size()
	var enemy = Enemy.instance()
	enemy.global_position = spawn_positions[index].global_position
	enemy.connect("enemy_died",self, "enemy_died")
	enemy.connect("base_damage",self, "base_damage")
	add_child(enemy)


func _on_SpwanTimer_timeout():
	spawn_enemy()

func enemy_died():
	emit_signal("add_score")

func base_damage():
	emit_signal("base_damage")
