indexing
	description: "Objects that ..."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class 
	CUSTOM_HTTP_URL
	
inherit
	NETWORK_RESOURCE_URL
	redefine
		is_path_correct, is_correct
	end

create
	make

feature -- Access

	Service: STRING is "http"
			-- Name of service (Answer: "http")

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

feature -- Status report

	Default_port: INTEGER is 80
			-- Number of default port for service (Answer: 80)
			
	Is_proxy_supported: BOOLEAN is True
			-- Are proxy connections supported? (Answer: yes)

	Has_username: BOOLEAN is False
			-- Can address contain a username? (Answer: no)

end -- class CUSTOM_HTTP_URL
