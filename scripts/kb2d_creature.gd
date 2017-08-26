extends KinematicBody2D

export var bcontrol = true

export var move_speed = 5

var status = preload("res://scripts/status.gd").new()

var DamageShape = preload("res://damageshapes/basedamage.tscn")

var dir = Vector2(0,0)
var point = Vector2(0,0)

func _ready():
	# Initialization here
	set_process_input(true)
	set_process(true)
	
func _input(event):
	if Input.is_action_pressed("fire"):
		print(status.healthpoint)
		var pos = get_pos()
		var damageshape = DamageShape.instance();
		point.x = dir.x * 40
		point.y = dir.y * 40
		damageshape.set_pos(point)
		
		add_child(damageshape)
		
	
func _process(delta):
	
	if bcontrol:
		if Input.is_action_pressed("move_left"):
			move(Vector2(-move_speed,0))
			dir.x = -1
			dir.y = 0
			
		if Input.is_action_pressed("move_right"):
			move(Vector2(move_speed,0))
			dir.x = 1
			dir.y = 0
			
		if Input.is_action_pressed("move_up"):
			move(Vector2(0,-move_speed))
			dir.x = 0
			dir.y = -1
			
		if Input.is_action_pressed("move_down"):
			move(Vector2(0,move_speed))
			dir.x = 0
			dir.y = 1
			
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