indexing
	description: "Objects that ..."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	FEED_VIEW

inherit
	EV_LIST_ITEM
		redefine
			initialize,
			is_in_default_state
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
	make_with_feed
	
feature -- Initialization

	make_with_feed (a_feed_url: STRING) is
			-- create item with a_feed
		require
			a_feed_url_not_void: a_feed_url /= void
		do
			make_app_ref
			feed_url := a_feed_url
			feed := application.feed_manager.item (a_feed_url)
			default_create
		end
	
	initialize is
			-- 
		do
			Precursor
			set_text (feed.title)
			select_actions.extend (agent on_click)
		end
	
	is_in_default_state: BOOLEAN is true
		
		
feature -- Events

	on_click is
			-- called when clicked on feed
			-- show feed items in detail view
		local
			mw: MAIN_WINDOW
		do
			application.logfile.log_message ("NEWSFEED_LIST: feed clicked", feature {LOGFILE}.Developer)
			application.set_current_feed_url (feed_url)
			
			mw ?= application.application_displayer
			if mw /= void then
				mw.show_feed
			end
		end


feature -- Access

	feed: FEED
	feed_url:STRING
		
invariant
	feed_not_void: feed /= void
	url_not_void: feed_url /= void

end -- class FEED_VIEW
