/turf
	MovementAllowFlags = ALLOW_ALL
	mouse_opacity = 0

	proc
		GetMovementFlags()
			. = MovementAllowFlags
			for(var/atom/A in src.contents)
				. &= A.MovementAllowFlags

	Bake()
		if (density)
			MovementAllowFlags = ALLOW_BASE
		FogOfWar()

	Enter(var/atom/movable/A)
		if (ismob(A))
			var/mob/M = A
			var/datum/Component/Mob/Movement/MV = M.GetComponent(/datum/Component/Mob/Movement)
			if (!MV)
				return 0
			. = MV.MovementFlags & GetMovementFlags()
		else
			. = ..()