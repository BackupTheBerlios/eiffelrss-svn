indexing
	description: "Class to represent a feed channel."
	author: "Thomas Weibel"
	date: "$Date$"
	revision: "$Rev$"

class
	CHANNEL
	
inherit
	CATEGORIES
	OBSERVABLE_CHANNEL
	
create
	make
	
feature -- Initialization

	make (a_title: STRING; a_link: URL; a_description: STRING) is
			--  Create a channel with title, link and description
		require
			non_empty_title: a_title /= Void and then not a_title.is_empty
			non_void_link: a_link /= Void
			non_empty_description: a_description /= Void and then not a_description.is_empty
		do
			set_title (a_title)
			set_link (a_link)
			set_description (a_description)
			initialization			
		end
		
feature -- Access

	title: STRING
			-- Channel title
	
	link: URL
			-- Channel link
			
	description: STRING
			-- Channel description
			
	language: STRING
			-- Channel language
			
	copyright: STRING
			-- Channel copyright
	
	managing_editor: STRING
			-- Channel managing editor
	
	web_master: STRING
			-- Channel web master
	
	pub_date: DATE_TIME
			-- Channel pulication date
	
	last_build_date: DATE_TIME
			-- Channel last build date
	
	feed_generator: STRING
			-- Channel feed generator
	
	docs: URL
			-- Channel docs
	
	cloud: CHANNEL_CLOUD
			-- Channel cloud
	
	ttl: INTEGER
			-- Channel time to live
	
	image: CHANNEL_IMAGE
			-- Channel image
	
	text_input: CHANNEL_TEXT_INPUT
			-- Channel text input

-- [TODO]	
--	skip_hours: HASH_TABLE[INTEGER, INTEGER]
--			-- Channel skip hours

-- [TODO]	
--	skip_days: HASH_TABLE[STRING, STRING]
--			-- Channel skip days

	items: SORTABLE_TWO_WAY_LIST[ITEM]
			-- Channel items
			
feature -- Access (RSS 0.91)

	rating: STRING
			-- Channel rating

feature -- Access (RSS 1.0)

-- [TODO]
--	items_toc: TWO_WAY_LIST[STRING]
--			-- Channel items table of content
--
--	textinput: URL
--			-- Channel textinput URL

feature -- Access (metadata)

-- [TODO]
--	format: CHANNEL_FORMAT
--			-- Format of the channel.

-- [TODO]
-- feature -- Access (modules)
-- The possiblity to add and remove modules to a channel would be very nice to 
-- have, but doesn't have a very high priority at the moment
--
--	modules: HASH_TABLE[MODULE_DEF, STRING]
--			-- Hashtable containing various optional modules

feature -- Setter

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
			
	set_language (a_language: STRING) is
			-- Channel language
		require
			non_empty_language: a_language /= Void and then not a_language.is_empty
		do
			language := a_language	
		ensure
			language_set: language = a_language
		end
		
	set_copyright (a_copyright: STRING) is
			-- Channel copyright
		require
			non_empty_copyright: a_copyright /= Void and then not a_copyright.is_empty
		do
			copyright := a_copyright
		ensure
			copyright_set: copyright = a_copyright
		end
	
	set_managing_editor (a_managing_editor: STRING) is
			-- Channel managing editor
		require
			non_empty_managing_editor: a_managing_editor /= Void and then not a_managing_editor.is_empty
		do
			managing_editor := a_managing_editor
		ensure
			managing_editor_set: description = a_managing_editor
		end
	
	set_web_master (a_web_master: STRING) is
			-- Channel web master
		require
			non_empty_web_master: a_web_master /= Void and then not a_web_master.is_empty
		do
			web_master := a_web_master
		ensure
			web_master_set: web_master = a_web_master
		end

	set_pub_date (date: DATE_TIME) is
			-- Channel pulication date
		require
			non_void_date: date /= Void
		do
			pub_date := date
		ensure
			pub_date_set: pub_date = date
		end
	
	set_last_build_date (date: DATE_TIME) is
			-- Channel last build date
		require
			non_void_last_build_date: date /= Void
		do
			last_build_date := date
		ensure
			last_build_date_set: last_build_date = date
		end
	
	set_feed_generator (a_feed_generator: STRING) is
			-- Channel feed generator
		require
			non_empty_feed_generator: a_feed_generator /= Void and then not a_feed_generator.is_empty
		do
			feed_generator := a_feed_generator
		ensure
			feed_generator_set: feed_generator = a_feed_generator
		end
	
	set_docs (url: URL) is
			-- Channel docs
		require
			non_void_docs: url /= Void
		do
			docs := url
		ensure
			docs_set: docs = url
		end

	set_cloud (a_cloud: CHANNEL_CLOUD) is
			-- Channel cloud
		require
			non_void_cloud: a_cloud /= Void
		do
			cloud := a_cloud
		ensure
			cloud_set: cloud = a_cloud
		end
	
	set_ttl (a_ttl: INTEGER) is
			-- Channel time to live
		do
			ttl := a_ttl
		ensure
			ttl_set: ttl = a_ttl
		end
	
	set_image (an_image: CHANNEL_IMAGE) is
			-- Channel image
		require
			non_void_image: an_image /= Void
		do
			image := an_image
		ensure
			image_set: image = an_image
		end
	
	set_text_input (a_text_input: CHANNEL_TEXT_INPUT) is
			-- Channel text input
		require
			non_void_text_input: a_text_input /= Void
		do
			text_input := a_text_input
		ensure
			text_input_set: text_input = a_text_input
		end

-- [TODO]	
--	set_skip_hours (some_skip_hours: HASH_TABLE[INTEGER, INTEGER]) is
--			-- Channel skip hours
--		require
--		
--		do
--			
--		ensure
--			
--		end
--
--	set_skip_days (some_skip_days: HASH_TABLE[STRING, STRING]) is
--			-- Channel skip days
--		require
--		
--		do
--			
--		ensure
--			
--		end

	set_items (item_list: like items) is
			-- Channel items
		require
			non_void_items: item_list /= Void
		do
			items := item_list
		ensure
			items_set: items = item_list
		end

feature -- Setter (RSS 0.91)

	set_rating (rating_value: STRING) is
			-- Channel rating
		require
			non_empty_rating: rating_value /= Void and then not rating_value.is_empty
		do
			rating := rating_value
		ensure
			rating_set: rating = rating_value
		end

feature -- Setter (RSS 1.0)

-- [TODO]
--	set_items_toc (item_toc_list: like items_toc) is
--			-- Channel items table of content
--		require
--		
--		do
--			
--		ensure
--			
--		end
--
--	set_textinput (url: URL) is
--			-- Channel textinput URL
--		require
--		
--		do
--			
--		ensure
--			
--		end
	
feature -- Setter (metadata)

-- [TODO]
--	set_format (a_format: CHANNEL_FORMAT) is
--			-- Format of the channel.
--		require
--		
--		do
--			
--		ensure
--			
--		end
		
feature -- Basic operations

-- [TODO]
--	add_skip_hour (skip_hour: INTEGER) is
--			-- Add a skip hour
--		require
--
--		do
--
--		ensure
--
--		end
--		
--	remove_skip_hour (skip_hour: INTEGER) is
--			-- Remove a skip hour
--		require
--
--		do
--
--		end
--		
--	add_skip_day (skip_day: INTEGER) is
--			-- Add a skip day
--		require
--
--		do
--
--		ensure
--
--		end
--		
--	remove_skip_day (skip_day: INTEGER) is
--			-- Remove a skip day
--		require
--
--		do
--
--		end

	add_item (item: ITEM) is
			-- Add an item
		require
			non_void_item: item /= Void
		do
			items.extend (item)
			notify_item_added (item)
		ensure
			one_more_item: items.count = old items.count + 1
			item_added: items.i_th (items.count) = item
		end
		
	remove_item (item: ITEM) is
			-- Remove an item
		require
			non_void_item: item /= Void
		do
			items.prune (item)
		end

feature -- Basic operations (RSS 1.0)

-- [TODO]
--	add_item_toc (item_toc: STRING) is
--			-- Add an item to the TOC
--		require
--		
--		do
--			
--		ensure
--			
--		end
--		
--	remove_item_toc (item_toc: STRING) is
--			-- Remove an item from the TOC
--		require
--		
--		do
--			
--		ensure
--			
--		end

feature -- Debug

	to_string: STRING is
			-- Returns a string representation of source
			-- This feature is especially useful for debugging
		do
			Result := "* Title: " + title + "%N" + "* Link: " + link.location + "%N" + "* Description: " + description + "%N"
			
			if language /= Void then
				Result := Result + "* Language: " + language + "%N"
			end

			if copyright /= Void then
				Result := Result + "* Copyright: " + copyright + "%N"
			end
			
			if managing_editor /= Void then
				Result := Result + "* Managing Editor: " + managing_editor + "%N"
			end
			
			if web_master /= Void then
				Result := Result + "* Webmaster: " + web_master + "%N"
			end
			
			if pub_date /= Void then
				Result := Result + "* Publication date: " + pub_date.out + "%N"
			end
			
			if last_build_date /= Void then
				Result := Result + "* Last build date: " + last_build_date.out + "%N"
			end
			
			if categories.count > 0 then
				Result := Result + "* Categories: %N---%N"
				from
					categories.start
				until
					categories.after
				loop
					Result := Result + categories.item.to_string + "---%N"
					categories.forth
				end
			end
			
			if feed_generator /= Void then
				Result := Result + "* Feed generator: " + feed_generator + "%N"
			end
			
			if docs /= Void then
				Result := Result + "* Documentation: " + docs.location + "%N"
			end
			
			if cloud /= Void then
				Result := Result + "* Cloud: " + cloud.to_string + "%N"
			end
			
			if ttl /= Void then
				Result := Result + "* TTL: " + ttl.out + "%N"
			end

			if image /= Void then
				Result := Result + "* Image: " + image.to_string + "%N"
			end
			
			if text_input /= Void then
				Result := Result + "* Text input: " + text_input.to_string + "%N"
			end
			
			if items.count > 0 then
				Result := Result + "* Items: %N---%N"
				from
					items.start
				until
					items.after
				loop
					Result := Result + items.item.to_string + "---%N"
					items.forth
				end
			end
			
			if rating /= Void then
				Result := Result + "* Rating: " + rating + "%N"
			end
		end
		
feature {NONE} -- Implementation

	initialization is
			-- Common initialization tasks
		do
			initialize_observers
			initialize_categories
			
			create items.make
			items.compare_objects
		end

invariant
	non_empty_title: title /= Void and then not title.is_empty
	non_void_link: link /= Void
	non_empty_description: description /= Void and then not description.is_empty
	non_void_items: items /= Void

end -- class CHANNEL
