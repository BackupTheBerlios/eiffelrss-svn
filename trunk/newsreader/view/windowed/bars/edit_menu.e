indexing
	description: "'Edit' menu"
	author: "Martin Luder"
	date: "$Date$"
	revision: "$Revision$"

class 
	EDIT_MENU

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
		do			
			make_app_ref

				-- set menu text
			make_with_text (menu_edit_item)
			
				-- create menu items
			create menu_item.make_with_text (menu_edit_preferences_item)
			menu_item.select_actions.extend (agent on_preferences)
			extend (menu_item)
		end
	
end -- class EDIT_MENU
