extends Node2D

const projectilePath = preload("res://scenes/Projectile.tscn")

var canShoot : bool = true #Will be used to set attack speed
var attackSpeed #Attacks per second before % multipliers
var attackSpeedMultiplier : float = 0 #Percent bonus attack speed
var multishot : int #Number of projectiles
var spread #Degrees / Rads between multishot projectiles

func _ready():
	pull_stats_from_player()
	pass # Replace with function body.

func _process(delta):
	look_at(get_global_mouse_position())
	pass

func shoot():
	var attackSpeedCalculated : float = (1.0/attackSpeed)*(1+attackSpeedMultiplier)
	if !canShoot : pass
	else:
		var projectile = projectilePath.instantiate()
		projectile.position = $Projectile_Origin.global_position
		projectile.rotation = rotation
		projectile.apply_central_force(Vector2(200,0).rotated(projectile.rotation))
		get_tree().get_root().add_child(projectile)
		canShoot = false
		await get_tree().create_timer(attackSpeedCalculated).timeout
		canShoot = true

func pull_stats_from_player():
	var player = get_parent()
	attackSpeed = 5
