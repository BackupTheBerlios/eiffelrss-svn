indexing
	description: "Object that output Information to the user"
	author: "Martin Luder"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	INFORMATION_DISPLAYER

inherit
	APP_REF
	
feature -- Initialization
	
	make is
			-- creation procedure
		do
			create initial_text.make_empty
			create text.make_empty
			create temporary_text.make_empty			
		end
		
	
	make_with_text (a_text: STRING) is
			-- create with initial text message
		require
			a_text_not_void: a_text /= void
		do
			make
			show_initial_text (a_text)
		end
		
	
feature -- Status change

	show_initial_text (a_text: STRING) is
			-- set initial text message
		require
			a_text_not_void: a_text /= void
		do
			initial_text.copy (a_text)
			current_text := initial_text
			show_current
		end
	
	show_text (a_text: STRING) is
			-- set text message
		require
			a_text_not_void: a_text /= void
		do
			text.copy (a_text)
			current_text := text
			show_current
		end
	
	show_temporary_text (a_text: STRING) is
			-- set temporary text message
		require
			a_text_not_void: a_text /= void
		do
			temporary_text.copy (a_text)
			current_text := temporary_text
			show_current
		end
	
	revert is
			-- revert temporary state to standard state
		do
			current_text := text
			show_current
		end

feature {NONE} -- Implementation

	initial_text: STRING
	text: STRING
	temporary_text: STRING
	current_text: STRING
	
	
	show_current is
			-- show current text message
		deferred
		end
		
		

end -- class INFORMATION_AREA
