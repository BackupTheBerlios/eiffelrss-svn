indexing
	description: "Class which can fetch data from a source address"
	author: "Michael Käser"
	date: "$Date$"
	revision: "$Revision$"

class
	FETCH
	
create
	make, make_source

feature -- Initialisation
	make is
			-- Create the object without a source
	do
		Error := Invalid_address
	end
	
	make_source (an_address: STRING) is
			-- Create the object with a predefined source
	require
		an_address /= Void
	do
		make
		set_address (an_address)
	end

feature -- Access
	source_address: STRING
		-- The source address
		
	data: STRING
		-- The data fetched
		
	error: INTEGER
		-- An error numbercla
		
	None, Invalid_address, Transfer_failed: INTEGER is unique
	
feature{NONE} -- Implementation
	
	resource: FETCH_RESOURCE

feature -- Basic operations
	set_address (an_address: STRING) is
			-- Set the source address
	local
		service: STRING
		address: STRING
		pos: INTEGER
	do
		source_address := an_address.twin
		
		pos := an_address.substring_index ("://", 1)
		if pos = 0 then
			address := "http://" + an_address
		else
			address := an_address
		end
		
		service := address.twin
		service.keep_head (4)
		address.remove_head (7)

		error := None
		
		if not address.is_empty then
			if service.is_equal ("http") then
				create {FETCH_RESOURCE_HTTP} resource.make (address)
			elseif service.is_equal ("file") then
				create {FETCH_RESOURCE_FILE} resource.make (address)
			else
				source_address := Void
				error := Invalid_address
			end			
		else
			source_address := Void
			error := Invalid_address
		end
	end

	fetch is
			-- Fetch the data from the given source address
	do
		if Error = None then
			data := resource.fetch
			
			if data.is_empty then
				error := Transfer_failed
			end			
		end
	end

invariant
	void_source: (source_address = Void) implies (Error = Invalid_address)
	valid_resource: error = None implies resource /= Void

end -- ss FETCH
