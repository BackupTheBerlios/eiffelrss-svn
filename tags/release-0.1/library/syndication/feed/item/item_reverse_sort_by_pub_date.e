indexing
	description: "Reverse sort item by publication date."
	author: "Thomas Weibel"
	date: "$Date$"
	revision: "$Rev$"

class
	ITEM_REVERSE_SORT_BY_PUB_DATE[G -> ITEM]
	
inherit
	ORDER_RELATION[G]

feature -- Criterion

	ordered (first, second: G): BOOLEAN is
			-- Are `first' and `second' ordered (true if `first' > `second')
		do
			if first.pub_date = Void then
				Result := False
			elseif second.pub_date = Void then
				Result := True
			else
				Result := first.pub_date > second.pub_date
			end
		end

end -- class ITEM_REVERSE_SORT_BY_PUB_DATE
