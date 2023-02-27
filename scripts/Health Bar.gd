extends Control

onready var health_bar = $TextureProgress
onready var color_healthy = Color.green

func _ready():
	health_bar.tint_progress = color_healthy

func update_health(health):
	health_bar.value = health
	print("health set to ", health)

func update_max_health(max_health):
	print(max_health)
	health_bar.max_value = max_health
