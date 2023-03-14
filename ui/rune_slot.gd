extends Panel

@export var slottedRune : Rune

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func set_slotted_rune(rune):
	slottedRune = rune
	$Rune_Texture.set_texture(slottedRune.texture)

func get_slotted_rune() -> Resource:
	return slottedRune
