extends RigidBody2D


var speed = 120


# Called when the node enters the scene tree for the first time.
func _ready():
	var totalSpeed = speed * (3 + get_node("../..").bulletSpeedLevel) / 3
	
	randomize()
	var maxAngle = PI/25 * get_node("../..").bulletSpreadLevel
	print(maxAngle)
	var myAngle = rand_range(-maxAngle, maxAngle)
	# set_transform(get_transform().rotated(myAngle))
	
	apply_central_impulse(Vector2(sin(myAngle) * totalSpeed, -cos(myAngle) * totalSpeed))
	
	pass 


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
