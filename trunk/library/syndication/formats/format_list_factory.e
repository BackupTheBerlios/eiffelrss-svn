indexing
	description: "Singleton pattern factory for FORMAT_LIST"
	author: "Michael Käser"
	date: "$Date$"
	revision: "$Revision$"

class
	FORMAT_LIST_FACTORY
	
feature -- Access

	Format_list: FORMAT_LIST is
			-- Singleton of resource factory
		once
			create Result.make_list
		end

end -- class FORMAT_LIST_FACTORY
