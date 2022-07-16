extends RigidBody2D


# Declare member variables here. Examples:
var mySpeed = 100
var myFriction = 6
var velocity = 0

var leftInput = 0
var rightInput = 0
var upInput = 0
var downInput = 0

var bullet = preload("res://Bullets/Bullet.tscn")
var bulletShootTime = 0

var runtime = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	runtime += delta
	
	var idealSpeed = Vector2(rightInput - leftInput, downInput - upInput)
	idealSpeed = idealSpeed.normalized() * speed()
	
	var currentSpeed = get_linear_velocity()
	var totalFriction = min(friction() * delta, 1)
	
	var force = totalFriction * (idealSpeed - currentSpeed)
	var newVelocity = get_linear_velocity() + force
	
	set_linear_velocity(newVelocity)
	
	pass

func spawnBullet(keyPressed):
	if runtime - bulletShootTime < bulletCooldown(): return
	
	var bulletInstance = bullet.instance()
	add_child(bulletInstance)
	bulletShootTime = runtime

func bulletCooldown():
	return 0.5 * (4 - get_node("..").bulletCooldownLevel) / 4

func friction():
	return myFriction * 3 / (3 + get_node("..").playerFrictionLevel)

func speed():
	return mySpeed / 3 * (3 + get_node("..").playerSpeedLevel)

func _input(event):
	if event.is_action_pressed("ui_left"):
		leftInput = 1
	if event.is_action_pressed("ui_right"):
		rightInput = 1
	if event.is_action_pressed("ui_up"):
		upInput = 1
	if event.is_action_pressed("ui_down"):
		downInput = 1
		
	if event.is_action_released("ui_left"):
		leftInput = 0
	if event.is_action_released("ui_right"):
		rightInput = 0
	if event.is_action_released("ui_up"):
		upInput = 0
	if event.is_action_released("ui_down"):
		downInput = 0
	
	if event.is_action_pressed("ui_accept"):
		spawnBullet("J")
	if event.is_action_pressed("ui_cancel"):
		spawnBullet("K")
