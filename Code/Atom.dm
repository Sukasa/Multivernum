/atom
	var
		MovementAllowFlags = ALLOW_BASE
		ExtendedDesc = "You see nothing interesting."

	proc
		Init()		// Called during initialization
			return

		Bake()		// Called during initial map baking, before init.  Return TRUE if a second (or third, or fourth...) Bake() pass is needed
			DensityMovement()
			return 0

		Examined() 	// Called if the object is examined
			usr << ExtendedDesc
			return

		Interact() 	// Called when the object is used
			return

		Bumped(var/atom/movable/Bumper) // Called when bumped into
			return

// ---------------------------------------

		MakeInteractible()
			src.verbs += /atom/proc/Use

// ---------------------------------------

		Use() // To be added to verbs by interactible objects
			set desc = "Use an Object"
			set src in view(1)
			set instant = TRUE

			Interact()

	verb

		Info()
			set desc = "Get Information"
			set src in view()
			set instant = TRUE

			usr << "\icon[src] [name], flags [MovementAllowFlags] iconstate [icon_state] @ ([x] [y] [z])"
