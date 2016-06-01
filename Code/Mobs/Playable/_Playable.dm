/mob/Playable

	New()
		..()
		var/atom/Start = PickIn(/obj/MapMarker/PlayerStart, world)
		loc = Start.loc