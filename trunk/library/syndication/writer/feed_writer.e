indexing
	description: "Objects that ..."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	FEED_WRITER
	
inherit
	FORMAT_LIST_FACTORY
	
create
	make_feed
	
feature -- Initialisation

	make_feed (a_feed: FEED) is
		-- Create a writer object for the feed `a_feed'
	require
		valid_feed: a_feed /= Void
	do
		feed := a_feed
		error := None
	ensure
		feed_set: feed = a_feed
		no_error: error = None
	end
	
	write (target, format: STRING) is
			-- Write the feed to a local file in the format `format'
	require
		valid_target: target /= Void
	local
		file: PLAIN_TEXT_FILE
		formatter: XM_FORMATTER
		document: XM_DOCUMENT
		writer: WRITER_DEF
	do
		create file.make_open_write (target)
		
		if file.is_open_write then
			writer := Format_list.get_writer (format)
			if writer.get_name.is_equal ("Error") then
				error := Invalid_format
			else
				document := writer.write
			end
		else
			error := Invalid_target
		end
	end
		
feature -- Status
	error: INTEGER
	
	None, Invalid_target, Invalid_format: INTEGER is unique

feature{NONE} -- Implementation

	feed: FEED
		-- The feed object
		

end -- class FEED_WRITER
