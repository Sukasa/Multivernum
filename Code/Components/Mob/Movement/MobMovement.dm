/datum/Component/Mob/Movement
	// Movement component for mobs.  Determines where the mob can move, as well as the mob's density while moving.
	var
		MovementFlags = 0
		MovementDensity = 0
		tmp
			CachedDensity

	proc
		CanCross(var/turf/Check)
			return MovementFlags & Check.GetMovementFlags()

		BeginMove()
			CachedDensity = My.density
			My.density = MovementDensity

		EndMove()
			My.density = CachedDensity