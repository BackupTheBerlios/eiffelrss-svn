indexing
	description: "Objects that have a reference to {EV_ENRIRONMENT}.application"
	author: "Martin Luder"
	date: "$Date$"
	revision: "$Revision$"

class
	APP_REF
	
create
	make

feature -- Initialization

	make is
			-- set application reference
		do
			application ?= (create {EV_ENVIRONMENT}).application
		ensure
			application_set: application = (create {EV_ENVIRONMENT}).application
		end
		
feature {NONE} -- Implementation
	
	application: APPLICATION
			-- reference to application

invariant
	app_not_void: application /= void
end -- class APPLICATION_REFERENCE
