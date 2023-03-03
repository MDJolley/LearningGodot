extends Area2D

const direction = Vector2.RIGHT
var lifetime : float = .5
var speed

func _ready():
	await get_tree().create_timer(lifetime).timeout
	queue_free()

func _process(delta):
	pass

func _physics_process(delta):
	translate(direction.rotated(rotation) * speed * delta)
