/obj/Storage/Crate
	desc = "a sturdy box for storing items"
	icon = 'Crates.dmi'
	icon_state = "Crate1"

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