indexing
	description: "Main window for this application"
	author: "Martin Luder"
	date: "$Date: 2005/1/13 18:10:25 $"
	revision: "1.0.0"

class 
	MAIN_WINDOW

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
			is_equal
		end
	
create 
	make

feature {NONE} 

	make is
		do
			Precursor {APP_REF}
			default_create
		end

	initialize is
		local
			accelerator: EV_ACCELERATOR
			key: EV_KEY
			key_constants: EV_KEY_CONSTANTS
		do
			Precursor {EV_TITLED_WINDOW}
			
				-- build menus
			build_standard_menu_bar
			set_menu_bar (standard_menu_bar)
			upper_bar.extend (create {EV_HORIZONTAL_SEPARATOR})
			
				-- build tool bar
			create toolbar.make
			upper_bar.extend (toolbar)
			if application.properties.get ("Show_toolbar").is_equal ("no") then
				toolbar.hide
			end
			
				-- build status bar
			build_status_bar
			lower_bar.extend (status_bar)
			
				-- build main area
			build_main_view
			
				-- set accelerators
			create key_constants
			create key.make_with_code (key_constants.key_q)
			create accelerator.make_with_key_combination (key, true, false, false)
			accelerator.actions.extend (agent on_exit)
			accelerators.extend (accelerator)
			create key.make_with_code (key_constants.key_p)
			create accelerator.make_with_key_combination (key, true, false, false)
			accelerator.actions.extend (agent on_preferences)
			accelerators.extend (accelerator)
			create key.make_with_code (key_constants.key_n)
			create accelerator.make_with_key_combination (key, true, false, false)
			accelerator.actions.extend (agent on_add)
			accelerators.extend (accelerator)
			create key.make_with_code (key_constants.key_t)
			create accelerator.make_with_key_combination (key, true, false, false)
			accelerator.actions.extend (agent on_refresh)
			accelerators.extend (accelerator)
			create key.make_with_code (key_constants.key_t)
			create accelerator.make_with_key_combination (key, true, false, true)
			accelerator.actions.extend (agent on_add)
			accelerators.extend (accelerator)
			create key.make_with_code (key_constants.key_u)
			create accelerator.make_with_key_combination (key, true, false, false)
			accelerator.actions.extend (agent on_edit)
			accelerators.extend (accelerator)
			create key.make_with_code (key_constants.key_d)
			create accelerator.make_with_key_combination (key, true, false, false)
			accelerator.actions.extend (agent on_remove)
			accelerators.extend (accelerator)
			create key.make_with_code (key_constants.key_backquote)
			create accelerator.make_with_key_combination (key, true, true, false)
			accelerator.actions.extend (agent on_debug)
			accelerators.extend (accelerator)

				-- set window options
			close_request_actions.extend (agent request_close_window)
			set_title (application.properties.get ("Window_title"))
			
			resize_actions.extend (agent on_resize_or_move)
			move_actions.extend (agent on_resize_or_move)
			minimize_actions.extend (agent on_minimize)
			maximize_actions.extend (agent on_maximize)
			restore_actions.extend (agent on_restore)
			
			show_actions.extend (agent restore_maximize_minimize)
			restore_window_size_and_position
		end

	is_in_default_state: BOOLEAN is
		do
			Result := true or else (width = application.properties.get ("Window_width").to_integer) and then (height = application.properties.get ("Window_height").to_integer) and then (title.is_equal (application.properties.get ("Window_title")))
		end
	

	
feature {APP_REF} -- Menu bar

	standard_menu_bar: EV_MENU_BAR

	file_menu: FILE_MENU
	edit_menu: EDIT_MENU
	channel_menu: CHANNEL_MENU
	help_menu: HELP_MENU

	build_standard_menu_bar is
			-- create all menu objects
		require
			menu_bar_not_yet_created: standard_menu_bar = Void
		do
			create standard_menu_bar
			create file_menu.make
			standard_menu_bar.extend (file_menu)
			create edit_menu.make
			standard_menu_bar.extend (edit_menu)
			create channel_menu.make
			standard_menu_bar.extend (channel_menu)
			create help_menu.make
			standard_menu_bar.extend (help_menu)
		ensure
			menu_bar_created: standard_menu_bar /= Void and then not standard_menu_bar.is_empty
		end
	
feature {APP_REF} -- Toolbar

	toolbar: TOOLBAR
	
feature {APP_REF} -- Status bar

	status_bar: EV_STATUS_BAR

	standard_status_label: EV_LABEL
	temporary_status_label: EV_LABEL

	build_status_bar is
			-- build status bar
		require
			status_bar_not_yet_created: status_bar = Void and then standard_status_label = Void
		do
			create status_bar
			status_bar.set_border_width (2)
			create standard_status_label.make_with_text ("Welcome to " + Application_name)
			create temporary_status_label
			standard_status_label.align_text_left
			status_bar.extend (standard_status_label)
		ensure
			status_bar_created: status_bar /= Void and then standard_status_label /= Void
		end
	
feature -- Events

	request_close_window is
			-- show confirmation dialog if Ask_on_exit is 'yes', else close window and application
		local
			question_dialog: EV_CONFIRMATION_DIALOG
		do			
			application.logfile.log_message ("Exit requested", application.logfile.Info)
			if application.properties.get ("Ask_on_exit").is_equal ("yes") then
				create question_dialog.make_with_text (label_confirm_close_window)
				question_dialog.show_modal_to_window (Current)
				if question_dialog.selected_button.is_equal ((create {EV_DIALOG_CONSTANTS}).ev_ok) then
					application.logfile.log_message ("destroying window...", application.logfile.Info)
					destroy
					application.logfile.log_message ("saving preferences", application.logfile.Info)
					application.save_properties
					application.logfile.log_message ("destroying application", application.logfile.Info)
					application.destroy
				end
			elseif application.properties.get ("Ask_on_exit").is_equal ("no") then
				application.logfile.log_message ("destroying window...", application.logfile.Info)
				destroy
				application.logfile.log_message ("saving preferences", application.logfile.Info)
				application.save_properties
				application.logfile.log_message ("destroying application", application.logfile.Info)
				application.destroy
			end
		end
	
	on_resize_or_move (x,y, w, h: INTEGER)  is
			-- called when window was resized
		do
			application.properties.force (x.out, "Window_x_position")
			application.properties.force (y.out, "Window_y_position")
			application.properties.force (w.out, "Window_width")
			application.properties.force (h.out, "Window_height")
		end
	
	on_minimize is
			-- called when window was minimized
		require
			minimized: is_minimized
		do
			application.properties.force ("yes", "Window_minimized")
		end
	
	on_maximize is
			-- called when window was maximized
		require
			maximized: is_maximized
		do
			application.properties.force ("yes", "Window_maximized")
		end
		
	on_restore is
			-- called when window was restored
		require
			not_minimized_or_maximized: not is_minimized and not is_maximized
		do
			application.properties.force ("no", "Window_minimized")
			application.properties.force ("no", "Window_maximized")
		end
		
		
	on_debug is
			-- open debug window
		do
			application.debug_window_create
		end
		
	
feature {NONE} -- Newsfeed representation

	newsfeed_list: NEWSFEED_LIST

	feed_detail_view: FEED_DETAIL_VIEW
	
feature {NONE} -- Implementation

	main_container: EV_VERTICAL_BOX

	horizontal_split_area: EV_HORIZONTAL_SPLIT_AREA

	horizontal_box: EV_HORIZONTAL_BOX

	build_main_view is
		require
			main_container_not_yet_created: main_container = Void
		do
			create main_container
			create horizontal_split_area
			horizontal_split_area.set_minimum_width (400)
			create newsfeed_list.make
			horizontal_split_area.set_first (newsfeed_list)
			create feed_detail_view.make
			horizontal_split_area.set_second (feed_detail_view)
			main_container.extend (horizontal_split_area)
			
			extend (main_container)
		ensure
			main_container_created: main_container /= Void
		end
		
	restore_window_size_and_position is
			-- restore window size and position from last session if stored
		do			
			if 
				application.properties.has ("Window_x_position") 
				and application.properties.has ("Window_y_position")
			then
				set_x_position (application.properties.get ("Window_x_position").to_integer)
				set_y_position (application.properties.get ("Window_y_position").to_integer)
			end
			set_size (application.properties.get ("Window_width").to_integer, application.properties.get ("Window_height").to_integer)
		end
	
	restore_maximize_minimize is
			-- restore maximized and minimized states from last session
		do
			if 
				application.properties.has ("Window_maximized") 
				and then application.properties.get ("Window_maximized").is_equal ("yes") 
			then
				maximize
			end
			if 
				application.properties.has ("Window_minimized") 
				and then application.properties.get ("Window_minimized").is_equal ("yes") 
			then
				minimize
			end
		end

end -- class MAIN_WINDOW
