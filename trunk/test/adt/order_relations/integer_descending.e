indexing
	description: "Sort integers descending."
	author: "Thomas Weibel"
	date: "$Date: 2005-01-24 14:46:28 +0100 (Mon, 24 Jan 2005) $"
	revision: "$Rev: 148 $"

class
	INTEGER_DESCENDING[G -> INTEGER]
	
inherit
	ORDER_RELATION[G]

feature -- Criterion

	ordered (first, second: G): BOOLEAN is
			-- Are `first' and `second' ordered (true if `first' > `second')
		require else
			first_non_void: first /= Void
			second_non_void: second /= Void
		do
			Result := first > second
		end

end -- class INTEGER_DESCENDING
