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
			create_log
			
				-- Open properties files
			load_properties

				-- create and initialize the first window.
			create main_window.make
				-- Show the first window.
				--| TODO: Remove this line if you don't want the first 
				--|       window to be shown at the start of the program.
			main_window.show
			
				-- create debug window and hide
		end

feature -- Implementation

	main_window: MAIN_WINDOW
			-- Main window.
	
--	debug_window: DEBUG_WINDOW
	
	create_log is
			-- 
		local
			dw: DEBUG_WINDOW
		do
			create {DEBUG_WINDOW}logfile.make_filename ("newsreader.log")
			logfile.set_threshold (logfile.Developer)
			
			dw ?= logfile
			if dw /= void then
				dw.hide
			end
		end
		
	
	debug_window_create is
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

end -- class APPLICATION
