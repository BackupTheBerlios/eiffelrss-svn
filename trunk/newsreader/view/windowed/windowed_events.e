indexing
	description: "Class that provides access to common events %Nthat have to be accessible to all windowed classes"
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
			-- open edit dialog for currently selected item/feed
		local
			mw: MAIN_WINDOW
		do
			mw ?= application.application_displayer
			if mw /= void then 
				if mw.has_feed_focus then
					on_feed_edit
				elseif mw.has_item_focus then
					on_item_edit
				end
			end
		end
	
	on_feed_edit is
			-- open edit dialog for current feed
		local
			edit_dialog: EDIT_DIALOG
			mw: MAIN_WINDOW
		do
			if application.feed_manager.count > 0 then
				create edit_dialog.make
				mw ?= application.application_displayer
				if mw /= void then edit_dialog.show_modal_to_window (mw) end
			end
		end
		
	
	on_item_edit is
			-- open edit dialog fro current item
		local
			edit_dialog: ITEM_EDIT_DIALOG
			mw: MAIN_WINDOW
		do
			if application.current_feed.items.count > 0 then
				create edit_dialog.make
				mw ?= application.application_displayer
				if mw /= void then edit_dialog.show_modal_to_window (mw) end
			end
		end

	on_remove is
			-- remove current feed/item
		local
			mw: MAIN_WINDOW
		do
			mw ?= application.application_displayer
			if mw /= void then 
				if mw.has_feed_focus then
					on_feed_remove
					mw.show_feed_list
				elseif mw.has_item_focus then
					on_item_remove (mw.selected_item)
					mw.show_feed
				end
			end
		end

	show_feed is
			-- show current feed
		local
			mw: MAIN_WINDOW
		do
			mw ?= application.application_displayer
			if mw /= void then
				mw.show_feed
			end
		end

end -- class WINDOWED_EVENTS
