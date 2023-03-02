extends RigidBody2D

var lifetime : float = .5

func _ready():
	mass = .01
	await get_tree().create_timer(lifetime).timeout
	queue_free()

func _process(delta):
	pass

func _physics_process(delta):
	pass

