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

feature -- Progress display

	show_progress (s: INTEGER) is
			-- show progress and set number of steps to s
		do
			
		end
	
	progress_forward is
			-- increase progress
		do
			
		end
	
	progress_backward is
			-- decrease progress
		do
			
		end
	
	progress_done is
			-- finish progress
		do
			
		end
		

end -- class CL_OUTPUT
