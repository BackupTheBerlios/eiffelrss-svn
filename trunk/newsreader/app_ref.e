indexing
	description: "Objects that have a reference to {EV_ENRIRONMENT}.application"
	author: "Martin Luder"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	APP_REF

feature -- Initialization

	make_app_ref is
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
