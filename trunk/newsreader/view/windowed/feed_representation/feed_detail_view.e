indexing
	description: "Objects that show feed items in an EV_MULTI_COLUMN_LIST"
	author: "Martin Luder"
	date: "$Date$"
	revision: "$Revision$"

class
	FEED_DETAIL_VIEW

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
		do
			Precursor {INFORMATION_PANEL}
			
			create list
			
				-- test
			set_label_text ("Feed Detail View")
			extend (list)
			list.set_column_titles (<<Feed_detail_view_title_column,Feed_detail_view_description_column,Feed_detail_view_date_column >>)
			
			set_minimum_height (200)
			list.set_minimum_width (250)
			list.set_column_widths (<<100,100,50>>)
			
			list.enable_multiple_selection
			list.resize_actions.extend (agent on_resize)
			
			list.column_title_click_actions.extend (agent on_column_title_click)

		end

feature -- Basic operations
	
	display_feed (f: FEED) is
			-- display feed in widget
		require
			f_not_void: f /= void
		do
			feed := f
			
			from
				feed.items.start
			until
				feed.items.after
			loop
				list.extend (create {FEED_ITEM_VIEW}.make_with_item (feed.items.item))
				feed.items.forth
			end
		end
	
	selected_item: ITEM is
			-- selected item in list
		local
			item_view: FEED_ITEM_VIEW
			item_row: EV_MULTI_COLUMN_LIST_ROW
		do
			item_view ?= list.selected_item
			item_row := list.selected_item
			if item_view /= void then
				Result := item_view.feed_item
			else
				item_view ?= list.first
				if item_view /= void then
					Result := item_view.feed_item
				end
			end
		ensure
			result_void_implies_empty_list: (Result = void) implies list.is_empty
			result_not_void: Result /= void
		end
		

feature -- Events

	on_column_title_click (c: INTEGER) is
			-- called when column title clicked
		require
			valid_index: c > 0 and c <= 3
		do
			inspect
				c
			when 1 then
				application.logfile.log_message ("FEED_DETAIL_VIEW: sorting after names", feature {LOGFILE}.developer)
				feed.sort_items_by_title
				feed.items.sort
			when 3 then
				application.logfile.log_message ("FEED_DETAIL_VIEW: sorting after date", feature {LOGFILE}.developer)
				feed.sort_items_by_pub_date
				feed.items.sort
			else
				
			end
			list.wipe_out
			display_feed (feed)
		end
		

feature {NONE} -- Implementation

	list: EV_MULTI_COLUMN_LIST
	
	feed: FEED
		
	on_resize (x,y,w,h: INTEGER) is
			-- called on resize of list
		local
			title_width, description_width, date_width: INTEGER
		do
			title_width := list.column_width (1)
			description_width := list.column_width (1)
			date_width := list.column_width (1)
			list.set_column_width (title_width, 1)
			list.set_column_width (w-title_width-date_width, 2)
			list.set_column_width (date_width, 3)
		end
		
end -- class FEED_DETAIL_VIEW
