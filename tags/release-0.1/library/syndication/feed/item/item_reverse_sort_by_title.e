indexing
	description: "Reverse sort item by title."
	author: "Thomas Weibel"
	date: "$Date$"
	revision: "$Rev$"

class
	ITEM_REVERSE_SORT_BY_TITLE[G -> ITEM]
	
inherit
	ORDER_RELATION[G]

feature -- Criterion

	ordered (first, second: G): BOOLEAN is
			-- Are `first' and `second' ordered (true if `first' > `second')
		do
			if first.title = Void then
				Result := False
			elseif second.title = Void then
				Result := True
			else
				Result := first.title > second.title
			end
		end

end -- class ITEM_REVERSE_SORT_BY_TITLE
