indexing
	description: "Objects that ..."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	RSS_2_0_READER

inherit
	READER_DEF
	
feature -- Access

	get_name: STRING is
			-- Return format name
	do
		Result := "RSS 2.0"
	end

feature -- Operations

	read (a_document: XM_DOCUMENT): FEED is
			-- Parse the document
	do
		
	end
		

end -- class RSS_2_0_READER
