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
			application.load_feed (create{STRING}.make_from_string (url))
			application.feeds.extend (url)
		end

	on_feed_remove is
			-- remove current feed
		do
			application.logfile.log_message ("Removing feed '" + application.current_feed.title + "'", feature{LOGFILE}.Info)
			application.feed_manager.remove (application.current_feed_url)
			application.logfile.log_message ("Removing feed url '" + application.current_feed_url + "'", feature{LOGFILE}.Info)
			application.feeds.search (application.current_feed_url)
			if not application.feeds.exhausted then
				application.feeds.remove
			end
			if not application.feed_manager.is_empty then
				application.feed_manager.start
				application.set_current_feed_url (application.feed_manager.key_for_iteration)
			end
		end
	
	on_item_remove (an_item: ITEM) is
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
		
	on_refresh is
			-- refresh current feed
		do
			
		end
		
	on_refresh_all is
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
