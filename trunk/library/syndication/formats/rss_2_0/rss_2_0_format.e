indexing
	description: "Implementation of the RSS 2.0 format"
	author: "Michael Käser"
	date: "$Date: 2005-01-27 21:39:23 +0100 (Thu, 27 Jan 2005) $"
	revision: "$Revision: 191 $"

class
	RSS_2_0_FORMAT

inherit
	FORMAT_DEF

feature -- Access

	get_reader: READER_DEF is
	do
		create {RSS_2_0_READER} Result
	end
	
	get_writer: WRITER_DEF is
	do
		create {RSS_2_0_WRITER} Result
	end

	get_name: STRING is
	do
		Result := "RSS 2.0"
	end	
	
	is_of_format (a_document: XM_DOCUMENT): BOOLEAN is
			-- Is this document an RSS 2.0 feed?
	do
		if a_document.root_element.name.is_equal ("rss") then
			if (a_document.root_element.attribute_by_name ("version") /= Void and then a_document.root_element.attribute_by_name ("version").value.is_equal ("2.0")) then
				Result := true
			end
		end
	end
		

end -- class RSS_2_0_FORMAT
