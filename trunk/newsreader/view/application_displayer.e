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
		
feature -- Access

	information_displayer: INFORMATION_DISPLAYER
	
feature -- Basic Operations

	show_feed is
			-- show current feed
		deferred
		end
		

invariant
	information_displayer_not_void: information_displayer /= void

end -- class APPLICATION_DISPLAYER
