indexing
	description: "Reverse sort feed by title."
	author: "Thomas Weibel"
	date: "$Date$"
	revision: "$Rev$"

class
	FEED_REVERSE_SORT_BY_DESCRIPTION[G -> FEED]
	
inherit
	ORDER_RELATION[G]

feature -- Criterion

	ordered (first, second: G): BOOLEAN is
			-- Are `first' and `second' ordered (true if `first' > `second')
		require else
			first_non_void: first /= Void
			second_non_void: second /= Void
		do
			Result := first.description > second.description
		end

end -- class FEED_REVERSE_SORT_BY_DESCRIPTION
