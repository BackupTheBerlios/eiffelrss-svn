indexing
	description: "Objects that ..."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	FETCH_RESOURCE_FILE

inherit
	FETCH_RESOURCE
	
create
	make

feature -- Initialisation
	make (a_address: STRING) is
			-- Create with `a_address' as source
		do
			create {FILE_URL} url.make (a_address)
		end

feature -- Basic operations

	fetch: STRING is
			-- Fetch the data
		require else
			not_empty: not url.location.is_empty
		local
			file: PLAIN_TEXT_FILE
			filename: STRING
		do
			filename := url.location.twin
			filename.remove_head (7)
			create file.make_open_read (filename)
			
			Result := ""
			
			if file.is_open_read then
				from					
				until
					file.end_of_file
				loop
					file.read_line
					Result := Result + file.last_string
				end
			end			
		end

end -- class FETCH_RESOURCE_FILE
