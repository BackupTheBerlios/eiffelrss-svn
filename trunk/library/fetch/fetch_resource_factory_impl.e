indexing
	description: "Objects that ..."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	FETCH_RESOURCE_FACTORY_IMPL

inherit
	DATA_RESOURCE_FACTORY_IMPL
	redefine
		create_http_url
	end
	
create
	make

feature
	create_http_url: URL is
			-- Create HTTP URL.
		do
			create {FETCH_HTTP_URL} Result.make (address)
		end

end -- class FETCH_RESOURCE_FACTORY_IMPL
