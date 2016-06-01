/obj/Storage/Chest
	desc = "a strong, small box with a lock"
	icon = 'Chests.dmi'
	icon_state = "Chest1"

	var
		BaseIconState
		KeyCode

	Init()
		..()
		BaseIconState = icon_state
		MakeInteractible()

		if (State != CHEST_OPEN)
			Hoover()

	var
		State = CHEST_CLOSED
		Smashed = FALSE

		SmashChance = 30
		SmashLossChance = 20

	Examined()
		if (Smashed)
			usr << "This one has been smashed."
		else
			switch(State)
				if (CHEST_CLOSED)
					usr << "This one is closed."
				if (CHEST_LOCKED)
					if (src in orange(1))
						usr << "This one has been locked."
					else
						usr << "This one is closed."
				if (CHEST_OPEN)
					usr << "This one is open."

	Interact()
		if (State != CHEST_LOCKED)
			Toggle()
		else
			usr << "You try to open the [name], but it's locked."

	proc
		Smash()
			if (prob(SmashChance))
				usr << "You smash the [name] open!"
				desc = "it used to be sturdy.  Now it's a splinter waiting to happen"

				if (prob(SmashLossChance) && contents.len)
					contents -= pick(contents)

				State = CHEST_CLOSED
				Toggle()
				Smashed = TRUE
				icon_state = "SmashedChest"
			else
				usr << "The chest withstands your punishment"

		Toggle()
			if (Smashed)
				usr << "The chest is smashed!"
				return

			State = !State
			icon_state = "[BaseIconState][State == CHEST_OPEN ? "Open" : ""]"
			if(State == CHEST_OPEN)
				usr << "You open the chest"
				loc.contents += contents
				contents = list()
			else
				usr << "You close the chest"
				Hoover()