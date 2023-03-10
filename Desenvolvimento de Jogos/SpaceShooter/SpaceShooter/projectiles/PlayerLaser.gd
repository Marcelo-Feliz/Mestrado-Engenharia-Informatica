extends Area2D


var speed = 1000
var MG
var recoil = 700
var recoil2 = 50


func _ready():
	MG  =  Globals.get_MG()
	recoil = 700 - (50 * Globals.get_ammo())
	if recoil < 0:
		recoil = 0
	recoil = rand_range(-recoil, recoil)
	recoil2 = rand_range(-50, 50)
	
func _physics_process(delta):
	if MG:
		global_position.y += -speed * delta
		global_position.x += recoil * delta
	if Globals.get_penetration():
		global_position.y += -speed * delta
		global_position.x += recoil2 * delta
	else:
		global_position.y += -speed * delta

func _on_PlayerLaser_area_entered(area):
	if area.is_in_group("enemies"):
		if Globals.get_lazer():
			area.take_damage(3)
		else:
			area.take_damage(1)
		if not Globals.get_penetration():
			queue_free()
