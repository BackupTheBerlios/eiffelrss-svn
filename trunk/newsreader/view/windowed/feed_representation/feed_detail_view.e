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
			create title
			create description
			create date
			
				-- test
			set_label_text ("Feed Detail View")
			title.fill (<<"title1","title2","title3">>)
			description.fill (<<"description1","description2","description3">>)
			date.fill (<<"yesterday","today","the day after tomorrow">>)
			list.extend (title)
			list.extend (description)
			list.extend (date)
			extend (list)
			list.set_column_titles (<<Feed_detail_view_title_column,Feed_detail_view_description_column,Feed_detail_view_date_column >>)
			list.set_column_width (300, list.index_of (description, 1))
			
			set_minimum_height (200)
			list.set_minimum_width (250)
			list.set_column_widths (<<100,100,50>>)
			
			list.enable_multiple_selection
			list.resize_actions.extend (agent on_resize)
		end

feature
	
	show_feed (f: ANY) is
			-- 
		require
			f_not_void: f /= void
		do
			
		end


feature {NONE} -- Implementation

	list: EV_MULTI_COLUMN_LIST
	title, description, date: EV_MULTI_COLUMN_LIST_ROW
		
	on_resize (x,y,w,h: INTEGER) is
			-- called on resize of list
		local
			title_width, description_width, date_width: INTEGER
		do
			title_width := list.column_width (list.index_of (title, 1))
			description_width := list.column_width (list.index_of (description, 1))
			date_width := list.column_width (list.index_of (date, 1))
			list.set_column_width (title_width, list.index_of (title, 1))
			list.set_column_width (w-title_width-date_width, list.index_of (description, 1))
			list.set_column_width (date_width, list.index_of (date, 1))
		end
		
end -- class FEED_DETAIL_VIEW
