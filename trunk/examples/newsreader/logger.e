indexing
	description: "Class that provides access to a global logfile"
	author: "Martin Luder"
	date: "$Date$"
	revision: "$Revision$"

class
	LOGGER


feature -- Logging
	
	logfile: LOGFILE
			-- logfile of the application

	load_logfile is
			-- create logfile
		do
			create logfile.make_filename ("newsreader.log")
			logfile.set_threshold (logfile.Developer)
		end

end -- class LOGGER
