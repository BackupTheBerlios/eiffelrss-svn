indexing
	description: "Objects that ..."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CL_SHOW_COMMAND

inherit
	CL_COMMAND
		redefine
			make
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

	make (args: LIST [STRING]) is
			-- show feed (no. in first argument)
		local
			cl_main: CL_MAIN
		do
			Precursor (args)
			make_parser
			parse
			if is_exit_requested then
				cl_main ?= application.application_displayer
				if cl_main /= void then
					cl_main.request_exit
				end
			end
		end
		
	make_parser is
			-- 
		do
			Precursor {CL_PARSER}
			known_commands.put (agent on_edit_command, "edit")
			known_commands.put (agent on_info_commmand, "info")
			known_commands.put (agent on_open_command, "open")
			known_commands.put (agent on_refresh_command, "refresh")
			known_commands.put (agent on_remove_command, "remove")
			known_commands.put (agent on_back_command, "back")
		end
		
feature -- Events

	on_edit_command is
			-- 
		do
			
		end
	
	on_info_commmand is
			-- 
		do
			
		end
	
	on_open_command is
			-- 
		do
			
		end
	
	on_refresh_command is
			-- 
		do
			
		end
	
	on_remove_command is
			-- 
		do
			
		end
	
	on_back_command is
			-- 
		do
			is_stop_requested := true
		end
		

feature {NONE} -- Implementation

	command_string: STRING is "show"

end -- class CL_SHOW_COMMAND
