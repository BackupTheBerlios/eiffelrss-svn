indexing
	description: "Objects that ..."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CL_MAIN

inherit
	APPLICATION_DISPLAYER
		redefine
			make
		end
	
	CL_EVENTS
		undefine
			default_create,
			copy,
			is_equal
		end
	
	CL_PARSER
		rename
			make as make_parser
		redefine
			make_parser
		end

create
	make

feature -- Initialization

	make is
		do
			make_parser
			make_app_ref	
		end
	
	make_parser is
		do
			Precursor {CL_PARSER}
		end
		
	start is
			-- start
		do
			io.put_string ("Welcome to " + Application_name + "%N")
			parse
		end
		
feature {NONE} -- Implementation
	
	command_string: STRING is ""
end -- class CL_MAIN
