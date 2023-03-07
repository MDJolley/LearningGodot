extends Node

var rune_directory = "res://Items/_repo/_runes/"
var runes = Array[Rune]

func _ready():
	_load_by_directory(rune_directory, runes)

func _load_by_directory(directory_string : String, save_array : Array):
	var directory = DirAccess.open(directory_string)
	directory.list_dir_begin()
	var filename = directory.get_next()
	while(filename):
		if not directory.current_is_dir():
			save_array.append(load(str(directory_string, filename)))
		filename = directory.get_next()

#Not sure how I want to do this function yet.  2 params?  Array[Array]?
#CURRENTLY--1 func for each itemtype, hence get RUNE by name.
func get_rune_by_name(item_name : String) -> ItemResource:
	for rune in runes:
		if rune.name == item_name:
			return rune
	return null
