indexing
	description: "Objects that handle the 'list' command"
	author: "Martin Luder"
	date: "$Date$"
	revision: "$Revision$"

class
	CL_LIST_COMMAND

inherit
	CL_COMMAND
		redefine
			make
		end

create
	make

feature -- Initialization

	make (args: LIST [STRING]) is
			-- list all feeds' names (with numbers)
		local
			i: INTEGER
			feeds: LIST[STRING]
		do
			Precursor (args)
			io.put_new_line
			
			from
				feeds := application.feed_manager.feed_links
				feeds.start
				application.feed_manager.start
				i := 1
			until
				feeds.after
			loop
				application.application_displayer.information_displayer.show_temporary_text (i.out + ": " + application.feed_manager.item (feeds.item).title)
				feeds.forth
				i := i + 1
			end
			
			io.put_new_line			
		end
		
end -- class CL_LIST_COMMAND
