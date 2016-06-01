/turf
	var
		FogValue = FALSE
		FogDone = FALSE
		image/FoWImage = null
		list/OldImages = list( ) // TODO some way to remove old images once no player is looking at them

	proc
		PreviouslySeen(var/mob/Player)
			// TODO replace this with party handling down the road
			return FogValue

		ShowTo(var/mob/Player)
			Player << FoWImage
			if (Player.client)
				Player.client.images -= OldImages
			FogValue = FogDone // TODO change this

		ResetSeen()
			FogValue = FALSE // TODO change this

		MakeFoWStandin()
			var/obj/Runtime/TurfStandIn/TSI = new()
			TSI.icon = icon
			TSI.icon_state = icon_state
			TSI.layer = layer
			TSI.Move(src)

		UpdateFogOfWar()
			var/list/Overs = list( )
			for(var/obj/A in src)
				if (!istype(A, /obj/Runtime) && A.invisibility == 0)
					Overs += A.appearance
			if (FoWImage)
				OldImages += FoWImage
			FoWImage = image(icon, src, icon_state, layer)
			FoWImage.color = rgb(128, 128, 128)
			FoWImage.appearance_flags = RESET_ALPHA | RESET_COLOR
			FoWImage.override = TRUE
			FoWImage.overlays = Overs
			ResetSeen()
			for(var/mob/M in view(src))
				if (!PreviouslySeen(M))
					ShowTo(M)

		FogOfWar()
			if (FogDone)
				return
			FogDone = TRUE
			alpha = 0
			MakeFoWStandin()
			UpdateFogOfWar()