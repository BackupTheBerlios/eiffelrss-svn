indexing
	description: "Objects that ..."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	NEWSFEED_LIST

inherit
	INFORMATION_PANEL
		redefine
			make
		end

create
	make
	
feature -- Initialisation

	make is
			-- creation procedure
		local
			i: EV_LIST_ITEM
		do
			Precursor {INFORMATION_PANEL}
			
			create list
			
				-- test
			set_label_text ("Newsfeed List")
			create i.make_with_text ("feed1")
			list.extend (i)
			create i.make_with_text ("feed2")
			list.extend (i)
			create i.make_with_text ("feed3")
			list.extend (i)
			
			extend (list)
			set_minimum_width (150)
		end

feature {NONE}
	
	list: EV_LIST
end -- class NEWSFEED_LIST
