indexing
	description: "Objects that ..."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ERROR_READER

inherit
	READER_DEF
	
feature -- Access

	get_name: STRING is
			-- Return the format
	once
		Result := "Error"
	end
	
	read (a_document: XM_DOCUMENT): FEED is
			-- Create a feed with error message
	do
		
	end
	
	errors:	LIST [STRING]
	
	has_errors: BOOLEAN is
			-- Has an error occured?
	do
		Result := not errors.is_empty
	end
		

feature -- Basic operations

	add_error (a_error: STRING) is
			-- Add `a_error' to the error messages
	require
		valid_error: a_error /= Void
	do
		errors.extend (a_error)
	ensure
		errors.count = old errors.count + 1
	end
		

end -- class ERROR_READER
