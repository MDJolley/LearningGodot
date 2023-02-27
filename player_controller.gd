extends Entity


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var level
var velocity = Vector2(0,0)
var moveSpeed = 30
var hp = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	get_child(0).make_current()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move(moveSpeed)
	move_and_slide(velocity)

func move(speed):
	speed *= 5
	if(Input.is_action_pressed("move_up") && Input.is_action_pressed("move_down")):
		velocity.y = 0
	elif(Input.is_action_pressed("move_up")):
		velocity.y = -speed
	elif(Input.is_action_pressed("move_down")):
		velocity.y = speed
	else:
		velocity.y = 0
	if(Input.is_action_pressed("move_right") && Input.is_action_pressed("move_left")):
		velocity.y = 0
	elif(Input.is_action_pressed("move_right")):
		velocity.x = speed
	elif(Input.is_action_pressed("move_left")):
		velocity.x = -speed
	else:
		velocity.x = 0
	#velocity = velocity.normalized()
	
