indexing
	description: "Sort category by title."
	author: "Thomas Weibel"
	date: "$Date$"
	revision: "$Rev$"

class
	CATEGORY_SORT_BY_TITLE[G -> CATEGORY]
	
inherit
	ORDER_RELATION[G]

feature -- Criterion

	ordered (first, second: G): BOOLEAN is
			-- Are `first' and `second' ordered (true if `first' < `second')
		require else
			first_non_void: first /= Void
			second_non_void: second /= Void
		do
			Result := first.title < second.title
		end

end -- class CATEGORY_SORT_BY_TITLE
