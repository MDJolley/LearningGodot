extends Entity

onready var player_camera = $Camera
onready var regen_delay = $RegenDelay

var level : int
var velocity = Vector2(0,0)
var moveSpeed : int

func _ready():
	initialize_stats()
	health_bar.update_max_health(maxHealth)
	health_bar.update_health(currentHealth)
	player_camera.make_current()
	applyDamage(50)	

func initialize_stats():
	canRegen = true
	maxHealth = 200
	currentHealth = 51
	healthRegen = 1
	armour = 0
	maxMana = 200
	currentMana = 200
	manaRegen = 10
	moveSpeed =30

func _process(delta):
	move(moveSpeed)
	move_and_slide(velocity)
	regenHP(delta)

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


func _on_RegenDelay_timeout():
	
	canRegen = true
