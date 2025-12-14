extends Sprite2D

var y_velocity = 400
var x_velocity = 400
var gravity = 200
var jumpHeight = -250

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var playerDirection = 0
	if Input.is_action_pressed("Right") :
		playerDirection = 1
	if Input.is_action_pressed("Left") :
		playerDirection = -1 
	if Input.is_action_just_pressed("Jump") and position.y > 550: 
		y_velocity = jumpHeight
	if position.y < 630 : 
		y_velocity += gravity * delta
	if position.x > 1100 : 
		position.x = 1100
	if position.x < 60 : 
		position.x = 60

	print(position.x, position.y)
	position.x += x_velocity * playerDirection * delta
	if(position.y < 600 || y_velocity < 0) :
		position.y += y_velocity * delta
