indexing
	description: "Objects that ..."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	FEED_READER

inherit
	FORMAT_LIST_FACTORY

create
	make_url
	
feature -- Initialization

	make_url (a_url: STRING) is
			-- Create with `a_url' as source of feed
	require
		valid_url: a_url /= Void
	do
		url := a_url
	ensure
		url_set: url = a_url
	end
	
	read: FEED is
			-- Parse the feed
	local
		fetcher: FETCH
		xml_parser: XM_PARSER
		tree_pipe: XM_TREE_CALLBACKS_PIPE		
		error_handler: ERROR_READER
		reader: READER_DEF
	do
		error_handler ?= Format_list.get_reader ("Error")
		reader := error_handler
		
		create fetcher.make_source (url)
		fetcher.fetch

		create tree_pipe.make
		
		if fetcher.error = fetcher.None then
			create {XM_EIFFEL_PARSER} xml_parser.make
			xml_parser.set_string_mode_mixed

			xml_parser.set_callbacks (tree_pipe.start)

			xml_parser.parse_from_string (fetcher.data)
			
			if xml_parser.last_error_description = Void then
				reader := Format_list.get_reader (Format_list.detect_format (tree_pipe.document))				

				if reader.get_name.is_equal ("Error") then
					error_handler ?= reader
					error_handler.add_error ("Unsupported feed format")
				end
			else
				error_handler.add_error (xml_parser.last_error_description)
			end
		else
			if fetcher.error = fetcher.Invalid_address then
				error_handler.add_error ("Invalid Feed Address")
			elseif fetcher.error = fetcher.Transfer_failed then
				error_handler.add_error ("Could not read source data")
			end
		end
		
		if tree_pipe.document = Void then
			Result := reader.read (create {XM_DOCUMENT}.make)
		else
			Result := reader.read (tree_pipe.document)
		end
	end

feature -- Error
	
feature{NONE} -- Implementation
	
	url: STRING
		-- Source of feed
		


end -- class FEED_READER
