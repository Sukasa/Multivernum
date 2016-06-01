
proc
	ErrorText(var/Text)
		world << Text

	DebugText(var/Text)
		if (IsDevMode)
			world << Text
		else
			world.log << Text