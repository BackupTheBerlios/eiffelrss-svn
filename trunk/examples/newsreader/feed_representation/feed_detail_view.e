indexing
	description: "Objects that ..."
	author: ""
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
			
		end

feature {NONE}

		list: EV_MULTI_COLUMN_LIST
		title, description, date: EV_MULTI_COLUMN_LIST_ROW
		
end -- class FEED_DETAIL_VIEW
