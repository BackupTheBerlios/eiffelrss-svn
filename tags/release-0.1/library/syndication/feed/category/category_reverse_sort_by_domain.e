indexing
	description: "Reverse sort category by domain."
	author: "Thomas Weibel"
	date: "$Date$"
	revision: "$Rev$"

class
	CATEGORY_REVERSE_SORT_BY_DOMAIN[G -> CATEGORY]
	
inherit
	ORDER_RELATION[G]

feature -- Criterion

	ordered (first, second: G): BOOLEAN is
			-- Are `first' and `second' ordered (true if `first' > `second')
		do
			if first.domain = Void then
				Result := False
			elseif second.domain = Void then
				Result := True
			else
				Result := first.domain.location > second.domain.location
			end
		end

end -- class CATEGORY_REVERSE_SORT_BY_DOMAIN
