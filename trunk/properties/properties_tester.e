indexing
	description: "Test class for PROPERTIES"
	author: "Thomas Weibel"
	date: "$Date$"
	revision: "$Rev$"

class
	PROPERTIES_TESTER

create
	make

feature -- Initialization

	make is
			-- Creation procedure.
		do
			io.put_string ("%N===============================%N")
			io.put_string ("| Test program for PROPERTIES |%N")
			io.put_string ("===============================%N%N")
			
			-- Open files
			create input_file.make_open_read ("input.properties")
			create output_file.make_create_read_write ("output.properties")
			create defaults_file.make_open_read ("defaults.properties")
			
			-- Create default properties
			create defaults.make (10)
			-- Load default properties from file
			defaults.load (defaults_file)
			-- Display defaults
			io.put_string ("Defaults: %N")
			io.put_string ("=========%N")
			io.put_string (defaults.list)
			
			io.put_new_line
			
			-- Create properties
			create settings.make_defaults (10, defaults)
			-- Load settings from file
			settings.load (input_file)
			-- Display defaults
			io.put_string ("Settings: %N")
			io.put_string ("=========%N")
			io.put_string (settings.list)
			
			io.put_new_line
			
			-- Query settings
			io.put_string ("Queries: %N")
			io.put_string ("========%N")
			-- From settings
			io.put_string ("Hitchhikers: " + settings.item_default ("hitchhikers", "Ford, Arthur") + "%N")
			io.put_string ("Paranoid: " + settings @ "paranoid" + "%N")
			-- From defaults
			io.put_string ("Important item: " + settings.item ("important") + "%N")
			-- Not in property or defaults list, but default value specified in feature call
			io.put_string ("Reporter: " + settings.item_default ("reporter", "Ford") + "%N")
			
			io.put_new_line
			
			-- Create, display, store and load settings
			io.put_string ("Storage: %N")
			io.put_string ("========%N")
			create output.make (10)
			-- Put some values
			output.put ("Benjy%TFrankie", "mice")
			output.put ("Slartibartfast", "fjord designer")
			-- Display properties
			io.put_string (output.list)
			-- Store properties
			io.put_string ("%NSaving properties%N")
			output.store (output_file, "PROPERTIES test")
			-- Load properties
			io.put_string ("Loading properties%N%N")
			output.load (output_file)
			-- Display properties
			io.put_string (output.list)
		end
		
feature -- Arguments

	settings, output, defaults: PROPERTIES
			-- Properties
			
	input_file, output_file, defaults_file: PLAIN_TEXT_FILE
			-- Files for input, output and the defaults
	
end -- class PROPERTIES_TESTER
