extends KinematicBody2D
class_name Entity

onready var health_bar = $HealthBar

var maxHealth : int
var currentHealth : int
var healthRegen : int
var armour : int

var maxMana : int
var currentMana : int
var manaRegen : int

func _ready():
	pass

func applyDamage(amount):
	var damageTaken = amount - armour
	if (damageTaken < 1): damageTaken = 1
	if (currentHealth > damageTaken): 
		currentHealth -= damageTaken
		health_bar.update_health(currentHealth)
	else: die()

func regenHP():
	if (currentHealth < maxHealth):
		if (currentHealth + healthRegen > maxHealth):
			currentHealth = maxHealth
			health_bar.update_health(currentHealth)
		else: 
			currentHealth += healthRegen
			health_bar.update_health(currentHealth)
		

func modifyMana(amount):
	var newMana = currentMana + amount
	if (newMana > maxMana): currentMana = maxMana
	if (newMana < 0): currentMana = 0
	else: currentMana += amount

func regenMana():
	if (currentMana < maxMana):
		if (currentMana + manaRegen > maxMana):
			currentMana = maxMana
		else: currentMana += manaRegen

func die():
	#print("you are dead")
	pass
