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
				-- create logfile
			load_logfile
			
				-- Open properties files
			load_properties

				-- create and initialize the first window.
			create main_window.make

				-- Show the first window.
				--| TODO: Remove this line if you don't want the first 
				--|       window to be shown at the start of the program.
			main_window.show
		end

feature -- Implementation

	main_window: MAIN_WINDOW
			-- Main window.
	
	debug_window: DEBUG_WINDOW
			-- Debug window
	debug_window_create is
		do
			create debug_window.make
			debug_window.show
		end
		
end -- class APPLICATION
