indexing
	description: "Objects that ..."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	FETCH_RESOURCE_HTTP

inherit
	FETCH_RESOURCE
	
create
	make

feature -- Initialisation
	make (a_address: STRING) is
			-- Create with `a_address' as source
		do
			create {FETCH_HTTP_URL} url.make (a_address)
		end
		
feature
	fetch: STRING is
			-- Fetch the data
		local
			http_url: FETCH_HTTP_URL
			socket: NETWORK_STREAM_SOCKET
			command: STRING
			status_line: STRING			
			location: STRING
			temp: STRING
		do
			Result := ""
			
			http_url ?= url
			
			create socket.make_client_by_port (http_url.port, http_url.host)
			socket.set_timeout (20)
			socket.connect
			
			if socket.is_open_read then
				command := "GET /" + http_url.path
				command.append (" HTTP/1.1%R%N")
				command.append ("Host: ")
				command.append (http_url.host)
				command.append ("%R%N%R%N")
				
				socket.put_string (command)
				
				if socket.ready_for_reading then
					socket.read_line
					status_line := socket.last_string.twin
				end
				
				-- Supress header
				from					
				until
					socket.last_string.count < 4
				loop
					socket.read_line
					
					temp := socket.last_string.twin
					temp.keep_head (8)
					
					if temp.is_equal ("Location") then
						location := socket.last_string.twin
						location.remove_head (11)
					end
				end
				
				-- Read content
				from						
				until
					socket.is_closed or else not socket.ready_for_reading 
				loop
					socket.read_stream (50)
					if socket.socket_ok and not socket.last_string.is_empty then
						Result.append (socket.last_string.twin)
					else
						socket.close
					end
				end
			end
		end
		
		
end -- class FETCH_RESOURCE_HTTP
