indexing
	description: "Reverse sort feed by title."
	author: "Thomas Weibel"
	date: "$Date$"
	revision: "$Rev$"

class
	FEED_REVERSE_SORT_BY_LAST_UPDATED[G -> FEED]
	
inherit
	ORDER_RELATION[G]

feature -- Criterion

	ordered (first, second: G): BOOLEAN is
			-- Are `first' and `second' ordered (true if `first' > `second')
		do
			if first.last_updated = Void then
				Result := False
			elseif second.last_updated = Void then
				Result := True
			else
				Result := first.last_updated > second.last_updated
			end
		end

end -- class FEED_REVERSE_SORT_BY_LAST_UPDATED
