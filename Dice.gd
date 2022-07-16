extends Node


# Declare member variables here. Examples:

var bulletCooldownLevel = 0
var bulletSpeedLevel = 0
var bulletSpreadLevel = 0
var playerSpeedLevel = 0
var playerFrictionLevel = 0

var buffCooldownTime = 1
var lastBuffTime = 0
var runtime = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	runtime += delta
	
	if runtime - lastBuffTime > buffCooldownTime:
		lastBuffTime = runtime
		randomize()
		var rand = floor(rand_range(1, 6))
		match rand:
			1.0: bulletCooldownLevel += 1
			2.0: bulletSpeedLevel += 1
			3.0: bulletSpreadLevel += 1
			4.0: playerSpeedLevel += 1
			5.0: playerFrictionLevel += 1
	pass
