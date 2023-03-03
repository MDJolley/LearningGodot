extends Area2D

@onready var health_bar = $HealthBar

var currentHealth
var maxHealth

# Called when the node enters the scene tree for the first time.
func _ready():
	maxHealth = 1000
	currentHealth = maxHealth
	health_bar.update_max_health(maxHealth)
	health_bar.update_health(currentHealth)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_enemy_hurtbox_area_entered(projectile):
	take_damage(projectile)

func modifyHP(amount):
	print("Dummy took ", amount, " damage.")
	currentHealth += amount
	print("Current HP = ", currentHealth)
	if(currentHealth > maxHealth) : currentHealth = maxHealth
	if currentHealth <= 0 : queue_free()
	health_bar.update_health(currentHealth)

func take_damage(projectile):
	modifyHP(-projectile.get_parent().damage)
	projectile.get_parent().hit_enemy()
