indexing
	description: "Edit dialog box"
	author: "Martin Luder"
	date: "$Date$"
	revision: "$Revision$"

class
	EDIT_DIALOG

inherit
	SETTINGS_DIALOG
		rename
			on_ok as on_edited
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
			
				-- add items
			create label.make_with_text (Edit_name_item + ":")
			label.align_text_left
			label.set_minimum_width (50)
			create hbox
			hbox.extend (label)
			hbox.disable_item_expand (label)
			create name
			name.set_minimum_width_in_characters (15)
			hbox.extend (name)
			content.extend (hbox)
			content.disable_item_expand (hbox)
			create label.make_with_text (Edit_address_item + ":")
			label.align_text_left
			label.set_minimum_width (50)
			create hbox
			hbox.extend (label)
			hbox.disable_item_expand (label)
			create address
			address.set_minimum_width_in_characters (15)
			hbox.extend (address)
			content.extend (hbox)
			content.disable_item_expand (hbox)
			
			
				-- set dialog options
			set_title (Edit_title + " $NAME_OF_FEED")
		end

feature {NONE} -- Implementation

	on_edited is
			-- called when ok is clicked
		do
			if not address.text.is_empty and not name.text.is_empty then
				destroy
			end
		end
	
	name: EV_TEXT_FIELD
	address: EV_TEXT_FIELD
	delete_items: EV_CHECK_BUTTON
end -- class EDIT_DIALOG
