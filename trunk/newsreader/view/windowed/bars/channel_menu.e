indexing
	description: "'Channel' menu"
	author: "Martin Luder"
	date: "$Date$"
	revision: "$Revision$"

class 
	CHANNEL_MENU

inherit
	EV_MENU

	WINDOWED_INTERFACE_NAMES
		export
			{NONE} all
		undefine
			default_create,
			copy,
			is_equal
		end

	APP_REF
		undefine
			default_create,
			copy,
			is_equal
		end

	WINDOWED_EVENTS
		undefine
			default_create,
			copy,
			is_equal
		end
	
create 
	make

feature -- Initialization

	make is
		local
			menu_item: EV_MENU_ITEM
			mw: MAIN_WINDOW
		do		
			make_app_ref

				-- set menu text
			make_with_text (menu_channel_item)
			
				-- create menu items
			create menu_item.make_with_text (menu_channel_add_item)
			menu_item.select_actions.extend (agent on_add)
			extend (menu_item)
			create menu_item.make_with_text (menu_channel_refresh_item)
			menu_item.select_actions.extend (agent refresh)
			extend (menu_item)
			create menu_item.make_with_text (menu_channel_feed_edit_item)
			menu_item.select_actions.extend (agent on_feed_edit)
			extend (menu_item)
			create menu_item.make_with_text (menu_channel_item_edit_item)
			menu_item.select_actions.extend (agent on_item_edit)
			extend (menu_item)
			create menu_item.make_with_text (menu_channel_feed_remove_item)
			menu_item.select_actions.extend (agent remove_feed)
			extend (menu_item)
			create menu_item.make_with_text (menu_channel_item_remove_item)
			mw ?= application.application_displayer
			if mw /= void then
				menu_item.select_actions.extend (agent remove_item (mw.selected_item))
			end
			extend (menu_item)
			create menu_item.make_with_text (menu_channel_refresh_all_item)
			menu_item.select_actions.extend (agent refresh_all)
			extend (menu_item)
		end
	
end -- class CHANNEL_MENU
