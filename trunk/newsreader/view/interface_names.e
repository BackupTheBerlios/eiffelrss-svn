indexing
	description: "Objects that ..."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	INTERFACE_NAMES

feature -- General

	Application_name: STRING is "Newsreader"
			-- String with application's name
			
	Application_version_number: STRING is "0.x"
			-- String representing application's version number
			
	Application_about: STRING is ""
			-- String representing information about this application

feature -- preferences

	Preferences_browser_not_set_information: STRING is "Path to browser executable not set"
			-- String for information, that is shown when trying to open an URI while Browser_path is not set

feature -- add

	Add_title: STRING is "Add"
			-- String for add dialog title bar
			
	Add_address_item: STRING is "Address"
			-- String for 'Address' item in add dialog
	
	Add_empty_address_information: STRING is "Please enter an address"
			-- String for status bar when no address is entered in add dialog

feature -- edit

	Edit_title: STRING is "Edit"
			-- String for edit dialog title bar
	
	Edit_name_item: STRING is "Name"
			-- String for 'Name' item in edit dialog
	
	Edit_address_item: STRING is "Address"
			-- String for 'Address' item in edit dialog

end -- class INTERFACE_NAMES
