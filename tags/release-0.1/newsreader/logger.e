indexing
	description: "Class that provides access to a global logfile"
	author: "Martin Luder"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	LOGGER

feature -- Logging
	
	logfile: LOGFILE
			-- logfile of the application

	create_log is
			-- create logfile
		deferred
		end

invariant
	logfile_not_void: logfile /= void
end -- class LOGGER
