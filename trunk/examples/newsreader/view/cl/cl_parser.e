indexing
	description: "Objects that ..."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	CL_PARSER

inherit
	CL_EVENTS

feature -- Initialization
	make is
			-- Creation procedure.
		do
			create known_commands.make (10)
			
			known_commands.put (agent on_exit, "exit")
			known_commands.put (agent on_about, "about")
			known_commands.put (agent on_help, "help")
		end
	
	words: LIST[STRING]
	known_commands: COMMAND_LIST
	command_string: STRING is deferred end
	entered_command: STRING
	
	parse is
			-- parse command line
		local
			line: STRING
		do
			from
				
			until
				is_exit_requested
			loop
				io.put_string (command_string + ">> ")
				io.read_line

				line := io.last_string			
				words := line.split (' ')
				clean_list
				words.start
				entered_command := words.item
				if is_known_command then
					known_commands.item (entered_command).apply
				end
			end
			application.destroy
		end
		
	
	show_list is
		do
			from
				words.start
			until
				words.after
			loop
				io.put_string ("-")
				io.put_string (words.item)
				io.put_string ("-")
				io.put_new_line
				words.forth
			end
		end
	
	clean_list is
		do
			from
				words.start
			until
				words.after
			loop
				if words.item.is_empty then
					words.remove
				else
					words.forth
				end
			end
		end
		
	is_known_command: BOOLEAN is
		do
			Result := known_commands.has (entered_command)
		end
		
invariant
	known_commands_not_void: known_commands /= void
end -- class CL_PARSER
