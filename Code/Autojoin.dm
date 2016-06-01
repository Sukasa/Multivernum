/atom
	var
		list/AutojoinMatchTypes = list()
		AutojoinDirections

	proc
		Autojoin()
			for(var/Direction in Cardinal)
				if (MatchAutojoin(get_step(src, Direction)))
					AutojoinDirections |= Direction
			icon_state = "[AutojoinDirections]"

		MatchAutojoin(var/turf/T)
			if (!T || (T.type == type) || (locate(type) in T) || T.x == 1 || T.y == 1 /* || T.x > MapZoneMaxX || T.y > MapZoneMaxY  */)
				return TRUE
			for(var/Type in AutojoinMatchTypes)
				if (istype(T, Type))
					return TRUE
				for(var/atom/A in T)
					if (istype(A, Type))
						return TRUE

		MatchAutojoinExplicit(var/turf/T)
			if (!T)
				return TRUE
			for(var/Type in AutojoinMatchTypes)
				if (istype(T, Type))
					return TRUE
				for(var/atom/A in T)
					if (istype(A, Type))
						return TRUE