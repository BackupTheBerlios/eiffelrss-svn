indexing
	description: "Deferred class which defines a channel observer interface."
	author: "Thomas Weibel"
	date: "$Date$"
	revision: "$Rev$"

deferred class
	CHANNEL_OBSERVER
	
feature -- Observer

	item_added (new_item: ITEM) is
			-- Is called when a new item is added to this channel
		require
			non_void_item: new_item /= Void
		deferred
		end
		
	channel_updated (channel: CHANNEL) is
			-- Is called when a new channel is added
		deferred
		end

end -- class CHANNEL_OBSERVER
