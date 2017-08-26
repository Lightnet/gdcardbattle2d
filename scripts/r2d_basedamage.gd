extends RigidBody2D

var creature = null
var damage = 10
var damagetype = null

var time = 0
var timemax = 2;

func _ready():
	set_process(true)
	#pass

func _process(delta):
	time += 1
	if time > timemax:
		queue_free()
	#pass

func _on_basedamage_body_enter( body ):
	print("hit something")
	if body.is_in_group("creature"):
		print("found!")
		body.Damage(creature,damage,damagetype)
	
	
	pass # replace with function body
