indexing
	description: "Objects that ..."
	author: ""
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
			make_with_text (menu_help_item)
			create menu_item.make_with_text (menu_help_about_item)
			menu_item.select_actions.extend (agent on_about)
			extend (menu_item)
		end
	
feature {NONE} 

	on_about is
		local
			about_dialog: ABOUT_DIALOG
		do
			create about_dialog
			about_dialog.show_modal_to_window (application.main_window)
		end

	application: APPLICATION
	
end -- class HELP_MENU
