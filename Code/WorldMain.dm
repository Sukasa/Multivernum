world
	New()
		..()
		spawn(10)
			for(var/Z = 1, Z <= world.maxz, Z++)
				world << "Baking Z[Z]..."
				sleep(world.tick_lag)
				BakeRegion(locate(1, 1, Z), locate(world.maxx, world.maxy, Z))
				sleep(world.tick_lag)
			world << "Done bake"
proc
	BakeRegion(var/turf/Start, var/turf/End)
		set background = 1
		var/list/Region = block(Start, End)
		var/Again = TRUE
		do
			Again = FALSE
			for(var/atom/A in Region)
				if(BakeContainer(A))
					Again = TRUE
		while(Again)

		for(var/atom/A in Region)
			InitContainer(A)

	BakeContainer(var/atom/Container)
		. = Container.Bake()
		for(var/atom/A in Container)
			if (BakeContainer(A))
				. = TRUE

	InitContainer(var/atom/Container)
		Container.Init()
		for(var/atom/A in Container)
			A.Init()