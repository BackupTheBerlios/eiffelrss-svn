indexing
	description: "Class that provides access to a global logfile"
	author: "Martin Luder"
	date: "$Date$"
	revision: "$Revision$"

class
	LOGGER
	
create
	load_logfile

feature -- Logging
	
	logfile: LOGFILE
			-- logfile of the application

	load_logfile is
			-- create logfile
		do
			create logfile.make_filename ("newsreader.log")
			logfile.set_threshold (logfile.Developer)
		end

invariant
	logfile_not_void: logfile /= void
end -- class LOGGER
