/obj/Decoration/Wall
	proc

		DoOffset()
			dir = turn(dir, 180)
			switch(dir)
				if(NORTH)
					pixel_x = -28
					pixel_y = 14
				if(EAST)
					pixel_x = 28
					pixel_y = 14