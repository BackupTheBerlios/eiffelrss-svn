indexing
	description: "Objects that contain several commands in a hash table"
	author: "Martin Luder"
	date: "$Date$"
	revision: "$Revision$"

class
	COMMAND_LIST

inherit
	HASH_TABLE[PROCEDURE [ANY, TUPLE],STRING]
	
create
	make

end -- class COMMAND_LIST
