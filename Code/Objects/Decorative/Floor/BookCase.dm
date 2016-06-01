/obj/Decoration/Floor/Bookcase
	icon = 'Bookshelf.dmi'
	desc = "full of books and assorted knick-knacks"
	icon_state = "Bookshelf1"

	var
		list
			BookQuips = list(
								"The titles are all related to combat.",
								"If you had time to read these, you might have time to learn to read.",
								"That book is mouldy, ew!",
								"Someone has arranged these books in a rainbow",
								"These books have nothing in common",
								"It's full of encyclopedias",
								"Looks like the local rag",
								"Self-help books.  Each about as useful as a self-help book.",
								"Pulp fiction, pulped wood.",
								"These book titles makes as much sense as this floorplan",
								"'Why I'm awesome, an introspective by Peregrine IV'..  this guy seems like an ass."
							)

	Bake()
		ExtendedDesc = BookQuips[((x + y) % BookQuips.len) + 1]
