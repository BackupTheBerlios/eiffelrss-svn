indexing
	description: "Objects that ..."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	CL_EVENTS

inherit
	COMMON_EVENTS
		rename
			on_preferences as on_preferences_command,
			on_about as on_about_command,
			on_exit as on_exit_command
		end
	
	CL_INTERFACE_NAMES
	
feature -- Events / new

	on_exit_command is
			-- called when exit requested
		do
			is_exit_requested := true
		end
	
	on_help_command is
			-- called when help is requested
		do
			
		end

feature -- Events / redefined
	
	on_preferences_command is
		do
			
		end
	
	on_about_command is
			-- show information about this application
		do
			application.application_displayer.information_displayer.show_temporary_text (Application_name + " v" + Application_version_number + "%N" + Application_about)
		end

feature -- Status report

	is_exit_requested: BOOLEAN
end -- class CL_EVENTS