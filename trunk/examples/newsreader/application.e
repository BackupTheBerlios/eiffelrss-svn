indexing
	description	: "Root class for this application."
	author		: "Martin Luder"
	date		: "$Date: 2005/1/13 18:10:25 $"
	revision	: "1.0.0"

class
	APPLICATION

inherit
	EV_APPLICATION
		redefine
			launch
		end
	
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
	
	launch is
			-- launch application
		local
			clm: CL_MAIN
		do
			if is_cl then
				clm ?= application_displayer
				if clm /= void then
					is_launched := True
					clm.start
				end
			else
				Precursor
			end
		end
		

feature -- Implementation

	application_displayer: APPLICATION_DISPLAYER
	
	is_no_debug_window: BOOLEAN
			-- if true, no debug window will be created, just plain logfile
	
	is_cl: BOOLEAN
			-- run in command line
		
	create_log is
			-- 
		local
			dw: DEBUG_WINDOW
		do
			if is_no_debug_window then
				create logfile.make_filename ("newsreader.log")
				logfile.set_threshold (logfile.Developer)
			else
				create {DEBUG_WINDOW}logfile.make_filename_threshold ("newsreader.log", feature {LOGFILE}.Developer)
				
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
			if is_cl then
				create {CL_MAIN}application_displayer.make
			else
				create {MAIN_WINDOW}application_displayer.make
				
				mw ?= application_displayer
				if mw /= void then
					mw.show
				end
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
		do
			create env
			if env.command_line.index_of_word_option ("no_debug_window") /= 0 then
				is_no_debug_window := true
			end
			if env.command_line.index_of_word_option ("cl") /= 0 then
				is_cl := true
			end
		end
		

end -- class APPLICATION
