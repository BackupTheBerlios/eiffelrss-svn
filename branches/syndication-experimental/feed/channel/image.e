indexing
	description: "Class to represent a channel image sub-element."
	author: "Thomas Weibel"
	date: "$Date$"
	revision: "$Rev$"

class
	IMAGE

create
	make
	
feature -- Initialization

	make (a_url: URL; a_title: STRING; a_link: URL) is
			-- Create a channel image with URL, title, and link
		require
			non_void_url: a_url /= Void
			non_empty_title: a_title /= Void and then not a_title.is_empty
			non_void_link: a_link /= Void
		do
			set_url (a_url)
			set_title (a_title)
			set_link (a_link)
		end
		
feature -- Constants

	Default_width: INTEGER is 88
			-- Default width of the image
			
	Max_width: INTEGER is 144
			-- Maximum width of the image
		
feature -- Access

	url: URL
			-- URL of the image
	
	title: STRING
			-- Title of the image
			
	link: URL
			-- Link of the image
			
	width, height: INTEGER
			-- Width and height of the image
			
	description: STRING
			-- Description of the image

feature -- Setter

	set_url (a_url: URL) is
			-- Set url to`a_url'
		require
			non_void_url: a_url /= Void
		do
			url := a_url
		ensure
			url_set: url = a_url
		end
		
	set_title (a_title: STRING) is
			-- Set title to`a_title'
		require
			non_empty_title: a_title /= Void and then not a_title.is_empty
		do
			title := a_title
		ensure
			title_set: title = a_title
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
		
	set_width (a_width: INTEGER) is
			-- Set width to`a_width'
		require
			width_positive: a_width > 0
			width_smaller_than_max_width: a_width <= Max_width
		do
			width := a_width
		ensure
			width_set:  width = a_width
		end
		
	set_height (a_height: INTEGER) is
			-- Set heigh to`a_heigh'
		require
			height_positive: a_height > 0
		do
			height := a_height
		ensure
			height_set:  height = a_height
		end
		
	set_description (a_description: STRING) is
			-- Set  to`a_'
		require
			non_empty_description: a_description /= Void and then not a_description.is_empty
		do
			description := a_description
		ensure
			description_set:  description = a_description
		end

feature -- Debug

	to_string: STRING is
			-- Returns a string representation of guid
			-- This feature is especially useful for debugging
		do
			Result := "- URL: " + url.location + "%N" + "- Title: " + title + "%N"
								+ "- Link: " + link.location + "%N"
			
			if width > 0 then
				Result := Result + "- Width: " + width.out + "%N"
			end
			
			if height > 0 then
				Result := Result + "- Height: " + height.out + "%N"
			end
			
			if description /= Void then
				Result := Result + "- Description: " + description + "%N"
			end
		end

invariant
	non_void_url: url /= Void
	non_empty_title: title /= Void and then not title.is_empty
	non_void_link: link /= Void
	width_smaller_than_max_width: width <= Max_width

end -- class IMAGE
