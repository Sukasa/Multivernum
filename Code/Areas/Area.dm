/area
	icon = 'AreaFlats56.dmi'
	icon_state = "Transparent"
	invisibility = 101
	layer = TOPDOWN_LAYER + FLY_LAYER

	var
		CameraDensity = FALSE

	proc
		OnEntered(var/turf/Turf, var/mob/Player)