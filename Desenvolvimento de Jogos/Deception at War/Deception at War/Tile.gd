extends Area2D

var Ground1 = preload("res://Sprites/BlueGround.png")
var Ground2 = preload("res://Sprites/RedGround.png")
var Ground3 = preload("res://Sprites/YellowGround.png")
var Ground4 = preload("res://Sprites/PurpleGround.png")




# is this the starting tile?
# a Base building will be placed here at the start of the game
export var startTile = false

# do we have a building on this tile?
var hasBuilding : bool = false

# can we place a building on this tile?
var canPlaceBuilding : bool = false

# components
onready var Ground : Sprite = get_node("Ground")
onready var highlight : Sprite = get_node("Highlight")
onready var buildingIcon : Sprite = get_node("BuildingIcon")
onready var Troop : Label = get_node("Troop")

# called once when the node is initialized
func _ready ():
	
	# add the tile to the "Tiles" group when the node is initialized
	add_to_group("Tiles")

# turns on or off the green highlight
func toggle_highlight (toggle):
	
	highlight.visible = toggle
	canPlaceBuilding = toggle

func tile_get_texture():
	return Ground
	
func tile_set_texture(P):
	if P == 1:
		Ground.set_texture(Ground1)
		pass
	if P == 2:
		Ground.set_texture(Ground2)
		pass
	if P == 3:
		Ground.set_texture(Ground3)
		pass
	if P == 4:
		Ground.set_texture(Ground4)
		pass
# called when a building is placed on the tile
# sets the tile's building texture to display it
func place_building (buildingTexture):
	
	hasBuilding = true
	buildingIcon.texture = buildingTexture

# called when an input event takes place on the tile
func _on_Tile_input_event(viewport, event, shape_idx):
	
	# did we click on this tile with our mouse?
	if event is InputEventMouseButton and event.pressed:
		var gameManager = get_node("/root/MainScene")
		
		# if we can place a building down on this tile, then do so
		if gameManager.currentlyPlacingBuilding and canPlaceBuilding:
			gameManager.place_building(self)
