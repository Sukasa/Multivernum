/EventController
	var/savefile/Scripts
	var/list/CachedScripts
	var/list/CacheTimestamps
	var/Parser/Parser

// Initializes the event controller, script parser, etc
/EventController/proc/Init()
	Scripts = new("SDATA")
	Scripts[".index"] >> CachedScripts
	if (!CachedScripts)
		CachedScripts = list( )
		Scripts[".index"] << CachedScripts
	Scripts[".stamp"] >> CacheTimestamps
	if (!CacheTimestamps)
		CacheTimestamps = list( )
		Scripts[".stamp"] << CacheTimestamps

	Parser = new()
	Parser.Functions = ScriptFunctions
	Parser.Constants = ScriptConstants

// Cache a named script file from disk
/EventController/proc/Cache(var/ScriptName, var/ScriptFilename, var/Timestamp = 0)

	DebugText("Caching [ScriptFilename] to \[[ScriptName]]")
	var/StreamReader/Reader = new(ScriptFilename)

	Scripts[ScriptName] << Reader.TextFile

	CachedScripts |= ScriptName
	CacheTimestamps[ScriptName] = Timestamp
	Scripts[".index"] << CachedScripts
	Scripts[".stamp"] << CacheTimestamps
	del Reader

// Retrieves a script from cache.  If the dev tools are installed, will cache first from disk
// Otherwise if no results are available, the Script Name will be returned verbatim.
/EventController/proc/GetScript(var/ScriptName)
	if (IsDevMode)
		var/FileInfo/Info = new("Scripts/[ScriptName].txt")
		world.log << "Reading TS for [ScriptName] ([ScriptName in CacheTimestamps])"
		var/CacheTS = (ScriptName in CacheTimestamps) ? CacheTimestamps[ScriptName] : -1
		if (Info.LastWriteTimestamp > CacheTS)
			Cache(ScriptName, "Scripts/[ScriptName].txt", Info.LastWriteTimestamp)

	if (ScriptName in CachedScripts)
		Scripts[ScriptName] >> .
	else
		. = ScriptName

// Runs a script 'detached' and returns to the caller
/EventController/proc/RunScriptDetached(var/ScriptName, var/mob/Player = null)
	spawn
		RunScript(ScriptName, Player)

// Runs a script and does not return to the caller until it completes
/EventController/proc/RunScript(var/ScriptName, var/mob/Player = null)
	var/ASTNode/Node = Parser.ParseScript(GetScript(ScriptName))
	if (Node)
		Node.Context = new /ScriptExecutionContext()
		Node.Execute()

/*
// Fades out the map, loads a new map (if it exists), and then moves the player to
// a named entrance tag before fading in
/EventController/proc/TakeExit(var/MapName, var/EntranceTag, var/mob/Player)
	spawn
		FadeOut()
		if (lentext(MapName))
			if (fexists("Project/Maps/[MapName]"))
				Config.MapLoader.LoadRawMap("Project/Maps/[MapName]")
			else if (fexists("Project/Maps/[MapName].dmm"))
				Config.MapLoader.LoadRawMap("Project/Maps/[MapName].dmm")
			else
				Config.MapLoader.LoadMap(MapName)

		if (lentext(EntranceTag))
			var/T = locate(EntranceTag)
			if (T)
				if (!T:loc)
					ErrorText("Entrance [EntranceTag] has null loc!")

				Player.Move(T:loc)
				Config.Cameras.Warp(Player)
			else
				ErrorText("Unable to find entrance [EntranceTag]!")

		FadeIn()
*/