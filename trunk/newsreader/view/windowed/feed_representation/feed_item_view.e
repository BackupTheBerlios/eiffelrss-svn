indexing
	description: "Objects that ..."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	FEED_ITEM_VIEW

inherit
	EV_MULTI_COLUMN_LIST_ROW
		redefine
			initialize
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
	make_with_item
	
feature -- Initialization

	make_with_item (an_item: ITEM) is
			-- create row with an_item
		require
			an_item_not_void: an_item /= void
		do
			make_app_ref
			feed_item := an_item
			default_create
		end
	
	initialize is
		local
			date: STRING
		do
			Precursor
			if (feed_item.pub_date /= void) then
				date := feed_item.pub_date.formatted_out (application.properties.get ("Date_format"))
			else
				date := ""
			end
			fill (<<feed_item.title, feed_item.description, date>>)
			pointer_double_press_actions.extend (agent on_double_click)
		end
		

feature -- Events

	on_double_click (a,b,c: INTEGER; d,e,f: DOUBLE; g,h: INTEGER) is
			-- called when double clicked on item
		do
			application.logfile.log_message ("FEED_ITEM_VIEW: item double clicked, opening '" + feed_item.link.location + "'", feature {LOGFILE}.developer)
			open_url (feed_item.link, true)
		end
		

feature -- Access

	feed_item: ITEM
	

invariant
	feed_item_not_void: feed_item /= void
		
end -- class FEED_ITEM_VIEW
