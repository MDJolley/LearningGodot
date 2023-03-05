extends Node2D
class_name Wand

var projectilePath = preload("res://scenes/Projectile.tscn")

var canShoot : bool = true #Will be used to set attack speed
var runeSlots : int #Number of slots available to equip runes
@export var equippedRunes : Array[Resource] #Array of all Rune Resources in rune slots

@export var attackSpeed : float #Attacks per second before % multipliers
@export var attackSpeedMultiplier : float = 0 #Percent bonus attack speed
@export var multishot : int #Number of projectiles
@export var spread : float #Degrees / Rads between multishot projectiles
@export var speed : float #Projectile speed
@export var lifetime : float #Time in seconds before bullet queue_free()
@export var damage : int #Base damage of each projectile
@export var pierce : int #Number of enemies this projectile can penetrate
@export var baseStats : Array #[attackSpeed, attackSpeedMultiplier, multishot, spread, speed, lifetime, damage, pierce]

func _ready():
	pull_stats_from_player() #REMOVE THIS AS SOON AS RUNES GIVE STATS
	save_base_stats()
	for rune in equippedRunes:
		print(rune.name)
	pull_stats_from_runes()

func _process(delta):
	look_at(get_global_mouse_position())

func shoot():
	var attackSpeedCalculated : float = (1.0/attackSpeed)*(1+attackSpeedMultiplier)
	if canShoot :
		var step : float = spread / multishot
		var cof_start : float = -(spread / 2) + step/2
		for x in multishot:
			var projectile = projectilePath.instantiate()
			set_projectile_stats(projectile)
			projectile.rotate(
				deg_to_rad(cof_start + (step * x))
				)
			get_tree().get_root().add_child(projectile)
		canShoot = false
		await get_tree().create_timer(attackSpeedCalculated).timeout
		canShoot = true

func set_projectile_stats(projectile):
	projectile.position = $Projectile_Origin.global_position
	projectile.rotation = rotation
	projectile.speed = speed
	projectile.damage = damage
	projectile.pierce = pierce

func pull_stats_from_player():
	var player = get_parent()
	attackSpeed = 5
	speed = 400
	spread = 0.0
	multishot = 1
	damage = 20
	pierce = 0

func pull_stats_from_runes():
	for rune in equippedRunes:
		rune.equip(self)

func save_base_stats():
	baseStats = [attackSpeed, attackSpeedMultiplier, multishot, spread, speed, lifetime, damage, pierce]

func reset_stats():
	attackSpeed = baseStats[0]
	attackSpeedMultiplier = baseStats[1]
	multishot = baseStats[2]
	spread = baseStats[3]
	speed = baseStats[4]
	lifetime = baseStats[5]
	damage = baseStats[6]
	pierce = baseStats[7]

func add_attackSpeed(value : float):
	attackSpeed += value

func add_attackSpeedMultiplier(value : float):
	attackSpeedMultiplier += value

func add_multishot(value : int):
	multishot += value

func add_spread(value : float):
	spread += value

func add_speed(value : float):
	speed += value

func add_lifetime(value : float):
	lifetime += value

func add_damage(value : int):
	damage += value

func add_pierce(value : int):
	pierce += value
