extends Control

var slotPath = preload("res://ui/rune_slot.tscn")
@onready var wand = Global.equipped_wand
@onready var runes = wand.get_runes()
@onready var slotContainer = $Slot_Container
@onready var slotsArray = Array()

#Rune_Slot
#@Rune_Slot@2
#@Rune_Slot@3
#@Rune_Slot@4    <--  The syntax of multiple slots.

func _ready():
	print(runes)
	for x in wand.runeSlots:
		var slot = slotPath.instantiate()
		slotsArray.append(slot)
		slotContainer.add_child( slot )
	for index in slotsArray.size():
		if(slotsArray[index]):
			slotsArray[index].set_slotted_rune(runes[index])
			print("Setting ", slotsArray[index].get_name(), " to ", runes[index].get_name() )
