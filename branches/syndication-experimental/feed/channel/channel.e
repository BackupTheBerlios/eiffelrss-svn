indexing
	description: "Class to represent a feed channel."
	author: "Thomas Weibel"
	date: "$Date$"
	revision: "$Rev$"

class
	CHANNEL
	
inherit
	CATEGORIES
	
create
	make
	
feature -- Initialization

	make (a_title: STRING; a_link: URL; a_description: STRING) is
			--  Create a channel with title, link and description
		require
			non_empty_title: a_title /= Void and then not a_title.is_empty
			non_void_link: a_link /= Void
			non_empty_description: a_description /= Void and then not a_description.is_empty
		do
			
		end
		
feature -- Access

	title: STRING
			-- Channel title
	
	link: URL
			-- Channel link
			
	description: STRING
			-- Channel description
			
	language: STRING
			-- Channel language
			
	copyright: STRING
	
	
	managing_editor: STRING
	
	
	web_master: STRING
	
	
	pub_date: DATE_TIME
	
	
	last_build_date: DATE_TIME
	
	
	feed_generator: STRING
	
	
	docs: URL
	
	
	cloud: CLOUD
	
	
	ttl: INTEGER
	
	
	image: IMAGE
	
	
	text_input: TEXT_INPUT
	
	
	skip_hours: HASH_TABLE[INTEGER, INTEGER]
	
	
	skip_days: HASH_TABLE[STRING, STRING]
	
	
	items: ITEM_LIST
	
			
feature -- Access (RSS 0.91)

	rating: STRING

feature -- Access (RSS 1.0)

	items_toc: LINKED_LIST[STRING]


	textinput: URL

feature -- Access (metadata)

	format: CHANNEL_FORMAT
			-- Format of the channel.

	observers: LINKED_LIST[CHANNEL_OBSERVER]
			-- List of subscribed observers

-- feature -- Access (modules)
-- The possiblity to add and remove modules to an item would be very nice to 
-- have, but doesn't have a very high priority at the moment
--
--	modules: HASH_TABLE[MODULE_DEF, STRING]
--			-- Hashtable containing various optional modules

feature -- Setter



feature -- Setter (RSS 0.91)



feature -- Setter (RSS 1.0)


		
feature -- Setter (metadata)
		

		
feature -- Debug

	to_string: STRING is
			-- Returns a string representation of source
			-- This feature is especially useful for debugging
		do
			
		end
		
feature {NONE} -- Implementation

	initialization is
			-- Common initialization tasks
		do

		end

invariant
	non_empty_title: title /= Void and then not title.is_empty
	non_void_link: link /= Void
	non_empty_description: description /= Void and then not description.is_empty

end -- class CHANNEL
