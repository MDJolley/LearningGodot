extends Control

@onready var health_bar = $TextureProgressBar
@onready var color_healthy = Color.GREEN

func _ready():
	health_bar.tint_progress = color_healthy

func update_health(health):
	health_bar.value = health

func update_max_health(max_health):
	health_bar.max_value = max_health
