indexing
	description: "Reverse sort item by link."
	author: "Thomas Weibel"
	date: "$Date$"
	revision: "$Rev$"

class
	ITEM_REVERSE_SORT_BY_LINK[G -> ITEM]
	
inherit
	ORDER_RELATION[G]

feature -- Criterion

	ordered (first, second: G): BOOLEAN is
			-- Are `first' and `second' ordered (true if `first' > `second')
		do
			if first.link = Void then
				Result := False
			elseif second.link = Void then
				Result := True
			else
				Result := first.link.location > second.link.location
			end
		end

end -- class ITEM_REVERSE_SORT_BY_LINK
