indexing
	description: "Class to represent channel items."
	author: "Thomas Weibel"
	date: "$Date$"
	revision: "$Rev$"

class
	ITEM_LIST
	
inherit
	LINKED_LIST[ITEM]
	redefine
		make
	end
	
create
	make
	
feature -- Initialization

	make is
			-- Call precursor
		do
			Precursor {LINKED_LIST}
		end
		
feature -- Sort

	-- TODO

end -- class ITEM_LIST
