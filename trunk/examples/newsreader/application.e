indexing
	description	: "Root class for this application."
	author		: "Generated by the New Vision2 Application Wizard."
	date		: "$Date: 2005/1/13 18:10:25 $"
	revision	: "1.0.0"

class
	APPLICATION

inherit
	EV_APPLICATION

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
			create main_window.make (Current)

				-- Show the first window.
				--| TODO: Remove this line if you don't want the first 
				--|       window to be shown at the start of the program.
			main_window.show
		end

feature -- Implementation

	main_window: MAIN_WINDOW
			-- Main window.


feature -- Logging
	
	logfile: LOGFILE
			-- logfile of the application
	
	load_logfile is
			-- create logfile
		do
			create logfile.make_filename ("newsreader.log")
			logfile.set_threshold (logfile.Developer)
		end
		
			
feature -- Properties
	
	application_default_properties: PROPERTIES
	default_properties: PROPERTIES
	properties: PROPERTIES
	
	load_properties is
			-- load properties in right order
		do
			load_application_default_properties
			load_application_properties
			load_custom_properties
		ensure
			properties_not_void: properties /= void
		end
		
	
	load_application_default_properties is
			-- load default properties into default_properties
		do
			create application_default_properties.make (5)
			application_default_properties.put ("newsreader","Window_title")
			application_default_properties.put ("1000","Window_width")
			application_default_properties.put ("800","Window_height")
			application_default_properties.put ("yes","Ask_on_exit")
			application_default_properties.put ("no", "User_specific")
			
			
			-- INTERNAL
			application_default_properties.put (".properties","application_properties_file")
			application_default_properties.put ("default.properties","application_default_properties_file")
			
			logfile.log_message ("Application default properties loaded",logfile.Info)
			check_and_correct_properties (application_default_properties)
		end
	
	load_application_properties is
			-- load custom properties from file
		require
			application_default_properties_not_void: application_default_properties /= void
		local
			file: PLAIN_TEXT_FILE
			filename: STRING
			dir: DIRECTORY
		do
			create dir.make ("settings")
			if not dir.exists then
				dir.create_dir
			end
			
			filename := "settings" + operating_environment.directory_separator.out + application_default_properties.get ("application_default_properties_file")
			create file.make (filename)
			if not file.exists then
				file.create_read_write
			else
				file.open_read_write
			end
			create default_properties.make_defaults (10, application_default_properties)
			
			default_properties.load (file)
			
			logfile.log_message ("Application properties loaded from '" + filename + "'", logfile.Info)
			check_and_correct_properties (default_properties)
		end
	
	load_custom_properties is
			-- load user properties from file in user directory
		require
			default_properties_not_void: default_properties /= void
		local
			file: PLAIN_TEXT_FILE
			path: STRING
		do
			create properties.make_defaults (10, default_properties)
			if (properties.get ("User_specific")).is_equal ("yes") then
				path := custom_properties_path
			
				create file.make (path + operating_environment.directory_separator.out + application_default_properties.get ("application_properties_file"))
				if not file.exists then
					file.create_read_write
				else
					file.open_read_write
				end
				properties.load (file)
			
				logfile.log_message ("Custom properties loaded",logfile.Info)
				
			end
			check_and_correct_properties (properties)
		end
	
	check_and_correct_properties (p: PROPERTIES) is
			-- check p for validity and delete incorrect entries
		require
			p_not_void: p /= void
		do
			if not p.get ("Window_width").is_integer then
				logfile.log_message ("WARNING: Window_width is no integer, loading default value",logfile.Warning)
				p.remove ("Window_width")
			end
			if not p.get ("Window_height").is_integer then
				logfile.log_message ("WARNING: Window_height is no integer, loading default value", logfile.Warning)
				p.remove ("Window_height")
			end
			if not (p.get ("Ask_on_exit").is_equal ("yes") or p.get ("Ask_on_exit").is_equal ("no")) then
				logfile.log_message ("WARNING: Ask_on_exit is not 'yes' or 'no', loading default value", logfile.Warning)
				p.remove ("Ask_on_exit")
			end
			if not (p.get ("User_specific").is_equal ("yes") or p.get ("User_specific").is_equal ("no")) then
				logfile.log_message ("WARNING: User_specific is not 'yes' or 'no', loading default value", logfile.Warning)
				p.remove ("User_specific")
			end
		end
	
	save_properties is
			-- save properties
		local
			path: STRING
			filename: STRING
			file: PLAIN_TEXT_FILE
		do
			create file.make_open_write ("settings" + operating_environment.directory_separator.out + application_default_properties.get ("application_default_properties_file"))
			default_properties.store (file, "newsreader default preferences")
			if properties.get ("User_specific").is_equal ("yes") then
				path := custom_properties_path
				filename := application_default_properties.get ("application_properties_file")
				
			else
				path := "settings"
				filename := application_default_properties.get ("application_default_properties_file")
			end

			create file.make_open_write (path + operating_environment.directory_separator.out + filename)
			properties.store (file, "newsreader user preferences")
		end
		
	custom_properties_path: STRING is
			-- path to custom properties file
			-- will create path if not exists
		local
			env: EXECUTION_ENVIRONMENT
			platform: PLATFORM
			dir: DIRECTORY
		do
			create platform
			create env
			Result := "settings"
			if platform.is_windows then
				Result := env.get ("APPDATA")
				create dir.make (Result)
				if dir.exists then
					Result := Result + operating_environment.directory_separator.out + "newsreader"
				else
					Result := "settings"
				end
			elseif platform.is_unix then
				Result := env.get ("HOME")
				create dir.make (Result)
				if dir.exists then
					Result := Result + operating_environment.directory_separator.out + ".newsreader"
				else
					Result := "settings"
				end
			end
			
			create dir.make (Result)
			if not dir.exists then
				dir.create_dir
			end
		end
		
end -- class APPLICATION
