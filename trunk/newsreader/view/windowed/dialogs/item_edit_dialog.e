indexing
	description: "Objects that ..."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ITEM_EDIT_DIALOG

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
			vbox: EV_VERTICAL_BOX
			label: EV_LABEL
		do
			Precursor
			
			create hbox
			create label.make_with_text (Info_item_title_item + ":")
			label.set_minimum_width (label_width)
			label.align_text_left
			hbox.extend (label)
			hbox.disable_item_expand (label)
			create item_title
			hbox.extend (item_title)
			content.extend (hbox)

			create hbox
			create label.make_with_text (Info_item_description_item + ":")
			label.set_minimum_width (label_width)
			label.align_text_left
			create vbox
			vbox.extend (label)
			vbox.disable_item_expand (label)
			vbox.extend (create {EV_CELL})
			hbox.extend (vbox)
			hbox.disable_item_expand (vbox)
			create description
			description.set_minimum_height (description.height * 2)
			hbox.extend (description)
			content.extend (hbox)

			create hbox
			create label.make_with_text (Info_item_link_item + ":")
			label.set_minimum_width (label_width)
			label.align_text_left
			hbox.extend (label)
			hbox.disable_item_expand (label)
			create link
			hbox.extend (link)
			content.extend (hbox)

			create hbox
			create label.make_with_text (Info_item_author_item + ":")
			label.set_minimum_width (label_width)
			label.align_text_left
			hbox.extend (label)
			hbox.disable_item_expand (label)
			create author
			hbox.extend (author)
			content.extend (hbox)

			create hbox
			create label.make_with_text (Info_item_pub_date_item + ":")
			label.set_minimum_width (label_width)
			label.align_text_left
			hbox.extend (label)
			hbox.disable_item_expand (label)
			create pub_date
			hbox.extend (pub_date)
			content.extend (hbox)
			
			set_minimum_width (300)
			
			
			load
		end

feature {NONE} -- Implementation

	on_edited is
			-- click on ok
		do
			
		end
	
	item_title, description, link, author, pub_date: EV_TEXT_FIELD
	
	label_width: INTEGER is 70
	
	feed_item: ITEM
	
	load is
			-- load information from feed item
		local
			mw: MAIN_WINDOW
		do
			mw ?= application.application_displayer
			if mw /= void then
				feed_item := mw.selected_item
				
				item_title.set_text (feed_item.title)
				description.set_text (feed_item.description)
				link.set_text (feed_item.link.location)
				if feed_item.author /= void then
					author.set_text (feed_item.author)
				end
				if feed_item.pub_date /= void then
					pub_date.set_text (feed_item.pub_date.default_format_string)
				end
				
				
			end
		end
		
		
end -- class ITEM_EDIT_DIALOG
