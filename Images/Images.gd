extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var image = Image.new()
	print(image)
	image.load("res://Images/download.png")
	var t = ImageTexture.new()
	t.create_from_image(image)
	$Sprite.texture = t
