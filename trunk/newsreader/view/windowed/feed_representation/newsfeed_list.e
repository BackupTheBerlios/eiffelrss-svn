indexing
	description: "Objects that show a list of FEEDs in an EV_LIST"
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	NEWSFEED_LIST

inherit
	INFORMATION_PANEL

create
	make_with_detail_view
	
feature -- Initialisation

	make_with_detail_view (detail_view: FEED_DETAIL_VIEW) is
			-- creation procedure
		local
			i: EV_LIST_ITEM
		do
			feed_detail_view := detail_view
			make
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
			set_minimum_height (200)
		end

feature {NONE} -- Implementation
	
	list: EV_LIST
	
	feed_detail_view: FEED_DETAIL_VIEW
		-- associated detail view

invariant
	detail_view_associated: feed_detail_view /= void
end -- class NEWSFEED_LIST
