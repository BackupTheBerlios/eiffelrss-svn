indexing
	description: "'Help' menu"
	author: "Martin Luder"
	date: "$Date$"
	revision: "$Revision$"

class 
	HELP_MENU

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
			make_with_text (menu_help_item)
			
				-- create menu items
			create menu_item.make_with_text (menu_help_about_item)
			menu_item.select_actions.extend (agent on_about)
			extend (menu_item)
		end
	
end -- class HELP_MENU
