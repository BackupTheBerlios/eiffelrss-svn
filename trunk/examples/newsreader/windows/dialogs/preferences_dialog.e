indexing
	description: "Preferences dialog box"
	author: "Martin Luder"
	date: "$Date$"
	revision: "$Revision$"

class 
	PREFERENCES_DIALOG

inherit
	SETTINGS_DIALOG
		rename
			on_ok as save
		redefine
			initialize,
			make
		end

create 
	make

feature -- Initialization

	make is
		do
			Precursor
			load_properties
		end

	initialize is
		local
			hbox: EV_HORIZONTAL_BOX
			cell :EV_CELL
		do
			Precursor
			
				-- create options widgets
			create ask_on_exit.make_with_text (Preferences_ask_on_exit_item)
			ask_on_exit.set_tooltip (Preferences_ask_on_exit_tooltip)
			content.extend (ask_on_exit)
			content.disable_item_expand (ask_on_exit)
			create user_specific.make_with_text (Preferences_user_specific_item)
			user_specific.set_tooltip (Preferences_user_specific_tooltip)
			user_specific.select_actions.extend (agent on_user_specific_select)
			content.extend (user_specific)
			content.disable_item_expand (user_specific)
			create share_feeds.make_with_text (Preferences_share_feeds_item)
			share_feeds.set_tooltip (Preferences_share_feeds_tooltip)
			create hbox
			create cell
			cell.set_minimum_width (20)
			hbox.extend (cell)
			hbox.disable_item_expand (cell)
			hbox.extend (share_feeds)
			content.extend (hbox)
			content.disable_item_expand (hbox)
			create show_toolbar.make_with_text (Preferences_show_toolbar_item)
			show_toolbar.set_tooltip (Preferences_show_toolbar_tooltip)
			content.extend (show_toolbar)
			content.disable_item_expand (show_toolbar)
			
				-- set dialog options
			set_title (preferences_title)
		end
	
feature {NONE} 

	ask_on_exit: EV_CHECK_BUTTON
		-- Ask_on_exit option

	user_specific: EV_CHECK_BUTTON
		-- User_specific option
	
	share_feeds: EV_CHECK_BUTTON
		-- Share_feeds option
	
	show_toolbar: EV_CHECK_BUTTON
		-- Show_toolbar option

	save is
			-- save properties to properties objects and write to files
			-- is callon on ok_button click
		do			
				-- User_specific
			if user_specific.is_selected then
				if application.properties.get ("User_specific").is_equal ("no") then
					application.load_user_properties
				end
				application.logfile.log_message ("Preferences: setting 'User_specific' to 'yes'", application.logfile.developer)
				application.application_properties.force ("yes", "User_specific")
			else
				application.logfile.log_message ("Preferences: setting 'User_specific' to 'no'", application.logfile.developer)
				application.application_properties.force ("no", "User_specific")
			end
				-- Share_feeds
			if share_feeds.is_selected then
				application.logfile.log_message ("Preferences: setting 'Share_feeds' to 'yes'", application.logfile.developer)
				application.application_properties.force ("yes", "Share_feeds")
			else
				application.logfile.log_message ("Preferences: setting 'Share_feeds' to 'no'", application.logfile.developer)
				application.application_properties.force ("no", "Share_feeds")
			end
				-- Ask_on_exit
			if ask_on_exit.is_selected then
				application.logfile.log_message ("Preferences: setting 'Ask_on_exit' to 'yes'", application.logfile.developer)
				application.properties.force ("yes", "Ask_on_exit")
			else
				application.logfile.log_message ("Preferences: setting 'Ask_on_exit' to 'no'", application.logfile.developer)
				application.properties.force ("no", "Ask_on_exit")
			end
				-- Show_toolbar
			if show_toolbar.is_selected then
				application.logfile.log_message ("Preferences: setting 'Show_toolbar' to 'yes'",application.logfile.developer)
				application.properties.force ("yes", "Show_toolbar")
				application.main_window.toolbar.show
			else
				application.logfile.log_message ("Preferences: setting 'Show_toolbar' to 'no'", application.logfile.developer)
				application.properties.force ("no", "Show_toolbar")
				application.main_window.toolbar.hide
			end
			
				-- save properties
			application.save_properties
			application.load_properties
		end

	load_properties is
			-- set widgets in window to current properties' values
			-- called in initialization of dialog
		do
			if application.properties.get ("Ask_on_exit").is_equal ("yes") then
				ask_on_exit.enable_select
			end
			if application.properties.get ("User_specific").is_equal ("yes") then
				user_specific.enable_select
			else
				share_feeds.disable_sensitive
			end
			if application.properties.get ("Show_toolbar").is_equal ("yes") then
				show_toolbar.enable_select
			end
		end

feature {NONE} -- Events

	on_user_specific_select is
			-- 
		do
			if user_specific.is_selected then
				share_feeds.enable_sensitive
			else
				share_feeds.disable_sensitive
			end
		end
	
	on_user_specific_deselect is
			-- 
		do
			
		end
		
		
end -- class PREFERENCES_DIALOG
