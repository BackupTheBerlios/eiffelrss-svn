indexing
	description	: "Root class for this application."
	author		: "Martin Luder"
	date		: "$Date: 2005/1/13 18:10:25 $"
	revision	: "1.0.0"

class
	APPLICATION

inherit
	EV_APPLICATION
	
	APPLICATION_PROPERTIES
		undefine
			default_create,
			copy,
			is_equal
		end

create
	make_and_launch

feature {NONE} -- Initialization

	make_and_launch is
			-- Initialize and launch application
		do
			default_create
			prepare
			launch
		end

	prepare is
			-- Prepare the first window to be displayed.
			-- Perform one call to first window in order to
			-- avoid to violate the invariant of class EV_APPLICATION.
		do
			parse_command_line
			
				-- create logfile
			create_log
			
			
				-- Open properties files
			load_properties

			create_application_displayer
			
				-- create debug window and hide
		end

feature -- Implementation

	application_displayer: APPLICATION_DISPLAYER
	
	is_no_debug_window: BOOLEAN
		
	create_log is
			-- 
		local
			dw: DEBUG_WINDOW
		do
			if is_no_debug_window then
				create logfile.make_filename ("newsreader.log")
				logfile.set_threshold (logfile.Developer)
			else
				create {DEBUG_WINDOW}logfile.make_filename ("newsreader.log")
				logfile.set_threshold (logfile.Developer)
				
				dw ?= logfile
				if dw /= void then
					dw.hide
				end
			end
		end
		
	create_application_displayer is
			-- create displayer for application
		local
			mw: MAIN_WINDOW
		do
			create {MAIN_WINDOW}application_displayer.make
			
			mw ?= application_displayer
			if mw /= void then
				mw.show
			end
		end
		
		
	
	on_debug_window is
		local
			dw: DEBUG_WINDOW
		do
			dw ?= logfile
			if dw /= void then
				if dw.is_show_requested then
					dw.hide
				else
					dw.show
				end
			end
		end

	parse_command_line is
			-- parse command line options
		local
			env: EXECUTION_ENVIRONMENT
			cl_argument: INTEGER
		do
			create env
			cl_argument := env.command_line.index_of_word_option ("no_debug_window")
			if cl_argument /= 0 then
				is_no_debug_window := true
			end
		end
		

end -- class APPLICATION
