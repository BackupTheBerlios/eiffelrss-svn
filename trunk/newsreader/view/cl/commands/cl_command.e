indexing
	description: "Objects that ..."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	CL_COMMAND

inherit
	
	CL_EVENTS
	
feature -- Initialization

	make (args: LIST[STRING]) is
			-- 
		require
			args_not_void: args /= void
		do
			make_app_ref
		end

end -- class CL_COMMAND
