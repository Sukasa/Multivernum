/MapController

	var
		list/AllocatedMapNames = list( )
		list/MapZPlanes = list( )
		list/QueuedMapLoads = list( )

	proc
		RequestMap(var/MapName) // Returns Z level of map
			if (MapName in QueuedMapLoads)
				return MapZPlanes[MapName]
			else
				QueuedMapLoads += MapName
				var/ZPlane = 2
				for(ZPlane; ZPlane < AllocatedMapNames.len; ZPlane++)
					if (AllocatedMapNames[ZPlane] == null)
						break
				AllocatedMapNames[ZPlane] = MapName
				MapZPlanes[MapName] = ZPlane

		MapReady(var/MapName) // Returns if a map has finished loading/baking yet
			if (MapName in QueuedMapLoads)
				return FALSE
			if (MapZPlanes[MapName])
				return TRUE
			return FALSE