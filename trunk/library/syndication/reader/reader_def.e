indexing
	description: "Objects that ..."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	READER_DEF
	
feature -- Operation

	read (a_document: XM_DOCUMENT): FEED is
			-- Parse the document and return a feed
	require
		valid_doc: a_document /= Void
	deferred
	ensure
		valid_result: Result /= Void
	end

feature -- Access

	get_name: STRING is
			-- Return a string with the format name
	deferred
	end
	
end -- class READER_DEF
