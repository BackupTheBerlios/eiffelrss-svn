indexing
	description: "Base class for format objects"
	author: "Michael Käser"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	FORMAT_DEF

feature{FORMAT_LIST} -- Access
	
	get_reader: READER_DEF is
			-- Return a reader object
	deferred
	ensure
		valid_result: Result /= Void
	end

	get_writer: WRITER_DEF is
			-- Return a writer object
	deferred
	ensure
		valid_result: Result /= Void
	end

	get_name: STRING is
			-- Return the format name
	deferred
	ensure
		valid_result: Result /= Void
	end
	
	is_of_format (a_document: XM_DOCUMENT): BOOLEAN is
			-- Is this document a feed of our type?
	deferred
	end	
	
end -- class FORMAT_DEF
