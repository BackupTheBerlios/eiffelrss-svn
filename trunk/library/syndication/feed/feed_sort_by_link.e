indexing
	description: "Sort feed by link."
	author: "Thomas Weibel"
	date: "$Date$"
	revision: "$Rev$"

class
	FEED_SORT_BY_LINK[G -> FEED]
	
inherit
	ORDER_RELATION[G]

feature -- Criterion

	ordered (first, second: G): BOOLEAN is
			-- Are `first' and `second' ordered (true if `first' < `second')
		require else
			first_non_void: first /= Void
			second_non_void: second /= Void
		do
			Result := first.link.location < second.link.location
		end

end -- class FEED_SORT_BY_LINK
