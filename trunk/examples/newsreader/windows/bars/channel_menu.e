indexing
	description: "'Channel' menu"
	author: "Martin Luder"
	date: "$Date$"
	revision: "$Revision$"

class 
	CHANNEL_MENU

inherit
	EV_MENU

	INTERFACE_NAMES
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
		redefine
			make
		end

	COMMON_EVENTS
		undefine
			default_create,
			copy,
			is_equal
		end
	
create 
	make

feature 

	make is
		local
			menu_item: EV_MENU_ITEM
		do		
			Precursor {APP_REF}

				-- set menu text
			make_with_text (menu_channel_item)
			
				-- create menu items
			create menu_item.make_with_text (menu_channel_add_item)
			menu_item.select_actions.extend (agent on_add)
			extend (menu_item)
			create menu_item.make_with_text (menu_channel_refresh_item)
			menu_item.select_actions.extend (agent on_refresh)
			extend (menu_item)
			create menu_item.make_with_text (menu_channel_edit_item)
			menu_item.select_actions.extend (agent on_edit)
			extend (menu_item)
			create menu_item.make_with_text (menu_channel_remove_item)
			menu_item.select_actions.extend (agent on_remove)
			extend (menu_item)
			create menu_item.make_with_text (menu_channel_refresh_all_item)
			menu_item.select_actions.extend (agent on_refresh_all)
			extend (menu_item)
		end
	
end -- class CHANNEL_MENU
