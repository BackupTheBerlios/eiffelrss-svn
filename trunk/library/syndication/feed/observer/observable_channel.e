indexing
	description: "Deferred class which defines an observable channel interface."
	author: "Thomas Weibel"
	date: "$Date$"
	revision: "$Rev$"

deferred class
	OBSERVABLE_CHANNEL
	
feature -- Access

	observers: TWO_WAY_LIST[CHANNEL_OBSERVER]
			-- List of subscribed observers

feature -- Setter

	set_observers (observer_list: like observers) is
			-- List of subscribed observers
		require
			non_void_observers: observer_list /= Void
		do
			observers := observer_list
		ensure
			observers_set: observers = observer_list
		end

feature -- Status

	has_observers: BOOLEAN is
			-- Is `observers' set?
		do
			Result := observers.count > 0
		end

feature -- Basic operations

	add_observer (an_observer: CHANNEL_OBSERVER) is
			-- Add an observer
		require
			non_void_observer: an_observer /= Void
		do
			observers.extend (an_observer)
		ensure
			one_more_observer: observers.count = old observers.count + 1
			observer_added: observers.i_th (observers.count) = an_observer			
		end
		
	remove_observer (an_observer: CHANNEL_OBSERVER) is
			-- Remove an observer
		require
			non_void_observer: an_observer /= Void		
		do
			observers.start
			observers.prune (an_observer)
		end

feature{CHANNEL_OBSERVABLE} -- Observable

	notify_item_added (an_item: ITEM) is
			-- Notify observers that an item has been added
		require
			non_void_item: an_item /= Void
		do
			from
				observers.start
			until
				observers.after
			loop
				observers.item.item_added (an_item)
				observers.forth
			end
		end
		
	notify_channel_updated (channel: CHANNEL) is
			-- Notify observers that the channel has been updated
		require
			non_void_channel: channel /= Void
		do
			from
				observers.start
			until
				observers.after
			loop
				observers.item.channel_updated (channel)
				observers.forth
			end			
		end

feature {CHANNEL_OBSERVABLE} -- Initialize `observers'

	initialize_observers is
			-- Initialize `observers'
		do
			create observers.make
			observers.compare_objects
		end

invariant
	non_void_observers: observers /= Void

end -- class OBSERVABLE_CHANNEL
