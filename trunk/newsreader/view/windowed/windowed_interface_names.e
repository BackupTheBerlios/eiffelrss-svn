indexing
	description	: "Strings for the Graphical User Interface"
	author		: "Martin Luder"
	date		: "$Date: 2005/1/13 18:10:25 $"
	revision	: "1.0.0"

deferred class
	WINDOWED_INTERFACE_NAMES

inherit
	INTERFACE_NAMES


feature -- Buttons

	Button_ok_item: STRING is "OK"
			-- String for "OK" buttons.
	
	Button_cancel_item: STRING is "Cancel"
			-- String for "Cancel" buttons

feature -- Menus

	Menu_file_item: STRING is "&File"
			-- String for menu "File"

	Menu_file_exit_item: STRING is "E&xit%TCtrl+Q"
			-- String for menu "File/Exit"

	Menu_edit_item: STRING is "E&dit"
			-- String for menu "Edit"
	
	Menu_edit_preferences_item: STRING is "&Preferences...%TCtrl+P"
			-- String for menu "Edit/Preferences..."
	
	Menu_channel_item: STRING is "&Channel"
			-- String for menu "Channel
	
	Menu_channel_add_item: STRING is "&Add...%TCtrl+N"
			-- String for menu "Channel/Add..."
	
	Menu_channel_refresh_item: STRING is "&Refresh%TCtrl+T"
			-- String for menu "Channel/Refresh"
	
	Menu_channel_edit_item: STRING is "&Edit...%TCtrl+U"
			-- String for menu "Channel/Edit...
	
	Menu_channel_remove_item: STRING is "Re&move%TCtrl+D"
			-- String for menu "Channel/Remove"
	
	Menu_channel_refresh_all_item: STRING is "Refresh a&ll%TCtrl+Shift+T"
			-- String for menu "Channel/Reload all"
	
	Menu_help_item: STRING is "&Help"
			-- String for menu "Help"

	Menu_help_contents_item: STRING is "&Contents and Index"
			-- String for menu "Help/Contents and Index"

	Menu_help_about_item: STRING is "&About..."
			-- String for menu "Help/About"


feature -- toolbar

	Toolbar_refresh_tooltip: STRING is "Refresh all feeds"
			-- String for toolbar item 'refresh' tooltip
	
	Toolbar_remove_tooltip: STRING is "Remove current feed"
			-- String for toolbar item 'delete' tooltip
	
	Toolbar_edit_tooltip: STRING is "Edit current feed"
			-- String for toolbar item 'edit' tooltip
	
	Toolbar_preferences_tooltip: STRING is "Show preferences"
			-- String for toolbar item 'preferences' tooltip

feature -- preferences

	Preferences_title: STRING is "Preferences"
			-- String for preferences dialog title bar
			
	Preferences_ask_on_exit_item: STRING is "Ask on exit"
			-- String for 'Ask on exit' item in preferences
	Preferences_ask_on_exit_tooltip: STRING is "Enable to show a confirmation dialog %Nwhen exiting the program"
			-- String for 'Ask on exit' item tooltip in preferences
			
	Preferences_user_specific_item: STRING is "User specific settings"
			-- String for 'User specific settings' item in preferences
	Preferences_user_specific_tooltip: STRING is "Enable to allow custom preferences %Nfor each user"
			-- String for 'User specific settings' item tooltip in preferences
	
	Preferences_share_feeds_item: STRING is "Share feeds"
			-- String for 'Share feeds' item in preferences
	Preferences_share_feeds_tooltip: STRING is "Save new feeds to common directory %Ninstead of user directory"
			-- String for 'Share feeds' item tooltip in preferences
	
	Preferences_show_toolbar_item: STRING is "Show toolbar"
			-- String for 'Show toolbar' item in preferences
	Preferences_show_toolbar_tooltip: STRING is "Enable to show the toolbar %Nin the main window"
			-- String for 'Show toolbar' item tooltip in preferences
	
	Preferences_browser_path_item: STRING is "Browser path"
			-- String for 'Browser path' item in preferences
	Preferences_browser_path_tooltip: STRING is "Enter path to browser executable %Nthat you want to use"
			-- String for 'Browser path' item tooltip in preferences

feature -- feed representation
	Label_confirm_close_window: STRING is "Are you sure you want to close .%NClick OK to proceed."
			-- String for the confirmation dialog box that appears
			-- when the user try to close the first window.
	
	Feed_detail_view_title_column: STRING is "Title"
			-- String for the title column in the feed detail view
	
	Feed_detail_view_description_column: STRING is "Description"
			-- String for the description column in the feed detail view
	
	Feed_detail_view_date_column: STRING is "Date"
			-- String for the date column in the feed detail view

end -- class INTERFACE_NAMES