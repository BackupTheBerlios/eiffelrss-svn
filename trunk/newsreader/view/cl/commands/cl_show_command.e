indexing
	description: "Objects that ..."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CL_SHOW_COMMAND

inherit
	CL_COMMAND
		rename
			on_help_command as on_help_command_old
		redefine
			make
		end
	
	CL_PARSER
		rename
			make as make_parser
		redefine
			make_parser,
			on_help_command
		select
			on_help_command
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
			show_feed
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
			known_commands.put (agent show_feed, "show")
		end
		
feature -- Events

	show_feed is
			-- 
		local
			i: INTEGER
		do
			io.put_new_line
			from
				application.current_feed.items.start
				i := 1
			until
				application.current_feed.items.after
			loop
				application.application_displayer.information_displayer.show_temporary_text (i.out + ": " + application.current_feed.items.item.title)
				application.current_feed.items.forth
				i := i+1
			end
			io.put_new_line
		end
		

	on_edit_command is
			-- 
		local
			command: CL_FEED_EDIT_COMMAND
		do
			create command.make (words)
		end
	
	on_info_commmand is
			-- 
		local
			command: CL_FEED_INFO_COMMAND
		do
			create command.make (words)
		end
	
	on_open_command is
			-- 
		do
			words.start
			if application.current_feed.items.valid_index (words.item.to_integer) then
				open_url (application.current_feed.items.i_th (words.item.to_integer).link, false)
			end
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
	
	on_help_command is
			-- 
		local
			disp: INFORMATION_DISPLAYER
		do
			disp := application.application_displayer.information_displayer
			io.put_new_line
			disp.show_temporary_text ("show%T%T" + Help_feed_show_command)
			disp.show_temporary_text ("open #%T%T" + Help_feed_open_command)
			disp.show_temporary_text ("info #%T%T" + Help_feed_info_command)
			disp.show_temporary_text ("edit #%T%T" + Help_feed_edit_command)
			disp.show_temporary_text ("add URI%T%T" + Help_add_command)
			disp.show_temporary_text ("remove #%T" + Help_feed_remove_command)
			disp.show_temporary_text ("refresh%T%T" + Help_feed_refresh_command)
			disp.show_temporary_text ("about%T%T" + Help_about_command)
			disp.show_temporary_text ("back%T%T" + Help_feed_back_command)
			disp.show_temporary_text ("exit%T%T" + Help_exit_command)
			io.put_new_line
		end
		
		

feature {NONE} -- Implementation

	command_string: STRING is "feed"

end -- class CL_SHOW_COMMAND
