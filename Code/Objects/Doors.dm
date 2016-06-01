/obj/Door
	AutojoinMatchTypes = list(/obj/Wall, /turf/RockWall)
	dir = NORTH
	density = 0
	var
		Baked = FALSE
	desc = "a sturdy but not impenetrable method of access control"

	Bake()
		..()
		if (MatchAutojoinExplicit(get_step(src, NORTH)))
			dir = EAST
		else
			dir = NORTH
		if(!Baked)
			name = "[name] Door"
			Baked = TRUE

	Down
		icon_state = "Down"

		Stone
			icon = 'StoneDoor56.dmi'

	Up
		icon_state = "Up"

		Stone
			icon = 'StoneDoor56.dmi'

	Closed // Can change to 'Smashed' as needed?
		icon_state = "Closed"
		density = 1
		opacity = 1

		Init()
			MakeInteractible()
			..()

		Stone
			icon = 'StoneDoor56.dmi'

		Interact()
			if (density)
				icon_state = "Open"
				density = 0
				opacity = 0
				DensityMovement()
				UpdateFogOfWar()
			else
				icon_state = "Closed"
				density = 1
				opacity = 1
				DensityMovement()
				UpdateFogOfWar()

	Smashed
		icon_state = "Smashed"
		density = 1

		Stone
			icon = 'StoneDoor56.dmi'

	Open
		icon_state = "Open"


		Stone
			icon = 'StoneDoor56.dmi'

	Secret
		icon_state = "Secret"
		density = TRUE
		opacity = TRUE
		desc = "sturdy and unyielding, no matter how hard you try to prove otherwise"

		Bake()
			if (!Baked)
				var/n = name
				..()
				name = "[n] Wall"
				Baked = TRUE

		Bumped()
			if (prob(30))
				Reveal(TRUE)
				usr << "You find a hidden switch, and reveal a passage!"
			else if (prob(30))
				usr << "You press against the wall, but it refuses to yield"

		Init()
			icon_state = "Hidden"
			UpdateFogOfWar()

		Stone
			icon = 'StoneSecret56.dmi'

		Wood
			icon = 'WoodSecret56.dmi'

		proc
			Reveal(var/Chain)
				desc = "with a hidden passage"
				ExtendedDesc = "You wonder where it goes."
				icon_state = "Secret"
				density = FALSE
				DensityMovement()
				UpdateFogOfWar()
				if (Chain)
					for(var/obj/Door/Secret/S in orange(1, src))
						S.Reveal()