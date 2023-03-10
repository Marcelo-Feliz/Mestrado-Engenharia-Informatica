extends Area2D
class_name Player

signal spawn_laser(location)

onready var muzzle = $Muzzle

var input_vector = Vector2.ZERO

var speed =  300
var hp = 3
var ammo = 20
var MG = false
var fire_rate = 1


var shot_timer
var can_shoot = true
var time_between_shots = 1.0 / fire_rate

func _ready():
	fire_rate = fire_rate + Globals.get_rate()
	ammo = ammo + Globals.get_ammo() * 5 + Globals.get_level() * 5
	speed = Globals.get_speed()*50 + speed
	hp = hp + Globals.get_hp()
	MG = Globals.get_MG()
	if MG:
		ammo = 9999
		fire_rate = fire_rate * 2
	time_between_shots = 1.0 / fire_rate
	if Globals.get_lazer():
		$"Red-line".visible = true
	
	shot_timer = Timer.new()
	shot_timer.wait_time = time_between_shots
	shot_timer.connect("timeout", self, "shot_timer_timeout")
	add_child(shot_timer)



func shot_timer_timeout():
  # The timer has timed out, so the player can fire again
  can_shoot = true


func _physics_process(delta):
	input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_vector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	global_position += input_vector * speed * delta
	if global_position[0] < 30:
		global_position[0] = 30
	if global_position[0] > 500:
		global_position[0] = 500
	if global_position[1] > 820:
		global_position[1] = 820
	if global_position[1] < 40:
		global_position[1] = 40
	
	if Input.is_action_pressed("shoot"):
		shoot_laser()



func take_damage(damage):
	hp -= damage
	$"../Life".value = hp
	if hp <= 0:
		queue_free()
		Globals.son()
		Globals.set_tries(0)
		get_tree().reload_current_scene()
		get_tree().change_scene("res://menu.tscn")

func _on_Player_area_entered(area):
	if area.is_in_group("enemies"):
		area.take_damage(30)




func  shoot_laser():
	if can_shoot:
		if not MG:
			if ammo > 0:
				emit_signal("spawn_laser", muzzle.global_position)
				ammo = ammo - 1
				$"../ammo".text =  str(ammo)
		if MG:
			emit_signal("spawn_laser", muzzle.global_position)
		
		shot_timer.start()
		can_shoot = false
	else:
	# The player can't shoot because the timer hasn't timed out yet
		pass

func _on_EnemySpawner_base_damage():
	take_damage(1)





