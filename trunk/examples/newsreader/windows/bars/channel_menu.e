indexing
	description: "Objects that ..."
	author: ""
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
			make_with_text (menu_channel_item)
			create menu_item.make_with_text (menu_channel_add_item)
			extend (menu_item)
			create menu_item.make_with_text (menu_channel_refresh_item)
			extend (menu_item)
			create menu_item.make_with_text (menu_channel_edit_item)
			extend (menu_item)
			create menu_item.make_with_text (menu_channel_remove_item)
			extend (menu_item)
			create menu_item.make_with_text (menu_channel_remove_all_item)
			extend (menu_item)
		end

	application: APPLICATION
	
end -- class CHANNEL_MENU
