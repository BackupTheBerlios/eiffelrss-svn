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

	show_preferences is
			-- preferences setting access
		deferred
		end
	
	exit is
			-- exit application
		deferred
		end

	show_about is
			-- show about information
		deferred
		end
		
	add_feed (url: STRING) is
			-- add feed with URI 'address'
		do
			application.load_feed (url)
		end

	remove_feed is
			-- remove current feed
		do
			if application.current_feed /= void then
				application.logfile.log_message ("Removing feed '" + application.current_feed.title + "'", feature{LOGFILE}.Info)
				application.feed_manager.remove (application.current_feed.link.location)
				debug
					application.logfile.log_message ("Removing feed url '" + application.current_feed.link.location + "'", feature{LOGFILE}.Info)
				end
				if not application.feed_manager.is_empty then
					application.feed_manager.start
					application.set_current_feed (application.feed_manager.item_for_iteration)
				else
					application.set_current_feed_void
				end
			end
		end
	
	remove_item (an_item: ITEM) is
			-- remove an_item from current feed
		require
			an_item_not_void: an_item /= void
		do
			application.logfile.log_message ("Removing item '" + an_item.title + "' from feed '" + application.current_feed.title + "'", feature{LOGFILE}.Info)
			if application.current_feed.items.has (an_item) then
				application.logfile.log_message ("'" + an_item.title + "' found, removing... ", feature{LOGFILE}.Developer)
				application.current_feed.remove_item (an_item)
			end
		end
		
	refresh is
			-- refresh current feed
		do
			
		end
		
	refresh_all is
			-- refresh all feeds
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
				if asynchronous_request then
					env.launch (command)
				else
					env.system (command)
				end
			else
				application.application_displayer.information_displayer.show_temporary_text (application.application_displayer.Preferences_browser_not_set_information)
			end
		end

--	test_routine is
--			-- routine the only purpose of which is to do testing :)
--		do
			
--		end
		

end -- class COMMON_EVENTS
