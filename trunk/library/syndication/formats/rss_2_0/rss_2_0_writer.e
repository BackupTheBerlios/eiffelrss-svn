indexing
	description: "Writer object for RSS 2.0"
	author: "Michael Käser"
	date: "$Date$"
	revision: "$Revision: 191 $"

class
	RSS_2_0_WRITER

inherit
	WRITER_DEF

feature -- Access

	get_name: STRING is
			-- Return format name
	do
		Result := "RSS 2.0"
	end

	write (a_feed: FEED): XM_DOCUMENT is
			-- Export `a_feed' into an xml document
	do
	end

end -- class RSS_2_0_WRITER
