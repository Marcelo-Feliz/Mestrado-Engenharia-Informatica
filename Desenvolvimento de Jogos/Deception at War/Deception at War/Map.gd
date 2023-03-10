extends Node

# all the tiles in the game
var allTiles : Array

# all the tiles which have buildings on them
var tilesWithBuildings : Array
var tilesWithBuildings1 : Array
var tilesWithBuildings2 : Array
var tilesWithBuildings3 : Array
var tilesWithBuildings4 : Array
# size of a tile
var tileSize : float = 64.0

var rng = RandomNumberGenerator.new()

func _ready ():
	
	# when we're initialized, get all of the tiles
	allTiles = get_tree().get_nodes_in_group("Tiles")
	print("Numero de jogadores:",BuildingData.get_numberofplayers())
	#place_building(allTiles[110], BuildingData.alien.iconTexture,-1)
	if BuildingData.get_numberofplayers() == 2:
		place_building(allTiles[0], BuildingData.base.iconTexture,1)
		place_building(allTiles[179], BuildingData.base.iconTexture,2)
		allTiles[0].tile_set_texture (1)
		allTiles[179].tile_set_texture (2)
		allTiles[0].Troop.visible = true
		allTiles[179].Troop.visible = true
	
	if BuildingData.get_numberofplayers() == 3:
		place_building(allTiles[0], BuildingData.base.iconTexture,1)
		place_building(allTiles[179], BuildingData.base.iconTexture,2)
		place_building(allTiles[160], BuildingData.base.iconTexture,3)
		allTiles[0].tile_set_texture (1)
		allTiles[179].tile_set_texture (2)
		allTiles[160].tile_set_texture (3)
		allTiles[0].Troop.visible = true
		allTiles[179].Troop.visible = true
		allTiles[160].Troop.visible = true
		
	if BuildingData.get_numberofplayers() == 4:
		place_building(allTiles[0], BuildingData.base.iconTexture,1)
		place_building(allTiles[179], BuildingData.base.iconTexture,2)
		place_building(allTiles[160], BuildingData.base.iconTexture,3)
		place_building(allTiles[19], BuildingData.base.iconTexture,4)
		allTiles[0].tile_set_texture (1)
		allTiles[179].tile_set_texture (2)
		allTiles[19].tile_set_texture (4)
		allTiles[160].tile_set_texture (3)
		allTiles[0].Troop.visible = true
		allTiles[179].Troop.visible = true
		allTiles[160].Troop.visible = true
		allTiles[19].Troop.visible = true
		
	
	# find the start tile and place the Base building
	#for x in range(allTiles.size()):
		#if allTiles[x].startTile == true:
			#place_building(allTiles[0], BuildingData.base.iconTexture)

func fog_of_war (p):
	for x in range(allTiles.size()):
		allTiles[x].visible = false
		
	if p == 1:
		for x in range(allTiles.size()):
			if tilesWithBuildings1.find(allTiles[x]) > -1:
				allTiles[x].visible = true
		for x in range(tilesWithBuildings1.size()):
			
			# get the tile north, south, east and west of this one
			var northTile = get_tile_at_position(tilesWithBuildings1[x].position + Vector2(0, tileSize))
			var southTile = get_tile_at_position(tilesWithBuildings1[x].position + Vector2(0, -tileSize))
			var eastTile = get_tile_at_position(tilesWithBuildings1[x].position + Vector2(tileSize, 0))
			var westTile = get_tile_at_position(tilesWithBuildings1[x].position + Vector2(-tileSize, 0))
			
		
			# if the directional tiles aren't null, toggle their highlight - allowing us to build
			if northTile != null:
				if tilesWithBuildings1.find(northTile) == -1:
					northTile.visible = true
			if southTile != null:
				if tilesWithBuildings1.find(southTile) == -1:
					southTile.visible = true
			if eastTile != null:
				if tilesWithBuildings1.find(eastTile) == -1:
					#print(eastTile.tile_get_texture())
					eastTile.visible = true
			if westTile != null:
				if tilesWithBuildings1.find(westTile) == -1:
					#print(westTile.tile_get_texture())
					westTile.visible = true
	if p == 2:
		for x in range(allTiles.size()):
			if tilesWithBuildings2.find(allTiles[x]) > -1:
				allTiles[x].visible = true
		for x in range(tilesWithBuildings2.size()):
			
			# get the tile north, south, east and west of this one
			var northTile = get_tile_at_position(tilesWithBuildings2[x].position + Vector2(0, tileSize))
			var southTile = get_tile_at_position(tilesWithBuildings2[x].position + Vector2(0, -tileSize))
			var eastTile = get_tile_at_position(tilesWithBuildings2[x].position + Vector2(tileSize, 0))
			var westTile = get_tile_at_position(tilesWithBuildings2[x].position + Vector2(-tileSize, 0))
			
			# if the directional tiles aren't null, toggle their highlight - allowing us to build
			if northTile != null:
				if tilesWithBuildings2.find(northTile) == -1:
					northTile.visible = true
			if southTile != null:
				if tilesWithBuildings2.find(southTile) == -1:
					southTile.visible = true
			if eastTile != null:
				if tilesWithBuildings2.find(eastTile) == -1:
					eastTile.visible = true
			if westTile != null:
				if tilesWithBuildings2.find(westTile) == -1:
					westTile.visible = true
	if p == 3:
		for x in range(allTiles.size()):
			if tilesWithBuildings3.find(allTiles[x]) > -1:
				allTiles[x].visible = true
		for x in range(tilesWithBuildings3.size()):
			
			# get the tile north, south, east and west of this one
			var northTile = get_tile_at_position(tilesWithBuildings3[x].position + Vector2(0, tileSize))
			var southTile = get_tile_at_position(tilesWithBuildings3[x].position + Vector2(0, -tileSize))
			var eastTile = get_tile_at_position(tilesWithBuildings3[x].position + Vector2(tileSize, 0))
			var westTile = get_tile_at_position(tilesWithBuildings3[x].position + Vector2(-tileSize, 0))
			
			# if the directional tiles aren't null, toggle their highlight - allowing us to build
			if northTile != null:
				if tilesWithBuildings3.find(northTile) == -1:
					northTile.visible = true
			if southTile != null:
				if tilesWithBuildings3.find(southTile) == -1:
					southTile.visible = true
			if eastTile != null:
				if tilesWithBuildings3.find(eastTile) == -1:
					eastTile.visible = true
			if westTile != null:
				if tilesWithBuildings3.find(westTile) == -1:
					westTile.visible = true
	if p == 4:
		for x in range(allTiles.size()):
			if tilesWithBuildings4.find(allTiles[x]) > -1:
				allTiles[x].visible = true
		for x in range(tilesWithBuildings4.size()):
			
			# get the tile north, south, east and west of this one
			var northTile = get_tile_at_position(tilesWithBuildings4[x].position + Vector2(0, tileSize))
			var southTile = get_tile_at_position(tilesWithBuildings4[x].position + Vector2(0, -tileSize))
			var eastTile = get_tile_at_position(tilesWithBuildings4[x].position + Vector2(tileSize, 0))
			var westTile = get_tile_at_position(tilesWithBuildings4[x].position + Vector2(-tileSize, 0))
			
			# if the directional tiles aren't null, toggle their highlight - allowing us to build
			if northTile != null:
				if tilesWithBuildings4.find(northTile) == -1:
					northTile.visible = true
			if southTile != null:
				if tilesWithBuildings4.find(southTile) == -1:
					southTile.visible = true
			if eastTile != null:
				if tilesWithBuildings4.find(eastTile) == -1:
					eastTile.visible = true
			if westTile != null:
				if tilesWithBuildings4.find(westTile) == -1:
					westTile.visible = true
	
# returns a tile at the given position - returns null if no tile is found
func get_tile_at_position (position):
	var Ground
	#if player ==1:
	#	Ground = "Ground1"
	# loop through all of the tiles
	for x in range(allTiles.size()):
		# if the tile matches our given position, return it
		if allTiles[x].position == position:
			return allTiles[x]
		# and allTiles[x].tile_get_texture() != 
	return null

# highlights the tiles we can place buildings on
func highlight_available_tiles (player):
	print("Player:",player)
	if (player == 1):
		for x in range(tilesWithBuildings1.size()):
			
			# get the tile north, south, east and west of this one
			var northTile = get_tile_at_position(tilesWithBuildings1[x].position + Vector2(0, tileSize))
			var southTile = get_tile_at_position(tilesWithBuildings1[x].position + Vector2(0, -tileSize))
			var eastTile = get_tile_at_position(tilesWithBuildings1[x].position + Vector2(tileSize, 0))
			var westTile = get_tile_at_position(tilesWithBuildings1[x].position + Vector2(-tileSize, 0))
			
		
			# if the directional tiles aren't null, toggle their highlight - allowing us to build
			if northTile != null:
				if tilesWithBuildings1.find(northTile) == -1:
					northTile.toggle_highlight(true)
			if southTile != null:
				if tilesWithBuildings1.find(southTile) == -1:
					southTile.toggle_highlight(true)
			if eastTile != null:
				if tilesWithBuildings1.find(eastTile) == -1:
					#print(eastTile.tile_get_texture())
					eastTile.toggle_highlight(true)
			if westTile != null:
				if tilesWithBuildings1.find(westTile) == -1:
					#print(westTile.tile_get_texture())
					westTile.toggle_highlight(true)
	if (player == 2):
		for x in range(tilesWithBuildings2.size()):
			
			# get the tile north, south, east and west of this one
			var northTile = get_tile_at_position(tilesWithBuildings2[x].position + Vector2(0, tileSize))
			var southTile = get_tile_at_position(tilesWithBuildings2[x].position + Vector2(0, -tileSize))
			var eastTile = get_tile_at_position(tilesWithBuildings2[x].position + Vector2(tileSize, 0))
			var westTile = get_tile_at_position(tilesWithBuildings2[x].position + Vector2(-tileSize, 0))
			
			# if the directional tiles aren't null, toggle their highlight - allowing us to build
			
			var true_conditions = []
			if northTile != null:
				true_conditions.append("1")
			if southTile != null:
				true_conditions.append("2")
			if eastTile != null:
				true_conditions.append("3")
			if westTile != null:
				true_conditions.append("4")
			
			var selected_condition = true_conditions[randi() % true_conditions.size()]
			
			if selected_condition == "1":
				if tilesWithBuildings2.find(northTile) == -1:
					northTile.toggle_highlight(true)
					place_building(northTile, BuildingData.mine.iconTexture,2)
					northTile.tile_set_texture (2)
					return
		
			if selected_condition == "2":
				if tilesWithBuildings2.find(southTile) == -1:
					southTile.toggle_highlight(true)
					place_building(southTile, BuildingData.mine.iconTexture,2)
					southTile.tile_set_texture (2)
					return

			if selected_condition == "3":
				if tilesWithBuildings2.find(eastTile) == -1:
					eastTile.toggle_highlight(true)
					place_building(eastTile, BuildingData.mine.iconTexture,2)
					eastTile.tile_set_texture (2)
					return

			if selected_condition == "4":
				if tilesWithBuildings2.find(westTile) == -1:
					westTile.toggle_highlight(true)
					place_building(westTile, BuildingData.mine.iconTexture,2)
					westTile.tile_set_texture (2)
					return
	if (player == 3):
		for x in range(tilesWithBuildings3.size()):
			
			# get the tile north, south, east and west of this one
			var northTile = get_tile_at_position(tilesWithBuildings3[x].position + Vector2(0, tileSize))
			var southTile = get_tile_at_position(tilesWithBuildings3[x].position + Vector2(0, -tileSize))
			var eastTile = get_tile_at_position(tilesWithBuildings3[x].position + Vector2(tileSize, 0))
			var westTile = get_tile_at_position(tilesWithBuildings3[x].position + Vector2(-tileSize, 0))
			
			# if the directional tiles aren't null, toggle their highlight - allowing us to build
			if northTile != null:
				if tilesWithBuildings3.find(northTile) == -1:
					northTile.toggle_highlight(true)
			if southTile != null:
				if tilesWithBuildings3.find(southTile) == -1:
					southTile.toggle_highlight(true)
			if eastTile != null:
				if tilesWithBuildings3.find(eastTile) == -1:
					eastTile.toggle_highlight(true)
			if westTile != null:
				if tilesWithBuildings3.find(westTile) == -1:
					westTile.toggle_highlight(true)
	if (player == 4):
		for x in range(tilesWithBuildings4.size()):
			
			# get the tile north, south, east and west of this one
			var northTile = get_tile_at_position(tilesWithBuildings4[x].position + Vector2(0, tileSize))
			var southTile = get_tile_at_position(tilesWithBuildings4[x].position + Vector2(0, -tileSize))
			var eastTile = get_tile_at_position(tilesWithBuildings4[x].position + Vector2(tileSize, 0))
			var westTile = get_tile_at_position(tilesWithBuildings4[x].position + Vector2(-tileSize, 0))
			
			# if the directional tiles aren't null, toggle their highlight - allowing us to build
			if northTile != null:
				if tilesWithBuildings4.find(northTile) == -1:
					northTile.toggle_highlight(true)
			if southTile != null:
				if tilesWithBuildings4.find(southTile) == -1:
					southTile.toggle_highlight(true)
			if eastTile != null:
				if tilesWithBuildings4.find(eastTile) == -1:
					eastTile.toggle_highlight(true)
			if westTile != null:
				if tilesWithBuildings4.find(westTile) == -1:
					westTile.toggle_highlight(true)
	
# disables all of the tile highlights
func disable_tile_highlights ():
	
	for x in range(allTiles.size()):
		allTiles[x].toggle_highlight(false)
		
func add_troops (p):
	var troops = 0
	if p == 1:
		rng.randomize()
		var my_random_number = rng.randf_range(0,tilesWithBuildings1.size())
		#for x in range(tilesWithBuildings1.size()):
			#troops = tilesWithBuildings1[x].text
		var n = get_tile_at_position(tilesWithBuildings1[my_random_number].position)
		var t = int(n.Troop.text)
		t = t + 1
		n.Troop.text = str(t)
	if p == 2:
		rng.randomize()
		var my_random_number = rng.randf_range(0,tilesWithBuildings2.size())
		#for x in range(tilesWithBuildings1.size()):
			#troops = tilesWithBuildings1[x].text
		var n = get_tile_at_position(tilesWithBuildings2[my_random_number].position)
		var t = int(n.Troop.text)
		t = t + 1
		n.Troop.text = str(t)
	
	if p == 3:
		rng.randomize()
		var my_random_number = rng.randf_range(0,tilesWithBuildings3.size())
		#for x in range(tilesWithBuildings1.size()):
			#troops = tilesWithBuildings1[x].text
		var n = get_tile_at_position(tilesWithBuildings3[my_random_number].position)
		var t = int(n.Troop.text)
		t = t + 1
		n.Troop.text = str(t)
	
	if p == 4:
		rng.randomize()
		var my_random_number = rng.randf_range(0,tilesWithBuildings4.size())
		#for x in range(tilesWithBuildings1.size()):
			#troops = tilesWithBuildings1[x].text
		var n = get_tile_at_position(tilesWithBuildings4[my_random_number].position)
		var t = int(n.Troop.text)
		t = t + 1
		n.Troop.text = str(t)
	

# places down a building on the map
func place_building (tile, texture, player):
	var my_random_number = int(rng.randf_range(1,6))
	var troops = int(tile.Troop.text) -  my_random_number
	if (player == 1):
		if tilesWithBuildings2.find(tile) > -1:
			if troops < 0:
				tile.Troop.text = "1"
				tilesWithBuildings1.append(tile)
				tilesWithBuildings2.erase(tile)
				tile.place_building(texture)
				tile.Troop.visible = true
			else:
				tile.Troop.text = str(troops)
		elif tilesWithBuildings3.find(tile) > -1:
			if troops < 0:
				tile.Troop.text = "1"
				tilesWithBuildings1.append(tile)
				tilesWithBuildings3.erase(tile)
				tile.place_building(texture)
				tile.Troop.visible = true
			else:
				tile.Troop.text = str(troops)
		elif tilesWithBuildings4.find(tile) > -1:
			if troops < 0:
				tile.Troop.text = "1"
				tilesWithBuildings1.append(tile)
				tilesWithBuildings4.erase(tile)
				tile.place_building(texture)
				tile.Troop.visible = true
			else:
				tile.Troop.text = str(troops)
		else:
			tile.Troop.visible = true
			tilesWithBuildings1.append(tile)
			tile.place_building(texture)
		disable_tile_highlights()
	elif (player == 2):
		if tilesWithBuildings1.find(tile) > -1:
			if troops < 0:
				tile.Troop.text = "1"
				tilesWithBuildings2.append(tile)
				tilesWithBuildings1.erase(tile)
				tile.place_building(texture)
				tile.Troop.visible = true
			else:
				tile.Troop.text = str(troops)
		elif tilesWithBuildings3.find(tile) > -1:
			if troops < 0:
				tile.Troop.text = "1"
				tilesWithBuildings2.append(tile)
				tilesWithBuildings3.erase(tile)
				tile.place_building(texture)
				tile.Troop.visible = true
			else:
				tile.Troop.text = str(troops)
		elif tilesWithBuildings4.find(tile) > -1:
			if troops < 0:
				tile.Troop.text = "1"
				tilesWithBuildings2.append(tile)
				tilesWithBuildings4.erase(tile)
				tile.place_building(texture)
				tile.Troop.visible = true
			else:
				tile.Troop.text = str(troops)
		else:
			tile.Troop.visible = true
			tilesWithBuildings2.append(tile)
			tile.place_building(texture)
		disable_tile_highlights()
	elif (player == 3):
		tile.Troop.visible = true
		tilesWithBuildings3.append(tile)
		tile.place_building(texture)
		if tilesWithBuildings2.find(tile) > -1:
			tilesWithBuildings2.erase(tile)
		elif tilesWithBuildings1.find(tile) > -1:
			tilesWithBuildings1.erase(tile)
		elif tilesWithBuildings4.find(tile) > -1:
			tilesWithBuildings4.erase(tile)
		else:
			tile.Troop.visible = true
			tilesWithBuildings3.append(tile)
			tile.place_building(texture)
		disable_tile_highlights()
	elif (player == 4):
		tile.Troop.visible = true
		tilesWithBuildings4.append(tile)
		tile.place_building(texture)
		if tilesWithBuildings2.find(tile) > -1:
			tilesWithBuildings2.erase(tile)
		elif tilesWithBuildings3.find(tile) > -1:
			tilesWithBuildings3.erase(tile)
		elif tilesWithBuildings1.find(tile) > -1:
			tilesWithBuildings1.erase(tile)
		else:
			tile.Troop.visible = true
			tilesWithBuildings4.append(tile)
			tile.place_building(texture)
		disable_tile_highlights()
	else:
		tile.place_building(texture)
