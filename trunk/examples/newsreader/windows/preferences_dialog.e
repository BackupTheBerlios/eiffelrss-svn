indexing
	description: "Objects that ..."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class 
	PREFERENCES_DIALOG

inherit
	EV_DIALOG
		redefine
			initialize
		end

	INTERFACE_NAMES
		export
			{NONE} all
		undefine
			default_create,
			copy
		end

create 
	make

feature 

	make (a: APPLICATION) is
		require
			a_not_void: a /= Void
		do
			application := a
			default_create
			load_properties
		end

	initialize is
		local
			main_vertical_box: EV_VERTICAL_BOX
			button_box: EV_HORIZONTAL_BOX
		do
			Precursor
			create main_vertical_box
			main_vertical_box.set_border_width (5)
			main_vertical_box.set_padding (10)
			create ask_on_exit.make_with_text (preferences_ask_on_exit_item)
			main_vertical_box.extend (ask_on_exit)
			create user_specific.make_with_text (preferences_user_specific_item)
			main_vertical_box.extend (user_specific)
			main_vertical_box.extend (create {EV_CELL})
			main_vertical_box.extend (create {EV_HORIZONTAL_SEPARATOR})
			create button_box
			button_box.extend (create {EV_CELL})
			create cancel_button.make_with_text (button_cancel_item)
			cancel_button.set_minimum_size (75, 24)
			cancel_button.select_actions.extend (agent destroy)
			button_box.extend (cancel_button)
			button_box.disable_item_expand (cancel_button)
			create ok_button.make_with_text (button_ok_item)
			ok_button.set_minimum_size (75, 24)
			ok_button.select_actions.extend (agent save_to_custom)
			ok_button.select_actions.extend (agent destroy)
			button_box.extend (ok_button)
			button_box.disable_item_expand (ok_button)
			button_box.set_padding (10)
			main_vertical_box.extend (button_box)
			main_vertical_box.disable_item_expand (button_box)
			extend (main_vertical_box)
			set_title (preferences_item)
			set_minimum_size (200, 150)
			close_request_actions.extend (agent destroy)
		end
	
feature {NONE} 

	ask_on_exit: EV_CHECK_BUTTON

	user_specific: EV_CHECK_BUTTON

	ok_button: EV_BUTTON

	cancel_button: EV_BUTTON

	save_to_custom is
		do
			if user_specific.is_selected then
				if application.properties.get ("User_specific").is_equal ("no") then
					application.load_custom_properties
				end
				application.logfile.log_message ("Preferences: setting 'User_specific' to 'yes'", application.logfile.developer)
				application.default_properties.force ("yes", "User_specific")
			else
				application.logfile.log_message ("Preferences: setting 'User_specific' to 'no'", application.logfile.developer)
				application.properties.force ("no", "User_specific")
			end
			if ask_on_exit.is_selected then
				application.logfile.log_message ("Preferences: setting 'Ask_on_exit' to 'yes'", application.logfile.developer)
				application.properties.force ("yes", "Ask_on_exit")
			else
				application.logfile.log_message ("Preferences: setting 'Ask_on_exit' to 'no'", application.logfile.developer)
				application.properties.force ("no", "Ask_on_exit")
			end
			application.save_properties
		end

	load_properties is
		do
			if application.properties.get ("Ask_on_exit").is_equal ("yes") then
				ask_on_exit.enable_select
			end
			if application.properties.get ("User_specific").is_equal ("yes") then
				user_specific.enable_select
			end
		end

	application: APPLICATION
	
end -- class PREFERENCES_DIALOG
