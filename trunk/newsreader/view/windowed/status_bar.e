indexing
	description: "Objects that ..."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	STATUS_BAR

inherit
	INFORMATION_DISPLAYER
		undefine
			default_create,
			copy,
			is_equal
		redefine
			make
		end
	
	EV_STATUS_BAR
		redefine
			initialize
		end

create
	make,
	make_with_text

feature -- Initialization

	make is
			-- creation procedure
		do
			Precursor {INFORMATION_DISPLAYER}
			default_create
		end
	
	initialize is
		do
			Precursor
			set_border_width (2)
			
			create main_label
			main_label.align_text_left
			extend (main_label)
		end
		

feature {NONE} -- Implementation

	show_current is
			-- update status bar to current message
		do
			main_label.set_text (current_text)
		end
		
	main_label: EV_LABEL
		

end -- class STATUS_BAR
