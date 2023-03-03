extends Node2D

const projectilePath = preload("res://scenes/Projectile.tscn")

var canShoot : bool = true #Will be used to set attack speed
var attackSpeed #Attacks per second before % multipliers
var attackSpeedMultiplier : float = 0 #Percent bonus attack speed
var multishot : int #Number of projectiles
var spread : float #Degrees / Rads between multishot projectiles
var speed #Projectile speed
var lifetime : float #Time in seconds before bullet queue_free()
var damage : int #Base damage of each projectile
var pierce : int #Number of enemies this projectile can penetrate

func _ready():
	pull_stats_from_player()

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
#		var projectile = projectilePath.instantiate()
#		set_projectile_stats(projectile)
#		get_tree().get_root().add_child(projectile)
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
	pierce = 2
