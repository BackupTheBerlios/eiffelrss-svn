indexing
	description: "Application interfaces"
	author: "Martin Luder"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	APPLICATION_DISPLAYER

inherit
	APP_REF
		undefine
			default_create,
			copy,
			is_equal
		end
		
	INTERFACE_NAMES
		undefine
			default_create,
			copy,
			is_equal
		end
		
feature -- Initialization
	
	make is
		deferred
		end
		
feature -- Output

	information_displayer: INFORMATION_DISPLAYER

end -- class APPLICATION_DISPLAYER
