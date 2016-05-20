/turf

	var
		DensityFlags = 0	// Wall flags.  Use NORTH/SOUTH/WEST/EAST as necessary.  A set flag means you can't walk into/off the tile on that edge,
							// but you can still cast spells through it

	Enter(var/atom/movable/AM, var/atom/OldLoc)
		if (OldLoc in range(1, src) && DensityFlags & get_dir(src, OldLoc))
			return 0
		return 1

	Exit(var/atom/movable/AM, var/atom/NewLoc)
		if (NewLoc in range(1, src) && DensityFlags & get_dir(src, NewLoc))
			return 0
		return 1