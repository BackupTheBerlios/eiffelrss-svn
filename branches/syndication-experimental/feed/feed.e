indexing
	description: "Class to represent a feed. Mainly an interface class to channel, item and category."
	author: "Thomas Weibel"
	date: "$Date$"
	revision: "$Rev$"

class
	FEED
	
create
	make, make_from_channel
	
feature -- Initialization

	make (a_title: STRING; a_link: URL; a_description: STRING) is
			-- Create a new feed with title, link and description
		require
			non_empty_title: a_title /= Void and then not a_title.is_empty
			non_void_link: a_link /= Void
			non_empty_description: a_description /= Void and then not a_description.is_empty
		do
			
		end
		
	make_from_channel (a_channel: CHANNEL) is
			-- Create a new feed from an existing channel
		require
			non_void_channel: a_channel /= Void
		do
			
		end
		
feature -- Access

	title: STRING
			-- Feed title
	
	link: URL
			-- Feed link
			
	description: STRING
			-- Feed description
			
	channel: CHANNEL
			-- Feed channel
			
	last_added_item: ITEM
			-- The last added channel item

invariant
	non_empty_title: title /= Void and then not title.is_empty
	non_void_link: link /= Void
	non_empty_description: description /= Void and then not description.is_empty
	non_void_channel: channel /= Void

end -- class FEED
