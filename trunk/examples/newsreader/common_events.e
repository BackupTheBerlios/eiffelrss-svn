indexing
	description: "Class that provides access to common events %Nthat have to be accessible to the whole application"
	author: "Martin Luder"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	COMMON_EVENTS

inherit
	APP_REF
		undefine
			make
		end

feature {NONE} -- Events

	on_preferences is
			-- Open preferences dialog
		local
			preferences_dialog: PREFERENCES_DIALOG
		do
			create preferences_dialog.make
			preferences_dialog.show_modal_to_window (application.main_window)
		end

	on_exit is
			-- exit application
		do
			application.main_window.request_close_window
		end

	on_about is
			-- open about dialog
		local
			about_dialog: ABOUT_DIALOG
		do
			create about_dialog
			about_dialog.show_modal_to_window (application.main_window)
		end
	
	on_add is
			-- open add dialog
		local
			add_dialog: ADD_DIALOG
		do
			create add_dialog.make
			add_dialog.show_modal_to_window (application.main_window)
		end
		
	on_add_feed_from_string (address: STRING) is
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
	
	on_edit is
			-- open edit dialog for current feed
		local
			edit_dialog: EDIT_DIALOG
		do
			create edit_dialog.make
			edit_dialog.show_modal_to_window (application.main_window)
		end		

end -- class COMMON_EVENTS
