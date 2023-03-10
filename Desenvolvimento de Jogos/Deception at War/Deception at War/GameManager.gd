extends Node2D

var currentplayer = 1
var curTurn : int = 1
var currentlyPlacingBuilding : bool = false
var buildingToPlace : int
onready var ui : Node = get_node("UI")
onready var map : Node = get_node("Tiles")
var total_weight = 100

var options = [1,2,3,4]
var optionC = 0

func _ready ():
	var screen_size = get_viewport().size
	$Tiles/VBoxContainer.rect_position = screen_size / 2 - $Tiles/VBoxContainer.rect_size / 2
	ui.on_end_turn()




func labels():
	print("Alloptions:", options)
	var random_num
	if options.size() > 0:
		var random_index = randi() % options.size()
		random_num = options[random_index]
		if random_num == 3 and 1 in options:
			random_num = 1
			random_index = 0
		options.remove(random_index)
	else:
		random_num = 5
	if random_num == 1:
		optionC = 1
		print("entrou")
		$Tiles/VBoxContainer.visible = true
		$Tiles/VBoxContainer/Label2.visible = true
		$Tiles/Capa.visible = true
		$Tiles/VBoxContainer/HBoxContainer/Button.text = "Yes"
		$Tiles/VBoxContainer/HBoxContainer/Button2.text = "No"
		
	if random_num == 2:
		optionC = 2
		$Tiles/VBoxContainer.visible = true
		$Tiles/VBoxContainer/Label3.visible = true
		$Tiles/Capa.visible = true
		$Tiles/VBoxContainer/HBoxContainer/Button.text = "I trust him with my life"
		$Tiles/VBoxContainer/HBoxContainer/Button2.text = "I will have one guy i trust"
		
	if random_num == 3:
		optionC = 3
		$Tiles/VBoxContainer.visible = true
		$Tiles/VBoxContainer/Label4.visible = true
		$Tiles/Capa.visible = true
		$Tiles/VBoxContainer/HBoxContainer/Button.text = "(Lie) I am on a lead"
		$Tiles/VBoxContainer/HBoxContainer/Button2.text = "I am still looking for it"
		
	if random_num == 4:
		optionC = 4
		
	if random_num == 5:
		optionC = 5
		$Tiles/VBoxContainer.visible = true
		$Tiles/VBoxContainer/Label5.visible = true
		$Tiles/Capa.visible = true
		$Tiles/VBoxContainer/HBoxContainer/Button.visible = false
		$Tiles/VBoxContainer/HBoxContainer/Button2.visible = false
		$Tiles/VBoxContainer/Button.visible = true
		$Tiles/VBoxContainer/Button2.visible = true
		
func play_SniperShot():
	$Tiles/SniperShot.visible = true
	$Tiles/SniperShot.play()
	$Tiles/SniperShot/YouDied.visible = true


# called when the player ends the turn
func end_turn ():
	
	map.add_troops(currentplayer)
	currentplayer = currentplayer + 1
	if currentplayer > BuildingData.get_numberofplayers():
		currentplayer = 1
	map.fog_of_war(currentplayer)
	# increase current turn
	curTurn += 1
	ui.on_end_turn()
	if currentplayer == 2:
		map.highlight_available_tiles(2)
		$Timer.start()
		end_turn()
		
		var random_num = randi() % total_weight
		print("Shoot: ",random_num)
		if random_num < 1:
			play_SniperShot()
			pass
		elif random_num <20:
			$Timer.stop()
			labels()
		
		
		
	

# called when we've selected a building to place
func on_select_building (buildingType):
	
	currentlyPlacingBuilding = true
	buildingToPlace = buildingType
	
	# highlight the tiles we can place a building on
	map.highlight_available_tiles(currentplayer)

# called when we place a building down on the grid
func place_building (tileToPlaceOn):
	currentlyPlacingBuilding = false
	
	var texture : Texture
	
	# are we placing down a Mine?
	if buildingToPlace == 1:
		if currentplayer == 1:
			texture = BuildingData.mine.iconTexture
			tileToPlaceOn.tile_set_texture (1)
			
		if currentplayer == 2:
			texture = BuildingData.mine.iconTexture
			tileToPlaceOn.tile_set_texture (2)
			
		if currentplayer == 3:
			texture = BuildingData.mine.iconTexture
			tileToPlaceOn.tile_set_texture (3)
			
		if currentplayer == 4:
			texture = BuildingData.mine.iconTexture
			tileToPlaceOn.tile_set_texture (4)
			
	
	# are we placing down a Greenhouse?
	elif buildingToPlace == 2:
		texture = BuildingData.greenhouse.iconTexture
		tileToPlaceOn.tile_set_texture (1)
		
	
	# are we placing down a Solar Panel?
	elif buildingToPlace == 3:
		texture = BuildingData.solarpanel.iconTexture
		tileToPlaceOn.tile_set_texture (1)
	
	# place the building on the map
	map.place_building(tileToPlaceOn, texture, currentplayer)
	
	end_turn()
	# update the UI to show changes immediately
	#ui.update_resource_text()


func _on_Timer_timeout():
	end_turn ()


func _on_Button_pressed():
	$Timer.start()
	if optionC == 0:
		$Tiles/VBoxContainer.visible = false
		$Tiles/Capa.visible = false
		$Tiles/VBoxContainer/Label1.visible= false
	if optionC == 1:
		$Tiles/VBoxContainer.visible = false
		$Tiles/Capa.visible = false
		$Tiles/VBoxContainer/Label2.visible= false
	if optionC == 2:
		$Tiles/VBoxContainer.visible = false
		$Tiles/Capa.visible = false
		$Tiles/VBoxContainer/Label3.visible= false
		$Tiles/fundopreto.visible = true
		$Tiles/Sprite.visible = true
		$Tiles/Label6.visible = true
		$Tiles/Button1.visible = true
		$Timer.stop()
	if optionC == 3:
		$Tiles/VBoxContainer.visible = false
		$Tiles/Capa.visible = false
		$Tiles/VBoxContainer/Label4.visible= false
	if optionC == 5:
		$Tiles/VBoxContainer.visible = false
		$Tiles/Capa.visible = false
		$Tiles/VBoxContainer/Label5.visible= false
		$Tiles/Final1.visible = true
		$Tiles/Final1.play()
		$Timer.stop()
		
	optionC = 0

func _on_Button2_pressed():
	$Timer.start()
	print("optionC: ",optionC)
	if optionC == 0:
		$Tiles/Executed.visible= true
		$Tiles/Executed.play()
		$Tiles/Executed/YouDied2.visible = true
		$Tiles/VBoxContainer.visible = false
		$Tiles/Capa.visible = false
		$Timer.stop()
	if optionC == 1:
		$Tiles/Executed.visible= true
		$Tiles/Executed.play()
		$Tiles/Executed/YouDied2.visible = true
		$Tiles/VBoxContainer.visible = false
		$Tiles/Capa.visible = false
		$Timer.stop()
	if optionC == 2:
		$Tiles/VBoxContainer.visible = false
		$Tiles/Capa.visible = false
		$Tiles/VBoxContainer/Label3.visible= false
		$Tiles/fundopreto.visible = true
		$Tiles/Sprite.visible = true
		$Tiles/Label6.visible = true
		$Tiles/Button1.visible = true
		$Timer.stop()
	if optionC == 3:
		$Tiles/VBoxContainer.visible = false
		$Tiles/Capa.visible = false
		$Tiles/VBoxContainer/Label4.visible= false
	
	if optionC == 5:
		$Tiles/VBoxContainer.visible = false
		$Tiles/Capa.visible = false
		$Tiles/VBoxContainer/Label5.visible= false
		$Tiles/Final2.visible = true
		$Tiles/Final2.play()
		
		
		$Timer.stop()
		
		
	optionC = 0


func _on_Button1_pressed():
	$Tiles/fundopreto.visible = false
	$Tiles/Sprite.visible = false
	$Tiles/Label6.visible = false
	$Tiles/Button1.visible = false


func _on_Final_finished():
	$Tiles/Final2.visible = false
	$Tiles/YouDied.visible = true
	$Tiles/fundopreto.visible = true
	$Timer.stop()
