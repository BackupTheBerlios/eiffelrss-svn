indexing
	description: "Objects that ..."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CL_INFO_COMMAND

inherit
	CL_COMMAND
		redefine
			make
		end

create
	make

feature -- Initialization

	make (args: LIST [STRING]) is
			-- print info on feed (no. in first argument)
		do
			Precursor (args)
			if not args.is_empty then
				args.start
				if args.item.is_integer then
					-- print info on feed no. item
				end
			end
		end
		
end -- class CL_INFO_COMMAND
