indexing
	description: "Objects that ..."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class 
	CUSTOM_HTTP_URL
	
inherit
	HTTP_URL
		redefine
			is_path_correct, is_correct
		end

create
	make

feature -- Status report

	is_path_correct (p: STRING): BOOLEAN is
			-- Is path name correct?
		do
			Result := p /= Void
		end

	is_correct: BOOLEAN is
			-- Is address correct?
		do
			Result := is_host_correct (host) and then is_path_correct (path)
		end

end -- class CUSTOM_HTTP_URL
