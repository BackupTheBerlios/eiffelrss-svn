indexing
	description: "Class to represent a collection of feeds."
	author: "Thomas Weibel"
	date: "$Date$"
	revision: "$Rev$"

class
	FEED_MANAGER

inherit
	HASH_TABLE[FEED,URL]
	rename
		make as make_with_size
	export {NONE}
		make_with_size
	end
	
create
	make, make_custom
	
feature -- Initialization

	make is
			-- Create a new feed manager with default refresh period `30'
		do
			make_with_size (10)
			set_default_refresh_period (30)
		end
		
	make_custom (a_refresh_period: INTEGER) is
			-- Create a new feed manager with default refresh period `a_refresh_period'
		require
			default_refresh_period_positive: a_refresh_period >= 0
		do
			make_with_size (10)
			set_default_refresh_period (default_refresh_period)
		end
		
feature -- Access

	default_refresh_period: INTEGER
			-- Default refresh period in minutes

feature -- Setter

	set_default_refresh_period (a_refresh_period: INTEGER) is
			-- Set refresh periode in minutes
		require
			default_refresh_period_positive: a_refresh_period >= 0
		do
			default_refresh_period := a_refresh_period
		ensure
			default_refresh_period_set: default_refresh_period = a_refresh_period
		end
		
invariant
	default_refresh_period_positive: default_refresh_period >= 0

end -- class FEED_MANAGER
