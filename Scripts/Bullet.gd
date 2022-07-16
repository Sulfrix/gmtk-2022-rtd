extends RigidBody2D


var speed = 120


# Called when the node enters the scene tree for the first time.
func _ready():
	pass 
	
	apply_central_impulse(Vector2(0, -speed))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
