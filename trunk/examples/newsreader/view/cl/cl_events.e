indexing
	description: "Objects that ..."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	CL_EVENTS

inherit
	COMMON_EVENTS
	
feature -- Events / new

	on_exit is
			-- called when exit requested
		do
			is_exit_requested := true
		end
	
	on_help is
			-- called when help is requested
		do
			
		end

feature -- Events / redefined

	on_edit is
		do
			
		end
	
	on_preferences is
		do
			
		end
		
	on_about is
		do
			
		end
	
	on_add is
		do
			
		end
		
		
		
		
feature -- Access
	
	is_exit_requested: BOOLEAN
		
end -- class CL_EVENTS
