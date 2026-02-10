extends Control

var shop_button_scene = preload("res://scenes/ui/shop_button.tscn")

func _ready() -> void:
	reveal(Enum.Shop.HAT)

func reveal(shop_type: Enum.Shop = Enum.Shop.HAT):
	show()
	for item_enum in Data.STYLE_UPGRADES if shop_type == Enum.Shop.HAT else Data.MACHINE_UPGRADE_COST:
		var shop_button = shop_button_scene.instantiate()
		shop_button.setup(shop_type, item_enum, $GridContainer)
