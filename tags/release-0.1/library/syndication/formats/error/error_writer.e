indexing
	description: "Writer object for error format"
	author: "Michael Käser"
	date: "$Date$"
	revision: "$Revision$"

class
	ERROR_WRITER
	
inherit
	WRITER_DEF

feature -- Access
	get_name: STRING is
			-- Return the format
	once
		Result := "Error"
	end
	
	write (a_feed: FEED): XM_DOCUMENT is
			-- Export `a_feed' into an xml document
	do
	
	end

end -- class ERROR_WRITER
