indexing
	description: "Objects that ..."
	author: ""
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
		do
			Precursor (args)
			io.put_new_line
			
--			from
--				application.feeds.start
--				i := 0
--			until
--				application.feeds.after
--			loop
--				application.application_displayer.information_displayer.show_temporary_text (i.out + ": " + application.feed_manager.item (application.feeds.item).title)
--
--				application.feeds.forth
--				i := i + 1
--			end
			
			io.put_new_line			
		end
		
end -- class CL_LIST_COMMAND
