indexing
	description: "Sort address by phone number."
	author: "Thomas Weibel"
	date: "$Date$"
	revision: "$Rev$"

class
	SORT_BY_PHONE_NUMBER[G -> ADDRESS]
	
inherit
	ORDER_RELATION[G]

feature -- Criterion

	ordered (first, second: G): BOOLEAN is
			-- Are `first' and `second' ordered (true if `first' < `second')
		do
			Result := first.phone_number < second.phone_number
		end

end -- class SORT_BY_PHONE_NUMBER
