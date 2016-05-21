/obj/Door
	var
		BaseIconState

	density = 0

	Down
		icon_state = "Down12"
		BaseIconState = "Down"

		Stone
			icon = 'StoneDoor56.dmi'

	Up
		icon_state = "Up12"
		BaseIconState = "Up"

		Stone
			icon = 'StoneDoor56.dmi'

	Closed // Can change to 'Smashed' as needed?
		icon_state = "Closed12"
		BaseIconState = "Closed"
		density = 1

		Stone
			icon = 'StoneDoor56.dmi'

	Smashed
		icon_state = "Smashed12"
		BaseIconState = "Smashed"
		density = 1

		Stone
			icon = 'StoneDoor56.dmi'

	Open
		icon_state = "Open12"
		BaseIconState = "Open"

		Stone
			icon = 'StoneDoor56.dmi'

	Secret
		icon_state = "Secret12"
		BaseIconState = "Secret"
		density = 1

		Stone
			icon = 'StoneSecret56.dmi'