indexing
	description: "Class to represent a feed item."
	author: "Thomas Weibel"
	date: "$Date$"
	revision: "$Rev$"

class
	ITEM
	
inherit
	CATEGORIES
	
create
	make, make_title, make_description
	
feature -- Initialization

	make (a_channel: CHANNEL; a_title: STRING; a_link: URL; a_description: STRING) is
			-- Create an item with title, link and description
		require
			non_void_channel: a_channel /= Void
			non_empty_title: a_title /= Void and then not a_title.is_empty
			non_void_link: a_link /= Void
			non_empty_description: a_description /= Void and then not a_description.is_empty
		do
			set_channel (a_channel)
			set_title (a_title)
			set_link (a_link)
			set_description (a_description)
			initialization
		end
		
	make_title (a_channel: CHANNEL; a_title: STRING) is
			-- Create an item with title
		require
			non_void_channel: a_channel /= Void
			non_empty_title: a_title /= Void and then not a_title.is_empty
		do
			set_channel (a_channel)
			set_title (a_title)
			initialization
		end
		
	make_description (a_channel: CHANNEL; a_description: STRING) is
			-- Create an item with description
		require
			non_void_channel: a_channel /= Void
			non_empty_description: a_description /= Void and then not a_description.is_empty
		do
			set_channel (a_channel)
			set_description (a_description)
			initialization
		end

feature -- Access

	channel: CHANNEL
			-- Backlink to the corresponding channel

	title: STRING
			-- Item title
	
	link: URL
			-- Item link
			
	description: STRING
			-- Item description
			
	author: STRING
			-- Item author
			
	comments: URL
			-- Item comment URL
			
	enclosure: ITEM_ENCLOSURE
			-- Item enclosure
			
	guid: ITEM_GUID
			-- Item globally unique identifier (guid)
			
	pub_date: DATE_TIME
			-- Item publication date
	
	source: ITEM_SOURCE
			-- Item source

feature -- Access (metadata)

	date_found: DATE_TIME
			-- Item date found
	
	is_read: BOOLEAN
			-- Is the item read?

-- [TODO]
-- feature -- Access (modules)
-- The possiblity to add and remove modules to an item would be very nice to 
-- have, but doesn't have a very high priority at the moment
--
--	modules: HASH_TABLE[MODULE_DEF, STRING]
--			-- Hashtable containing various optional modules

feature -- Setter

	set_channel (a_channel: CHANNEL) is
			-- Set channel to `a_channel'
		require
			non_void_channel: a_channel /= Void
		do
			channel := a_channel
		ensure
			channel_set: channel = a_channel
		end

	set_title (a_title: STRING) is
			-- Set title to `a_title'
		require
			non_empty_title: a_title /= Void and then not a_title.is_empty
		do
			title := a_title
		ensure
			title_set: title = a_title
		end
		
	set_link (a_link: URL) is
			-- Set link to `a_link'
		require
			non_void_link: a_link /= Void
		do
			link := a_link
		ensure
			link_set: link = a_link
		end
		
	set_description (a_description: STRING) is
			-- Set description to `a_description'
		require
			non_empty_description: a_description /= Void and then not a_description.is_empty
		do
			description := a_description
		ensure
			description_set: description = a_description
		end
		
	set_author (an_author: STRING) is
			-- Set author to `an_author'
		require
			non_empty_author: an_author /= Void and then not an_author.is_empty
		do
			author := an_author
		ensure
			author_set: author = an_author
		end
		
	set_comments (url: URL) is
			-- Set comments to `url'
		require
			non_void_comments: url /= Void
		do
			comments := url
		ensure
			comments_set: comments = url
		end
		
	set_enclosure (an_enclosure: ITEM_ENCLOSURE) is
			-- Set enclosure to `an_enclosure'
		require
			enclosure_non_void: an_enclosure /= Void
		do
			enclosure := an_enclosure
		ensure
			enclosure_set: enclosure = an_enclosure
		end
		
	set_guid (a_guid: ITEM_GUID) is
			-- Set guid to `a_guid'
		require
			guid_non_void: a_guid /= Void
		do
			guid := a_guid
		ensure
			guid_set: guid = a_guid
		end
		
	set_pub_date (date: DATE_TIME) is
			-- Set publication date to `date'
		require
			pub_date_non_void: date /= Void
		do
			pub_date := date
		ensure
			pub_date_set: pub_date = date
		end
		
	set_source (a_source: ITEM_SOURCE) is
			-- Set source to `a_source'
		require
			source_non_void: a_source /= Void
		do
			source := a_source
		ensure
			source_set: source = a_source
		end
		
feature -- Setter (metadata)

	set_date_found (date: DATE_TIME) is
			-- Set date_found to `date'
		require
			date_found_non_void: date /= Void
		do
			date_found := date
		ensure
			date_found_set: date_found = date
		end
		
	set_read (value: BOOLEAN) is
			-- Set is_read to `value'
		do
			is_read := value
		ensure
			is_read_set: is_read = value
		end

feature -- Debug

	to_string: STRING is
			-- Returns a string representation of source
			-- This feature is especially useful for debugging
		do
			Result := "Item:%N=====%N%N"		
		
			if title /= Void then
				Result.append ("* Title: " + title + "%N")
			end
			
			if link /= Void then
				Result.append ("* Link: " + link.location + "%N")
			end
			
			if description /= Void then
				Result.append ("* Description: " + description + "%N")
			end
			
			if author /= Void then
				Result.append ("* Author: " + author + "%N")
			end
			
			if comments /= Void then
				Result.append ("* Comments: " + comments.location + "%N")
			end
			
			if pub_date /= Void then
				Result.append ("* Publication date: " + pub_date.out + "%N")
			end
			
			Result.append ("* Date found: " + date_found.out + "%N")
			Result.append ("* Is read: " + is_read.out + "%N")
			
			if source /= Void then
				Result.append ("%NItem source:%N------------%N" + source.to_string)
			end

			if enclosure /= Void then
				Result.append ("%NItem enclosure:%N----------------------------%N" + enclosure.to_string)
			end
			
			if guid /= Void then
				Result.append ("%NItem GUID%N---------------------%N" + guid.to_string)
			end
			
			if categories.count > 0 then
				Result.append ("%NItem categories:%N----------------%N")
				from
					categories.start
				until
					categories.after
				loop
					Result.append ("* " + categories.item.to_string)
					categories.forth
				end
			end
		end
		
feature {NONE} -- Implementation

	initialization is
			-- Common initialization tasks
		do
			initialize_categories
			create date_found.make_now_utc
			set_read (False)
		end

invariant
	non_void_channel: channel /= Void
	date_found_non_void: date_found /= Void

end -- class ITEM