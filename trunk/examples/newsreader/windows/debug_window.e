indexing
	description: "Window that shows properties of application and can be used to show STRINGS in runtime"
	author: "Martin Luder"
	date: "$Date$"
	revision: "$Revision$"

class
	DEBUG_WINDOW
	
inherit
	EV_TITLED_WINDOW
		redefine
			initialize,
			is_in_default_state
		end

	INTERFACE_NAMES
		export
			{NONE} all
		undefine
			default_create,
			copy
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
			is_equal,
			on_refresh
		end
		
create 
	make

feature -- Initialization

	make is
		do
			Precursor {APP_REF}
			default_create
			create logfile.make_filename_threshold ("debug.log", 1)
		end
	
	initialize is
		do
			Precursor
			create main_vbox
			create split_area
			
			create refesh_button.make_with_text_and_action ("Refresh", agent on_refresh)
			main_vbox.extend (refesh_button)
			main_vbox.disable_item_expand (refesh_button)
			create properties_view
			properties_view.set_minimum_height (350)
			split_area.set_first (properties_view)
			create text_view
			split_area.set_second (text_view)
			main_vbox.extend (split_area)
			extend (main_vbox)
			
			close_request_actions.extend (agent destroy)
			
			set_title ("DEBUG")
			set_minimum_size (250, 550)
		end
		
	is_in_default_state: BOOLEAN is true
		
	main_vbox: EV_VERTICAL_BOX
	split_area: EV_VERTICAL_SPLIT_AREA
	refesh_button: EV_BUTTON
	properties_view: EV_TEXT
	text_view: EV_TEXT
	logfile: LOGFILE
		
	on_refresh is
		local
			string: STRING
		do
			string := application.application_default_properties.list
			string := string + "%N"
			string := string + application.application_properties.list
			string := string + "%N"
			string := string + application.user_properties.list
			properties_view.set_text (string)
			
			add_text ("refresh clicked%N")
		end
	
	add_text (s: STRING) is
			-- add 's' to text_view
		require
			s_not_void: s /= void
		do
			text_view.append_text (s)
			logfile.log_message (s, 1)
		end

invariant
	logfile_not_void: logfile /= void
end -- class DEBUG_WINDOW
