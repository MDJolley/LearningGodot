extends Area2D

const direction = Vector2.RIGHT
var lifetime : float = .5
var speed
var damage
var pierce

func _ready():
	await get_tree().create_timer(lifetime).timeout
	queue_free()

func _process(delta):
	pass

func _physics_process(delta):
	translate(direction.rotated(rotation) * speed * delta)

func _on_player_hitbox_area_entered(enemy):
	print("hitting Enemy")
	pierce -= 1
	if pierce < 0 : queue_free() 


func hit_enemy():
	print("hitting Enemy")
	pierce -= 1
	if pierce < 0 : 
		await get_tree().create_timer(.03).timeout
		queue_free() 
