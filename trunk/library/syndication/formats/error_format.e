indexing
	description: "Objects that ..."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ERROR_FORMAT

inherit
	FORMAT_DEF
	
feature -- Access

	get_reader: READER_DEF is
	do
		create {ERROR_READER} Result
	end
	
	get_writer: WRITER_DEF is
	do
		create {ERROR_WRITER} Result
	end

	get_name: STRING is
	do
		Result := "Error"
	end	
	
	is_of_format (a_document: XM_DOCUMENT): BOOLEAN is
		-- No document can be an error document
	do
	ensure then
		not_possible: Result = false
	end

end -- class ERROR_FORMAT
