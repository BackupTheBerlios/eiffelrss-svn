indexing
	description: "Objects that ..."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CL_OUTPUT

inherit
	INFORMATION_DISPLAYER

create
	make,
	make_with_text

feature -- Basic operations
	
	show_current is
			-- print current text message to command line
		do
			io.put_string (current_text + "%N")
		end

end -- class CL_OUTPUT
