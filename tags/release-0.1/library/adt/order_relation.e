indexing
	description: "Objects that may be sorted according to a total order relation."
	author: "Thomas Weibel"
	date: "$Date$"
	revision: "$Rev$"

deferred class ORDER_RELATION[G]

feature -- Criterion

	ordered (first, second: G): BOOLEAN is
			-- Are `first' and `second' ordered (true if `first' < `second')
		deferred
		ensure
			asymmetric: Result implies not (ordered (second, first))
		end
		
	ordered_equal (first, second: G): BOOLEAN is
			-- Are `first' and `second' ordered or equal (true if `first' <= `second').
			-- This feature is implemented with `ordered'
		do
			Result := not ordered (second, first)
		ensure
			definition: Result = ((ordered (first, second)) or ordered_equal (first, second))
		end

end -- class ORDER_RELATION
