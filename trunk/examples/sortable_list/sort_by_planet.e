indexing
	description: "Sort address by planet."
	author: "Thomas Weibel"
	date: "$Date$"
	revision: "$Rev$"

class
	SORT_BY_PLANET[G -> ADDRESS]
	
inherit
	ORDER_RELATION[G]

feature -- Criterion

	ordered (first, second: G): BOOLEAN is
			-- Are `first' and `second' ordered (true if `first' < `second')
		do
			Result := first.planet < second.planet
		end

end -- class SORT_BY_PLANET
