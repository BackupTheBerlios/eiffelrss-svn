indexing
	description: "Simple observer class which implements the interface of CHANNEL_OBSERVER"
	author: "Thomas Weibel"
	date: "$Date$"
	revision: "$Rev$"

class
	SIMPLE_CHANNEL_OBSERVER

inherit
	CHANNEL_OBSERVER

feature -- Access

	added_item: ITEM
			-- The newly added item
			
	added_channel: CHANNEL
			-- The newly added channel

feature -- Observer

	item_added (new_item: ITEM) is
			-- Is called when a new item is added to this channel
		do
			added_item := new_item
			io.put_string (added_item.to_string)
		ensure then
			added_item_set: added_item = new_item
		end
		
	channel_added (new_channel: CHANNEL) is
			-- Is called when a new channel is added
		do
			added_channel := new_channel
			io.put_string (added_channel.to_string)
		ensure then
			added_channel_set: added_channel = new_channel 
		end
		

end -- class SIMPLE_CHANNEL_OBSERVER
