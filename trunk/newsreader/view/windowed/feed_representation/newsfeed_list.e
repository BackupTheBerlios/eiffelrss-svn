indexing
	description: "Objects that show a list of FEEDs in an EV_LIST"
	author: "Martin Luder"
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
			make
			create list
			
				-- test
			set_label_text ("Newsfeed List")
--			create i.make_with_text ("feed1")
--			list.extend (i)
--			create i.make_with_text ("feed2")
--			list.extend (i)
--			create i.make_with_text ("feed3")
--			list.extend (i)
			
			extend (list)
			set_minimum_width (150)
			set_minimum_height (200)
		end

feature -- Basic Operations

	selected_feed: FEED is
			-- selected feed in list
		do
			
		end
	
	display_list is
			-- display list of feeds
		local
			l_item: EV_LIST_ITEM
		do
			from
				application.feed_manager.start
			until
				application.feed_manager.after
			loop
				create l_item.make_with_text (application.feed_manager.item_for_iteration.title)
				list.extend (l_item)
			end
		end
		

feature -- Access

	has_list_focus: BOOLEAN is
			-- has list focus?
		do
			Result := list.has_focus
		end
		
	
feature {NONE} -- Implementation
	
	list: EV_LIST

end -- class NEWSFEED_LIST
