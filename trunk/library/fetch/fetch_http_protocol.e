indexing
	description: "Objects that ..."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	FETCH_HTTP_PROTOCOL
	
inherit
	HTTP_PROTOCOL
	
redefine
	initiate_transfer
	end
	
create
	make

feature
		initiate_transfer is
			-- Initiate transfer.
		local
			str: STRING
		do
			str := Http_get_command.twin
			str.extend (' ')
			if address.is_proxy_used then
				str.append (location)
			else
				str.extend ('/')
				str.append (address.path)
			end
			str.extend (' ')
			str.append ("HTTP/1.0%R%NHost: ")
			str.append (address.host)
			str.append (Http_end_of_command)
			if not error then
				main_socket.put_string (str)
					debug
						Io.error.put_string (str)
					end
				get_headers
				transfer_initiated := True
				is_packet_pending := True
			end
		rescue
			error_code := Transfer_failed
		end


end -- class FETCH_HTTP_PROTOCOL
