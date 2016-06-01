var

	list
		Cardinal = list(NORTH, SOUTH, EAST, WEST)

		// Constants defined for use in scripts
		ScriptConstants = list(
								"true"			= TRUE,							"false"			= FALSE,					"oneFrame"			= world.tick_lag,
								"tileSize"		= world.icon_size,				"fps"			= world.fps,				"tickLag"		= world.tick_lag
							  )

		// Function calls available to scripts.  Note that variables may have their own function calls available as well
		ScriptFunctions = list(
								"min" 			= /proc/ProxyMin,				"sign" 			= /proc/sign, 				"max" 				= /proc/ProxyMax,
								"sin" 			= /proc/ProxySin,				"cos" 			= /proc/ProxyCos,			"tan" 				= /proc/tan,
								"atan" 			= /proc/arctan,					"abs" 			= /proc/ProxyAbs,			"fix" 				= /proc/fix,
								"floor" 		= /proc/ProxyFloor, 			"ceil" 			= /proc/ceil,				"array" 			= /proc/ProxyList,
								"locate" 		= /proc/ProxyLocate,			"isAtom" 		= /proc/IsAtom,				"isObj" 			= /proc/IsObj,
								"subTypes" 		= /proc/Subtypes,				"isList" 		= /proc/IsList,				"sleep" 			= /proc/ProxySleep,
								"debug" 		= /proc/ErrorText,				"error" 		= /proc/ErrorText,
								//"loadMap"		= /proc/ScriptLoadMap,			"loadChunk" 	= /proc/ScriptLoadChunk,
								"run"			= /proc/ScriptRun,				"spawn"			= /proc/ScriptSpawn,		"kill"				= /proc/ScriptKill,
								"isType"		= /proc/ScriptIsType
							  )

		// Config/Player variables are set later
		ScriptVariables = list(
							    "world"			= world,						"config"		= null,						"player" = null
							  )