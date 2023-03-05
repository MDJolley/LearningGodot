extends ItemResource
class_name Rune

@export var level : int 
@export var attackSpeed : float = 2 #Attacks per second before % multipliers
@export var attackSpeedMultiplier : float = 0 #Percent bonus attack speed
@export var multishot : int = 0 #Number of ADDITIONAL projectiles
@export var spread : float #Degrees / Rads between multishot projectiles
@export var speed : float #Projectile speed
@export var lifetime : float #Time in seconds before bullet queue_free()
@export var damage : float #Base damage of each projectile
@export var pierce : int #Number of enemies this projectile can penetrate

func _ready():
	itemType = ItemType.RUNE


func equip(target):
	target.add_attackSpeed(attackSpeed)
	target.add_attackSpeedMultiplier(attackSpeedMultiplier)
	target.add_multishot(multishot)
	target.add_spread(spread)
	target.add_speed(speed)
	target.add_lifetime(lifetime)
	target.add_damage(damage)
	target.add_pierce(pierce)
