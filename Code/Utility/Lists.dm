proc
	InsertList(var/Index, var/list/Container, var/Insert)
		Container.Insert(Index, list(Insert))

	JoinList(var/list/A, var/Separator = ", ")
		for (var/aB in A)
			. = "[.][Separator][aB]"
		. = copytext(., lentext(Separator) + 1)

	Pop(var/list/L)
		. = L[1]
		L.Cut(1, 2)

	Push(var/list/L, var/Item)
		L.Insert(1, Item)

	PickIn(var/Type, var/list/List)
		var/list/Temp = list()
		for(var/I in List)
			if (istype(I, Type))
				Temp += I
		return pick(Temp)