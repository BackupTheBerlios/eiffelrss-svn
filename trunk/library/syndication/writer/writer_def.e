indexing
	description: "Objects that ..."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	WRITER_DEF

feature -- Access

	get_name: STRING is
			-- Return a string with the format name
	deferred
	end
	
	write (a_feed: FEED): XM_DOCUMENT is
			-- Export `a_feed' into an xml document
	require
		valid_feed: a_feed /= Void
	deferred
	ensure
		valid_result: Result /= Void
	end
		

end -- class WRITER_DEF
