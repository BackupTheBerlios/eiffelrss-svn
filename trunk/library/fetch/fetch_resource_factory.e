indexing
	description: "Objects that ..."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	FETCH_RESOURCE_FACTORY

inherit
	DATA_RESOURCE_FACTORY
	redefine
		Resource_factory
	end
	
feature
	Resource_factory: DATA_RESOURCE_FACTORY_IMPL is
			-- Singleton of resource factory
		once
			create {FETCH_RESOURCE_FACTORY_IMPL} Result.make
		end

end -- class FETCH_RESOURCE_FACTORY
