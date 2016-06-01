/obj/Storage/Barrel
	desc = "a round wooden container, often sealed to contain liquids"
	icon = 'Barrels.dmi'
	icon_state = "Barrel1"

	Init()
		..()
		Hoover()

	Examined()
		if (src in orange(1))
			if (contents.len)
				usr << "You see something in there!"
			else
				usr << "It's empty."
		else
			..()


	Interact()
		if (contents.len)
			var/atom/movable/A = pick(contents)
			A.loc = loc
			usr << "You find \an [A.name]!"
		else
			usr << "The [name] contains nothing of interest"