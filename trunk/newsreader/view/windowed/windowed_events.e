indexing
	description: "Objects that ..."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	WINDOWED_EVENTS

inherit
	COMMON_EVENTS


feature {NONE} -- Events

	on_preferences is
			-- Open preferences dialog
		local
			preferences_dialog: PREFERENCES_DIALOG
			mw: MAIN_WINDOW
		do
			create preferences_dialog.make
			mw ?= application.application_displayer
			if mw /= void then preferences_dialog.show_modal_to_window (mw) end
		end
	
	on_exit is
			-- exit application
		local
			mw: MAIN_WINDOW
		do
			mw ?= application.application_displayer
			if mw /= void then mw.request_close_window end
		end

	on_about is
			-- open about dialog
		local
			about_dialog: ABOUT_DIALOG
			mw: MAIN_WINDOW
		do
			create about_dialog
			mw ?= application.application_displayer
			if mw /= void then about_dialog.show_modal_to_window (mw) end
		end

	on_add is
			-- open add dialog
		local
			add_dialog: ADD_DIALOG
			mw: MAIN_WINDOW
		do
			create add_dialog.make
			mw ?= application.application_displayer
			if mw /= void then add_dialog.show_modal_to_window (mw) end
		end

	on_edit is
			-- open edit dialog for current feed
		local
			edit_dialog: EDIT_DIALOG
			mw: MAIN_WINDOW
		do
			create edit_dialog.make
			mw ?= application.application_displayer
			edit_dialog.show_modal_to_window (mw)
		end	

end -- class WINDOWED_EVENTS
