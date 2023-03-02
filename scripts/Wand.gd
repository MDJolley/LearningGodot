extends Node2D

const projectilePath = preload("res://scenes/Projectile.tscn")

func _ready():
	pass # Replace with function body.

func _process(delta):
	look_at(get_global_mouse_position())
	pass

func shoot():
	var projectile = projectilePath.instantiate()
	var new_pos = $Projectile_Origin.global_position
	var new_rot = rotation
	projectile.position = new_pos
	projectile.rotation = new_rot
	get_tree().current_scene.add_child(projectile)
