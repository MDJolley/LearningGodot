extends CharacterBody2D
class_name Entity

@onready var health_bar = $HealthBar

var maxHealth : int
var currentHealth : int
var healthRegen : int
var armour : int
var canRegen : bool

var maxMana : int
var currentMana : int
var manaRegen : int
const regenTime = 1
var regenDelta : float

func _ready():
	pass

func applyDamage(amount):
	if(get_node_or_null("RegenDelay")):
		canRegen = false
		var timer : Timer = get_node(("RegenDelay"))
		timer.start(5)
	var damageTaken = amount - armour
	if (damageTaken < 1): damageTaken = 1
	if (currentHealth > damageTaken): 
		currentHealth -= damageTaken
		health_bar.update_health(currentHealth)
	else: die()

func modifyHP(amount):
	currentHealth += amount
	if(currentHealth > maxHealth) : currentHealth = maxHealth
	health_bar.update_health(currentHealth)

func regenHP(delta):
	if(canRegen && currentHealth < maxHealth):
		regenDelta += delta
		if(regenDelta >= regenTime):
			modifyHP(60)
			regenDelta -= regenTime

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
