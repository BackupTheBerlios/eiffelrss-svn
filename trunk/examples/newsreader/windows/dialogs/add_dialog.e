indexing
	description: "Add dialog box"
	author: "Martin Luder"
	date: "$Date$"
	revision: "$Revision$"

class
	ADD_DIALOG

inherit
	SETTINGS_DIALOG
		rename
			on_ok as on_add_feed
		redefine
			initialize
		end

create
	make

feature -- Initialization
	
	initialize is
		local
			hbox: EV_HORIZONTAL_BOX
			label: EV_LABEL
		do
			Precursor
			
			create hbox
			create label.make_with_text (Add_address_item + ":")
			hbox.extend (label)
			hbox.disable_item_expand (label)
			create address
			hbox.extend (address)
			content.extend (hbox)
			content.extend (create {EV_CELL})
			
				-- set dialog options
			set_title (Add_title)

		end

feature {NONE} -- Implementation

	address: EV_TEXT_FIELD
	
	on_add_feed is
			-- called when ok is clicked
		do
			if address.text_length > 0 then
				on_add_feed_from_string (address.text)
			end
			destroy
		end
		
		
end -- class ADD_DIALOG
