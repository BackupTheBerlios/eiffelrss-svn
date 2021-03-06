indexing
	description: "Class to represent a channel textInput sub-element."
	author: "Thomas Weibel"
	date: "$Date$"
	revision: "$Rev$"

class
	CHANNEL_TEXT_INPUT

create
	make
	
feature -- Initialization

	make (a_title: STRING; a_description: STRING; a_name: STRING; a_link: URL) is
			-- Create a channel text input with title, description, name and link
		require
			non_empty_title: a_title /= Void and then not a_title.is_empty
			non_empty_description: a_description /= Void and then not a_description.is_empty
			non_empty_name: a_name /= Void and then not a_name.is_empty
			non_void_link: a_link /= Void
		do
			set_title (a_title)
			set_description (a_description)
			set_name (a_name)
			set_link (a_link)
		end
		
feature -- Access

	title: STRING
			-- Title of the text input
	
	description: STRING
			-- Description of the text input
			
	name: STRING
			-- Name of the text input
			
	link: URL
			-- Link of the text input

feature -- Setter

	set_title (a_title: STRING) is
			-- Set title to`a_title'
		require
			non_empty_title: a_title /= Void and then not a_title.is_empty
		do
			title := a_title
		ensure
			title_set: title = a_title
		end
		
	set_description (a_description: STRING) is
			-- Set description to`a_description'
		require
			non_empty_description: a_description /= Void and then not a_description.is_empty
		do
			description := a_description
		ensure
			description_set: description = a_description
		end
		
	set_name (a_name: STRING) is
			-- Set name to`a_name'
		require
			non_empty_name: a_name /= Void and then not a_name.is_empty
		do
			name := a_name
		ensure
			name_set: name = a_name
		end
		
	set_link (a_link: URL) is
			-- Set link to`a_link'
		require
			non_void_link: a_link /= Void
		do
			link := a_link
		ensure
			link_set: link = a_link
		end

feature -- Debug

	to_string: STRING is
			-- Returns a string representation of text input
			-- This feature is especially useful for debugging
		do
			Result := "* Title: " + title + "%N* Description: " + description + "%N* Name: " + name + "%N* Link: " + link.location + "%N"
		end

invariant
	non_empty_title: title /= Void and then not title.is_empty
	non_empty_description: description /= Void and then not description.is_empty
	non_empty_name: name /= Void and then not name.is_empty
	non_void_link: link /= Void

end -- class CHANNEL_TEXT_INPUT
