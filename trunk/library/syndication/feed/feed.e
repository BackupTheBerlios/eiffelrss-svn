indexing
	description: "Class to represent a feed. Provides an easy to use interface to channel, item and category."
	author: "Thomas Weibel"
	date: "$Date$"
	revision: "$Rev$"

class
	FEED
	
inherit
	CHANNEL
	
create
	make, make_from_channel
	
feature -- Initialization
		
	make_from_channel (a_channel: CHANNEL) is
			-- Create a new feed from an existing channel
		require
			non_void_channel: a_channel /= Void
		do
			set_channel (a_channel)
		end
			
feature -- Setter

	set_channel (a_channel: CHANNEL) is
			-- Set channel
		require
			non_void_channel: a_channel /= Void
		do
			initialization
			set_title (a_channel.title)
			set_link (a_channel.link)
			set_description (a_channel.description)
			set_items (a_channel.items)
			set_categories (a_channel.categories)
			set_ttl (a_channel.ttl)
			
			if language /= Void then
				set_language (a_channel.language)
			end

			if copyright /= Void then
				set_copyright (a_channel.copyright)
			end
			
			if managing_editor /= Void then
				set_managing_editor (a_channel.managing_editor)
			end
			
			if web_master /= Void then
				set_web_master (a_channel.web_master)
			end
			
			if pub_date /= Void then
				set_pub_date (a_channel.pub_date)
			end
			
			if last_build_date /= Void then
				set_last_build_date (a_channel.last_build_date)
			end
			
			if feed_generator /= Void then
				set_feed_generator (a_channel.feed_generator)
			end
			
			if docs /= Void then
				set_docs (a_channel.docs)
			end
			
			if cloud /= Void then
				set_cloud (a_channel.cloud)
			end

			if image /= Void then
				set_image (a_channel.image)
			end
			
			if text_input /= Void then
				set_text_input (a_channel.text_input)
			end
			
			if rating /= Void then
				set_rating (a_channel.rating)
			end			
		end

feature -- Basic operations

	create_cloud (a_domain: STRING; a_port: INTEGER; a_path: STRING; a_register_procedure: STRING; a_protocol: STRING) is
			-- Create and add a cloud
		require
			non_empty_domain: a_domain /= Void and then not a_domain.is_empty
			port_number_non_negative: a_port >= 0
			non_empty_path: a_path /= Void and then not a_path.is_empty
			non_empty_register_procedure: a_register_procedure /= Void and then not a_register_procedure.is_empty
			non_empty_protocol: a_protocol /= Void and then not a_protocol.is_empty
		do
			set_cloud (create {CHANNEL_CLOUD}.make (a_domain, a_port, a_path, a_register_procedure, a_protocol))
		end
		
	create_image (a_url: URL; a_title: STRING; a_link: URL) is
			-- Create and add an image with URL, title, and link
		require
			non_void_url: a_url /= Void
			non_empty_title: a_title /= Void and then not a_title.is_empty
			non_void_link: a_link /= Void
		do
			set_image (create {CHANNEL_IMAGE}.make (a_url, a_title, a_link))
		end
		
	create_text_input (a_title: STRING; a_description: STRING; a_name: STRING; a_link: URL) is
			-- Create and add a text input with URL, title, and link
		require
			non_empty_title: a_title /= Void and then not a_title.is_empty
			non_empty_description: a_description /= Void and then not a_description.is_empty
			non_empty_name: a_name /= Void and then not a_name.is_empty
			non_void_link: a_link /= Void
		do
			set_text_input (create {CHANNEL_TEXT_INPUT}.make (a_title, a_description, a_name, a_link))
		end
		
	new_item (a_title: STRING; a_link: URL; a_description: STRING) is
			-- Create an item with title, link and description
		require
			non_empty_title: a_title /= Void and then not a_title.is_empty
			non_void_link: a_link /= Void
			non_empty_description: a_description /= Void and then not a_description.is_empty
		do
			add_item (create {ITEM}.make (Current, a_title, a_link, a_description))
		end

end -- class FEED
