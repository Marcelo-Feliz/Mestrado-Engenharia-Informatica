extends Area2D

signal enemy_died

signal base_damage

export (int) var speed = 150 + (50 * Globals.get_Difficulty()) + (10 * Globals.get_level() )+  (Globals.get_Difficulty() * 5 * Globals.get_level())        

var hp = 0 + Globals.get_level() / 3

func ready():
	pass
	

func _physics_process(delta):
	print(hp)
	global_position.y += speed *delta
	if global_position.y > 850:
		queue_free()
		emit_signal("base_damage")

func take_damage(damage):
	hp -= damage
	if hp <= 0:
		queue_free()
		emit_signal("enemy_died")
		

func _on_Enemy_area_entered(area):
	if area is Player:
		area.take_damage(1)
		
