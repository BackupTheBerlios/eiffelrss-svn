indexing
	description: "Class that provides access to common events %Nthat have to be accessible to the whole application"
	author: "Martin Luder"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	COMMON_EVENTS

inherit
	APP_REF

feature -- Events

	on_preferences is
			-- preferences setting access
		deferred
		end
	
	on_exit is
			-- exit application
		deferred
		end

	on_about is
			-- show about information
		deferred
		end
		
	add_feed (url: STRING) is
			-- add feed with URI 'address'
		do
			
		end
		
	on_refresh is
			-- refresh current feed
		do
			
		end
		
	on_refresh_all is
			-- refresh all feeds
		do
			
		end
	
	on_remove is
			-- remove current feed
		do
			
		end
	
	open_url (link: URL; asynchronous_request: BOOLEAN) is
			-- open url
		local
			env: EXECUTION_ENVIRONMENT
			command: STRING
		do
			if (application.properties.has ("Browser_path") or else application.application_properties.has ("Browser_path")) and then not application.properties.get ("Browser_path").is_empty then
				create env
				command := "%"" + application.properties.get ("Browser_path") + "%" " + link.location
				application.logfile.log_message ("open_url: launching command '" + command + "'", feature {LOGFILE}.developer)
				env.system (command)
			else
				application.application_displayer.information_displayer.show_temporary_text (application.application_displayer.Preferences_browser_not_set_information)
			end
		end

	test_routine is
			-- routine the only purpose of which is to do testing :)
		local
			sbar: STATUS_BAR
			i: INTEGER
		do
			sbar ?= application.application_displayer.information_displayer
			if sbar /= void then
				sbar.show_progress (5)
				from
					i := 1
				until
					i > 5
				loop
					application.sleep (200)
					sbar.progress_forward
					i := i + 1
				end
			end
		end
		

end -- class COMMON_EVENTS
