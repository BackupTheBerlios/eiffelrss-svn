indexing
	description: "Objects that ..."
	author: ""
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

end -- class ERROR_WRITER
