indexing
	description: "Objects that ..."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	FETCH_RESOURCE
	
feature -- Initialisation

	make (a_address: STRING) is
			-- Create with `a_address' as source
		require
			valid_address: a_address /= Void
		deferred
		ensure
			url_set: url /= Void
		end
		
feature -- Basic operations

	fetch: STRING is
			-- Fetch the data
		require
			valid_url: url /= Void
		deferred
		ensure
			valid_result: Result /= Void
		end
	
feature -- Access

	url: URL
	-- The URL to fetch from

end -- class FETCH_RESOURCE
