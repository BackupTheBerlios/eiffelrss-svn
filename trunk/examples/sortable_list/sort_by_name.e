indexing
	description: "Sort address by name."
	author: "Thomas Weibel"
	date: "$Date$"
	revision: "$Rev$"

class
	SORT_BY_NAME[G -> ADDRESS]
	
inherit
	ORDER_RELATION[G]

feature -- Criterion

	ordered (first, second: G): BOOLEAN is
			-- Are `first' and `second' ordered (true if `first' < `second')
		do
			Result := first.name < second.name
		end

end -- class SORT_BY_NAME
