indexing
	description: "Objects that ..."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	INTERFACE_NAMES

feature -- General

	Application_name: STRING is "Newsreader"
			-- String with application's name
			
	Application_version_number: STRING is "0.x"
			-- String representing application's version number
			
	Application_about: STRING is ""
			-- String representing information about this application

feature -- preferences

	Preferences_browser_not_set_information: STRING is "Path to browser executable not set"
			-- String for information, that is shown when trying to open an URI while Browser_path is not set


feature -- Feed Info

	Info_feed_title_item: STRING is "Title"
			-- String representing title of a feed
	
	Info_feed_description_item: STRING is "Description"
			-- String representing description of a feed
	
	Info_feed_link_item: STRING is "Link"
			-- String representing link of a feed
	
	Info_feed_pub_date_item: STRING is "Date"
			-- String representing pub_date of a feed
	
	Info_feed_language_item: STRING is "Language"
			-- String representing language of a feed
	
	Info_feed_copyright_item: STRING is "Copyright"
			-- String representing copyright of a feed
	
	Info_feed_managing_editor_item: STRING is "Managing Editor"
			-- String representing managing_editor of a feed
	
	Info_feed_web_master_item: STRING is "Webmaster"
			-- String representing web_master of a feed
	
	Info_feed_last_build_date_item: STRING is "Last built on"
			-- String representing last_build_date of a feed
	
	Info_feed_feed_generator_item: STRING is "Feed Generator"
			-- String representing feed_generator of a feed
	
	Info_feed_docs_item: STRING is "Docs"
			-- String representing docs of a feed

feature -- Feed Item Info

	Info_item_title_item: STRING is "Title"
			-- String representing title of a feed item
	
	Info_item_link_item: STRING is "Link"
			-- String representing link of a feed item
	
	Info_item_description_item: STRING is "Description"
			-- String representing description of a feed item
	
	Info_item_author_item: STRING is "Author"
			-- String representing author of a feed item
	
	Info_item_pub_date_item: STRING is "Date"
			-- String representing pub_date of a feed item

end -- class INTERFACE_NAMES
