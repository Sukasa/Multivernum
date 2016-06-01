/mob
	density = 1
	sight = (SEE_SELF | SEE_TURFS)

	var
		InteractScript = null
		list/InteractText = ""
		InteractName = null

		list/ActiveComponents = list( )

		// Basic mob components, and their default values
		// TODO most of these
		BrainComponent
		MovementComponent = /datum/Component/Mob/Movement/Land
		PathfindingComponent
		Positioningcomponent
		SpeciesComponent
		StatsComponent
		TargetingComponent

	New()
		..()
		Init()

	Init()
		..()
		for(var/K in vars)
			var/V = vars[K]
			if (ispath(V, /datum/Component))
				ActiveComponents += new V()

	Move()
		. = ..()
		if (.)
			for(var/turf/T in view(src))
				if (!T.PreviouslySeen(src))
					T.ShowTo(src)

	proc
		GetComponent(var/Type)
			for(var/datum/Component/C in ActiveComponents)
				if (istype(C, Type))
					return C