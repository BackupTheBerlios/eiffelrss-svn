indexing
	description: "Class to represent channel or item categories."
	author: "Thomas Weibel"
	date: "$Date$"
	revision: "$Rev$"

class
	CATEGORY_LIST
	
inherit
	LINKED_LIST[CATEGORY]
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

end -- class CATEGORY_LIST
