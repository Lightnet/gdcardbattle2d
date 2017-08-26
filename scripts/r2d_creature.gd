extends RigidBody2D

export var bcontrol = true
export var move_speed = 5
var status = preload("res://scripts/status.gd").new()

func _ready():
	# Initialization here
	set_process_input(true)
	set_process(true)
	
func _input(event):
	if Input.is_action_pressed("fire"):
		#print(status.healthpoint)
		pass
	
func _process(delta):
	
	if bcontrol:
		if Input.is_action_pressed("move_left"):
			#move(Vector2(-move_speed,0))
			pass
			
		if Input.is_action_pressed("move_right"):
			#move(Vector2(move_speed,0))
			pass
		if Input.is_action_pressed("move_up"):
			#move(Vector2(0,-move_speed))
			pass
		if Input.is_action_pressed("move_down"):
			#move(Vector2(0,move_speed))
			pass
			
func Damage(_from,_damage,_damagetype):
	status.healthpoint -= _damage
	updatehealthbar()
	#pass
	
func updatehealthbar():
	var progressbar = get_node("ProgressBar")
	if progressbar != null:
		var hp = float( status.healthpoint)
		var hpmax = float( status.healthpointmax)
		var percent =  clamp(hp / hpmax * 100, 0.00, 100)
		print(percent,"|",hp,"|",hpmax)
		progressbar.set_value(percent)
