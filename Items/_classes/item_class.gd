extends Resource
class_name ItemResource

@export var name : String
@export var itemType : ItemType
@export var texture : Texture

enum ItemType { CONSUMABLE, RUNE, EQUIPMENT }
