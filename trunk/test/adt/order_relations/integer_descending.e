indexing
	description: "Sort integers descending."
	author: "Thomas Weibel"
	date: "$Date$"
	revision: "$Rev$"

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
