indexing
	description: "Objects that provide a general layout for representation of lists and tables"
	author: "Martin Luder"
	date: "$Date$"
	revision: "$Revision$"

class
	INFORMATION_PANEL

inherit
	EV_VERTICAL_BOX

	WINDOWED_INTERFACE_NAMES
		export
			{NONE} all
		undefine
			default_create, copy, is_equal
		end
		
	APP_REF
		undefine
			default_create,
			copy,
			is_equal
		end

	WINDOWED_EVENTS
		undefine
			default_create,
			copy,
			is_equal
		end
		
create
	make

feature -- Initialisation
	
	make is
			-- creation procedure
		local
			font: EV_FONT
			cell: EV_CELL
		do
			default_create
			make_app_ref
			
				-- create label
			create label
			label.set_minimum_height (20)
			label.align_text_left
			create font
			font.set_weight (8)
			label.set_font (font)
			create label_box
			create cell
			cell.set_minimum_width (20)
			label_box.extend (cell)
			label_box.disable_item_expand (cell)
			label_box.extend (label)
			extend (label_box)
			disable_item_expand (label_box)
		end
		
		
	
feature {NONE} -- Implementation
	
	label_box: EV_HORIZONTAL_BOX
	
	label: EV_LABEL
	
	set_label_text (text: STRING) is
			-- set the text of the label to 'text'
		require
			text_not_void: text /= void
		do
			label.set_text (text)
		end
		
		

end -- class INFORMATION_PANEL
