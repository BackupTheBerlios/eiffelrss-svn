indexing
	description: "Objects that ..."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	NEWS_VIEW

inherit
	EV_HORIZONTAL_SPLIT_AREA
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

	WINDOWED_EVENTS
		undefine
			default_create,
			copy,
			is_equal
		end

create
	make

feature -- Initialization

	make is
		do
			make_app_ref
			default_create
		end
	
	initialize is
		do
			Precursor
			set_minimum_width (400)
			create feed_detail_view.make
			create newsfeed_list.make_with_detail_view (feed_detail_view)
			set_first (newsfeed_list)
			set_second (feed_detail_view)
		end

feature --  Basic Operations

	display_feed is
			-- set feed to be shown in detail view
		do
			feed_detail_view.display_feed (application.current_feed)
		end
		

feature {NONE} -- Implementation

	newsfeed_list: NEWSFEED_LIST

	feed_detail_view: FEED_DETAIL_VIEW

end -- class NEWS_VIEW
