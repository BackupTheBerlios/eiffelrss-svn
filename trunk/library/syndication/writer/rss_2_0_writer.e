indexing
	description: "Objects that ..."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	RSS_2_0_WRITER

inherit
	WRITER_DEF

feature -- Access

	get_name: STRING is
			-- Return format name
	do
		Result := "RSS 2.0"
	end

end -- class RSS_2_0_WRITER
