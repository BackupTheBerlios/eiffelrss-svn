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
		create_http_url,
		create_http_resource
	end
	
create
	make

feature
	create_http_url: URL is
			-- Create HTTP URL.
		do
			create {FETCH_HTTP_URL} Result.make (address)
		end

	create_http_resource: DATA_RESOURCE is
			-- Create HTTP service.
		local
			u: HTTP_URL
		do
			u ?= url
				check
					type_correct: u /= Void
						-- Because factory has created the right URL type
				end

			create {FETCH_HTTP_PROTOCOL} Result.make (u)
		end

end -- class FETCH_RESOURCE_FACTORY_IMPL
