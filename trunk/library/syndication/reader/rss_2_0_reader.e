indexing
	description: "Objects that ..."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	RSS_2_0_READER

inherit
	READER_DEF
	
feature -- Access

	get_name: STRING is
			-- Return format name
	do
		Result := "RSS 2.0"
	end

feature -- Operations

	read (a_document: XM_DOCUMENT): FEED is
			-- Parse the document
	local
		channel: XM_ELEMENT
		item_element: XM_ELEMENT
		new_item: ITEM
	do
		-- Create feed with default settings
		create Result.make ("Undefined", create {HTTP_URL}.make ("http://"), "Undefined")

		channel := a_document.root_element.element_by_name ("channel")
		
		if channel /= Void then
			Result.set_title (read_or_default (channel.element_by_name ("title"), "Undefined"))
			Result.set_link (create {HTTP_URL}.make (read_or_default (channel.element_by_name ("link"), "http://")))
			Result.set_description (read_or_default (channel.element_by_name ("description"), "Undefined"))

			if (channel.element_by_name ("lastBuildDate") /= Void) then
				Result.set_last_build_date (read_date(channel.element_by_name ("lastBuildDate").text))
			end
			if (channel.element_by_name ("language") /= Void) then
				Result.set_language (channel.element_by_name ("language").text)
			end
			
			from
				channel.start
			until
				channel.after
			loop
				item_element ?= channel.item_for_iteration
				if item_element /= Void and then item_element.name.is_equal("item") then
					create new_item.make (Result, read_or_default (item_element.element_by_name ("title"), "Undefined"), create {HTTP_URL}.make (read_or_default (item_element.element_by_name ("link"), "")), read_or_default (item_element.element_by_name ("description"), "Undefined"))
					
					if (item_element.element_by_name ("author") /= Void) then
						new_item.set_author (item_element.element_by_name ("author").text)
					end
					
					if (item_element.element_by_name ("pubDate") /= Void) then
						new_item.set_pub_date (read_date (item_element.element_by_name ("pubDate").text))
					end

					Result.add_item (new_item)
				end
				channel.forth
			end
		end
	end
		

end -- class RSS_2_0_READER
