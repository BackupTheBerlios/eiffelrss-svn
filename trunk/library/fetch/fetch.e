indexing
	description: "Class which can fetch data from a source address"
	author: "Michael Käser"
	date: "$Date$"
	revision: "$Revision$"

class
	FETCH

inherit
	DATA_RESOURCE_FACTORY
	
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
		-- An error number
		
	None, Invalid_address, Transfer_failed: INTEGER is unique
	
feature -- Status report

feature -- Basic operations
	set_address (an_address: STRING) is
			-- Set the source address
	do
		source_address := an_address
		data := Void
		error := Invalid_address
		
		if (an_address /= Void) then
			Resource_factory.set_address (an_address)
			if (Resource_factory.is_address_correct) then
				error := None
			end
		end
	end

	fetch is
			-- Fetch the data from the given source address
	local
		resource: DATA_RESOURCE
	do
		if error = None then
			create data.make_empty
			
			Resource_factory.create_resource
			resource := Resource_factory.resource
			
			resource.set_read_mode
			resource.open

			if not resource.error then
				resource.initiate_transfer

				if not resource.error then
					from until not resource.is_packet_pending loop
						resource.read
						data := data + resource.last_packet
					end
				end
			end
			
			if resource.error then
				error := Transfer_failed				
			else
				resource.close
			end
		end
	end

invariant
	void_source: (source_address = Void) implies (Error = Invalid_address)
	empty_source: source_address.is_empty implies (Error = Invalid_address)
	valid_source: Resource_factory.is_address_set implies (not Resource_factory.is_address_correct implies Error = Invalid_address)

end -- class FETCH