extends Entity

@onready var player_camera = $Camera3D
@onready var regen_delay = $RegenDelay

const projectilePath = preload("res://scenes/Projectile.tscn")

var level : int
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
	moveSpeed = 40

func _process(delta):
	regenHP(delta)
	shoot()

func _physics_process(delta):
	move(moveSpeed)
	move_and_slide()

func move(speed):
	speed *= 3
	var direction = Vector2(Input.get_vector("move_left","move_right","move_up","move_down").normalized())
		#Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		#Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	velocity = (direction * speed)

func _on_RegenDelay_timeout():
	canRegen = true

func shoot():
	if Input.is_action_just_pressed("fire"):
		var projectile = projectilePath.instantiate()
		var position = $Wand.shoot()
#		get_node("Projectile_Origin").global_position
#		projectile.position = position
#		get_tree().current_scene.add_child(projectile)
		
	
