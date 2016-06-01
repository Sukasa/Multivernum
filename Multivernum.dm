/*
	These are simple defaults for your project.
 */

world
	fps = 17
	icon_size = 56
	map_format = ISOMETRIC_MAP
	view = 9
	mob = /mob/Playable/Fighter

atom/movable
	glide_size = 56

var
	SoundController/Audio
	MapLoader/Maps
	EventController/Events
	IsDevMode = FALSE

	list
		Clients = list( )