indexing
	description: "Objects that ..."
	author: ""
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

create 
	make

feature 

	make (a: APPLICATION) is
		require
			a_not_void: a /= Void
		local
			menu_item: EV_MENU_ITEM
		do
			application := a
			make_with_text (menu_file_item)
			create menu_item.make_with_text (menu_file_exit_item)
			menu_item.select_actions.extend (agent request_close_window)
			extend (menu_item)
		end

	application: APPLICATION
	
feature 

	request_close_window is
		do
			application.main_window.request_close_window
		end
	
end -- class FILE_MENU
