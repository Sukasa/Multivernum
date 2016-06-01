// Utility functions for atoms
/atom
	proc
		Closest(var/list/Candidates)
			var/Dist = INFINITY
			for(var/atom/Candidate in Candidates)
				if (Dist > GetDistanceTo(Candidate))
					Dist = GetDistanceTo(Candidate)
					. = Candidate

		GetDistanceTo(var/atom/To)
			return abs(x - To.x) + abs(y - To.x)

		Hoover()
			for(var/atom/A in loc)
				if (!ismob(A) && A != src && !A.density && !istype(A, /obj/Runtime))
					contents += A

		DensityMovement()
			if (density)
				MovementAllowFlags = ALLOW_BASE
			else
				MovementAllowFlags = ALLOW_ALL