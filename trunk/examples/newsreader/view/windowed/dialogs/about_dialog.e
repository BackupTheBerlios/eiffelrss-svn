indexing
	description: "About dialog box"
	author: "Martin Luder"
	date: "$Date: 2005/1/13 18:10:25 $"
	revision: "1.0.0"

class 
	ABOUT_DIALOG

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
		end

create 
	default_create

feature {NONE} 

	initialize is
		local
			main_horizontal_box: EV_HORIZONTAL_BOX
			left_vertical_box: EV_VERTICAL_BOX
			right_vertical_box: EV_VERTICAL_BOX
			horizontal_separator: EV_HORIZONTAL_SEPARATOR
			buttons_box: EV_HORIZONTAL_BOX
			ev_cell: EV_CELL
		do
			make
			Precursor
			create pixmap
			pixmap.copy ((create {EV_STOCK_PIXMAPS}).information_pixmap)
			pixmap.set_minimum_size (pixmap.width, pixmap.height)
			create message_label
			message_label.align_text_left
			create horizontal_separator
			create ok_button.make_with_text (button_ok_item)
			ok_button.set_minimum_size (75, 24)
			ok_button.select_actions.extend (agent destroy)
			create buttons_box
			buttons_box.extend (create {EV_CELL})
			buttons_box.extend (ok_button)
			buttons_box.disable_item_expand (ok_button)
			create left_vertical_box
			left_vertical_box.set_border_width (7)
			left_vertical_box.extend (pixmap)
			left_vertical_box.disable_item_expand (pixmap)
			left_vertical_box.extend (create {EV_CELL})
			create right_vertical_box
			right_vertical_box.set_padding (7)
			right_vertical_box.extend (message_label)
			right_vertical_box.extend (horizontal_separator)
			right_vertical_box.disable_item_expand (horizontal_separator)
			right_vertical_box.extend (buttons_box)
			right_vertical_box.disable_item_expand (buttons_box)
			create main_horizontal_box
			main_horizontal_box.set_border_width (7)
			create ev_cell
			ev_cell.set_minimum_width (21)
			main_horizontal_box.extend (ev_cell)
			main_horizontal_box.disable_item_expand (ev_cell)
			main_horizontal_box.extend (left_vertical_box)
			main_horizontal_box.disable_item_expand (left_vertical_box)
			create ev_cell
			ev_cell.set_minimum_width (28)
			main_horizontal_box.extend (ev_cell)
			main_horizontal_box.disable_item_expand (ev_cell)
			main_horizontal_box.extend (right_vertical_box)
			extend (main_horizontal_box)
			set_default_push_button (ok_button)
			set_default_cancel_button (ok_button)
			set_title (default_title)
			set_message (default_message)
			set_size (400, 150)
		end
	
feature 

	message: STRING is
		do
			Result := message_label.text
		end
	
feature 

	set_message (a_message: STRING) is
		do
			message_label.set_text (a_message)
		end
	
feature {NONE} 

	message_label: EV_LABEL

	pixmap: EV_PIXMAP

	ok_button: EV_BUTTON
	
feature {NONE} 

	Default_title: STRING is "About Dialog"

	Default_message: STRING is "YourCompany (R) newsreader%NVersion 1.0%N%NCopyright (C) 2001 YourCompany"
	
end -- class ABOUT_DIALOG
