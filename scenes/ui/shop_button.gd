extends Button

var item_enum
const ICON_PATHS = {
	Enum.Item.WOOD: "res://graphics/icons/wood.png",
	Enum.Item.FISH: "res://graphics/icons/silverfish.png",
	Enum.Item.APPLE: "res://graphics/icons/apple.png",
	Enum.Item.CORN: "res://graphics/icons/corn.png",
	Enum.Item.WHEAT: "res://graphics/icons/wheat.png",
	Enum.Item.PUMPKIN: "res://graphics/icons/pumpkin.png",
	Enum.Item.TOMATO: "res://graphics/icons/tomato.png"}
var shop_type: Enum.Shop

func setup(new_shop_type, item, parent):
	item_enum = item
	shop_type = new_shop_type
	parent.add_child(self)
	var source = Data.STYLE_UPGRADES if shop_type == Enum.Shop.HAT else Data.MACHINE_UPGRADE_COST
	var data = source[item_enum]
	
	$VBoxContainer/VBoxContainer/Label.text = data['name']
	$VBoxContainer/ColorRect.color = data['color']
	$VBoxContainer/ColorRect/TextureRect.texture = data['icon']
	
	var icon_1 = load(ICON_PATHS[data['cost'].keys()[0]])
	var icon_2 = load(ICON_PATHS[data['cost'].keys()[1]])
	
	$VBoxContainer/VBoxContainer/Control/HBoxContainer/HBoxContainer/TextureRect.texture = icon_1
	$VBoxContainer/VBoxContainer/Control/HBoxContainer/HBoxContainer2/TextureRect.texture = icon_2
	
	$VBoxContainer/VBoxContainer/Control/HBoxContainer/HBoxContainer/Label.text = str(data['cost'].values()[0])
	$VBoxContainer/VBoxContainer/Control/HBoxContainer/HBoxContainer2/Label.text = str(data['cost'].values()[1])
