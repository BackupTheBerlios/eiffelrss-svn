indexing
	description: "Objects that ..."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	READER_DEF
	
feature -- Operation

	read (a_document: XM_DOCUMENT): FEED is
			-- Parse the document and return a feed
	require
		valid_doc: a_document /= Void
	deferred
	ensure
		valid_result: Result /= Void
	end

feature -- Access

	get_name: STRING is
			-- Return a string with the format name
	deferred
	end
	
feature{NONE} -- Implementation
	
	read_or_default_element (a_element: XM_ELEMENT; default_value: STRING): STRING is
			-- Read the text of `a_element' or use `default_value' if `a_element' is Void or empty
	require
		default_value /= Void
	do
		Result := default_value
		if (a_element /= Void) and then not a_element.text.is_empty then
			Result := a_element.text
		else
			Result := default_value
		end
	ensure
		valid_result: Result /= Void
	end

	read_or_default_attribute (a_attribute: XM_ATTRIBUTE; default_value: STRING): STRING is
			-- Read the value of `a_attribute' or use `default_value' if `a_element' is Void or empty
	require
		default_value /= Void
	do
		Result := default_value
		if (a_attribute /= Void) and then not a_attribute.value.is_empty then
			Result := a_attribute.value
		else
			Result := default_value
		end
	ensure
		valid_result: Result /= Void
	end

	read_date (a_string: STRING): DATE_TIME is
			-- Convert an RFC 822 date string to a DATE_TIME object
	require
		valid_string: a_string /= Void
	local
		proper_string: STRING
		temp, temp2: STRING
		day, year, hour, minute, second: STRING
		i, month: INTEGER
		date_constants: DATE_CONSTANTS
	do
		create Result.make_now
		create date_constants
		
		proper_string := a_string
		
		if proper_string.count = 20 or proper_string.count = 18 then
			-- Read day
			day := proper_string.twin
			day.keep_head (2)
			proper_string.remove_head (3)
		
			-- Read month
			temp := proper_string.twin
			temp.keep_head (3)
			temp.to_lower
			
			month := 0
			from
				i := 1
			until
				i = 13 or month /= 0
			loop
				temp2 := date_constants.months_text.item (i).twin
				temp2.keep_head (3)
				temp2.to_lower
				if temp2.is_equal(temp) then
					month := i
				end
				i := i + 1
			end
			proper_string.remove_head(4)
			
			-- Read year
			year := proper_string.twin
			if proper_string.item(3) = ' ' then
				year.keep_head (2)
				proper_string.remove_head (3)
			else
				year.keep_head (4)
				proper_string.remove_head (5)
			end
			
			-- Read hour
			hour := proper_string.twin
			hour.keep_head (2)
			proper_string.remove_head (3)
			
			-- Read minute
			minute := proper_string.twin
			minute.keep_head (2)
			proper_string.remove_head (3)

			-- Read second
			second := proper_string.twin
			second.keep_head (2)
			proper_string.remove_head (3)
			
			-- Set data if everything is fine
			if (month /= 0) and (year.is_integer) and (day.is_integer) and (hour.is_integer) and (minute.is_integer) and (second.is_integer) then
				Result.make (year.to_integer, month, day.to_integer, hour.to_integer, minute.to_integer, second.to_integer)
			end
		end
	ensure
		Result /= Void
	end
		
		
	
end -- class READER_DEF
