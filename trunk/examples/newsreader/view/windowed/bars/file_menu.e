indexing
	description: "'File' menu"
	author: "Martin Luder"
	date: "$Date$"
	revision: "$Revision$"

class 
	FILE_MENU

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
			
				-- set text of menu
			make_with_text (Menu_file_item)
			
				-- create menu items
			create menu_item.make_with_text (Menu_file_exit_item)
			menu_item.select_actions.extend (agent on_exit)
			
			extend (menu_item)
		end

end -- class FILE_MENU
