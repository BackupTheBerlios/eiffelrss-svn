indexing
	description: "General dialog box with an OK and a Cancel button"
	author: "Martin Luder"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	SETTINGS_DIALOG

inherit
	EV_DIALOG
		redefine
			initialize
		end

	WINDOWED_INTERFACE_NAMES
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

feature -- Initialization
	
	make is
			-- creation procedure
		do
			Precursor {APP_REF}
			default_create
		end
	
	initialize is
		local
			main_vertical_box: EV_VERTICAL_BOX
			button_box: EV_HORIZONTAL_BOX
			cell: EV_CELL
		do
			Precursor
			
				-- create containers
			create main_vertical_box
			main_vertical_box.set_border_width (5)
			create content
			main_vertical_box.extend (content)
			create cell
			cell.set_minimum_height (5)
			main_vertical_box.extend (cell)
			
				-- create buttons
			create button_box
			button_box.extend (create {EV_CELL})
			create cancel_button.make_with_text (button_cancel_item)
			cancel_button.set_minimum_size (75, 24)
			cancel_button.select_actions.extend (agent destroy)
			button_box.extend (cancel_button)
			button_box.disable_item_expand (cancel_button)
			create ok_button.make_with_text (button_ok_item)
			ok_button.set_minimum_size (75, 24)
			ok_button.select_actions.extend (agent on_ok)
			ok_button.select_actions.extend (agent destroy)
			button_box.extend (ok_button)
			button_box.disable_item_expand (ok_button)
			button_box.set_padding (10)
			main_vertical_box.extend (button_box)
			main_vertical_box.disable_item_expand (button_box)
			extend (main_vertical_box)
			set_default_push_button (ok_button)
			set_default_cancel_button (cancel_button)
			
				-- set dialog options
			close_request_actions.extend (agent destroy)
		end

feature {NONE} -- Implementation
	
	ok_button: EV_BUTTON
	cancel_button: EV_BUTTON
	
	content: EV_VERTICAL_BOX
	
	on_ok is
			-- called when ok is clicked
		deferred
		end
		

end -- class SETTINGS_DIALOG
