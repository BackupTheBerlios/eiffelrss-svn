indexing
	description: "Objects that ..."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CL_LIST_COMMAND

inherit
	CL_COMMAND
		redefine
			make
		end

create
	make

feature -- Initialization

	make (args: LIST [STRING]) is
			-- list all feeds' names (with numbers)
		do
			Precursor (args)
			 
		end
		
end -- class CL_LIST_COMMAND
