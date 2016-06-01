/atom/movable
	Bump(var/atom/Obstacle)
		Obstacle.Bumped(src)

	verb
		Examine()
			set desc = "Examine an object"
			set src in view()
			set instant = TRUE

			usr << "You examine the \icon[src][src], [desc]."

			Examined()