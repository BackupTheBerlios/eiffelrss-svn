indexing
	description: "Objects that ..."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CL_REMOVE_COMMAND

inherit
	CL_COMMAND
		redefine
			make
		end

create
	make

feature -- Initialization

	make (args: LIST [STRING]) is
			-- remove feed (no. in first argument)
		do
			Precursor (args)
			
		end
		
end -- class CL_REMOVE_COMMAND
