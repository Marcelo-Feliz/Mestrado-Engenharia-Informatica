extends KinematicBody2D

export (int) var speed = 400
onready var target = position
var velocity = Vector2()



onready var panel3 = get_node("/root/Node/Node/KinematicBody2D3/p1")
onready var panel4 = get_node("/root/Node/Node/KinematicBody2D2/p2")

func _enter_tree():
	if not InputMap.has_action("click"):
		InputMap.add_action("click")
	var event = InputEventMouseButton.new()
	event.button_index = BUTTON_LEFT
	InputMap.action_add_event("click", event)

func _input(event):
	if Main.get_a() == 0:
		if event.is_action_pressed("click"):
			target = get_global_mouse_position()
			panel3.visible = !panel3.visible
			panel4.visible = !panel4.visible

func _physics_process(delta):
	velocity = position.direction_to(target) * speed
	# look_at(target)
	if position.distance_to(target) > 5:
		velocity = move_and_slide(velocity)
		Main.set_a(1)
	
