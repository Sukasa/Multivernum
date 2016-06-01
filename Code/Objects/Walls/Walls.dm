/obj/Wall
	icon_state = "15"
	density = TRUE
	opacity = TRUE
	desc = "sturdy and unyielding, no matter how hard you try to prove otherwise"

	var
		BakeNum = 0

	AutojoinMatchTypes = list(/obj/Wall, /obj/Door, /turf/RockWall)


	Bumped()
		if (prob(30))
			usr << "You press against the wall, but it refuses to yield"
	Bake()
		..()
		. = BakeNum == 0
		if (BakeNum == 0)
			Autojoin()
			WallCheck()
			name = "[name] Wall"
		else if (BakeNum == 1)
			DoCorners()
			UpdateFogOfWar()
		BakeNum++

	proc
		WallCheck()
			switch(AutojoinDirections)
				if(NORTH | SOUTH | WEST)
					if (MatchAutojoin(get_step(src, SOUTHWEST)) && MatchAutojoin(get_step(src, NORTHWEST)))
						AutojoinDirections = NORTH | SOUTH

				if(NORTH | SOUTH | EAST)
					if (MatchAutojoin(get_step(src, SOUTHEAST)) && MatchAutojoin(get_step(src, NORTHEAST)))
						AutojoinDirections = NORTH | SOUTH

				if(EAST | WEST | NORTH)
					if (MatchAutojoin(get_step(src, NORTHWEST)) && MatchAutojoin(get_step(src, NORTHEAST)))
						AutojoinDirections = EAST | WEST

				if(EAST | WEST | SOUTH)
					if (MatchAutojoin(get_step(src, SOUTHWEST)) && MatchAutojoin(get_step(src, SOUTHEAST)))
						AutojoinDirections = EAST | WEST
			icon_state = "[AutojoinDirections]"

		DoCorners()
			for(var/Direction in Cardinal)
				if (Direction & AutojoinDirections)
					var/obj/Wall/W = locate() in get_step(src, Direction)
					if (W)
						if(!(turn(Direction, 180) & W.AutojoinDirections))
							AutojoinDirections &= ~Direction
			icon_state = "[AutojoinDirections]"

	Stone
		icon = 'StoneWall56.dmi'

	Wood
		icon = 'WoodWall56.dmi'
