indexing
	description: "HTTP URL which supports special chars"
	author: "Michael K�ser"
	date: "$Date$"
	revision: "$Revision$"

class
	FETCH_HTTP_URL

inherit
	HTTP_URL
	redefine
		make
	end

create
	make

feature {NONE} -- Initialization

	make (a: STRING) is
			-- Create address.
		do
			Precursor (a)
			
			path_charset.add ("?")			
			path_charset.add ("&")
			path_charset.add ("=")
			path_charset.add (";")
		end

end -- class FETCH_HTTP_URL
