indexing
	description: "Objects that handle the 'add' command"
	author: "Martin Luder"
	date: "$Date$"
	revision: "$Revision$"

class
	CL_ADD_COMMAND

inherit
	CL_COMMAND
		redefine
			make
		end

create
	make

feature -- Initialization

	make (args: LIST [STRING]) is
			-- add url in first argument to feeds
		do
			Precursor (args)
			if not args.is_empty then
				args.start
				add_feed (args.item)
			end
		end
		
end -- class CL_ADD_COMMAND
