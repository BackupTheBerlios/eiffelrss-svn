indexing
	description: "Objects that ..."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CL_FEED_INFO_COMMAND

inherit
	CL_COMMAND
		redefine
			make
		end

create
	make

feature -- Initialization

	make (args: LIST [STRING]) is
			-- 
		local
			feed_item: ITEM
			disp: INFORMATION_DISPLAYER
		do
			Precursor (args)
			args.start
			if application.current_feed.items.valid_index (args.item.to_integer) then
				feed_item := application.current_feed.items.i_th (args.item.to_integer)
				disp := application.application_displayer.information_displayer
				
				io.put_new_line
				disp.show_temporary_text (Info_item_title_item + ": " + feed_item.title)
				disp.show_temporary_text (Info_item_description_item + ": " + feed_item.description)
				disp.show_temporary_text (Info_item_link_item + ": " + feed_item.link.location)
				if feed_item.pub_date /= void then
					disp.show_temporary_text (Info_item_pub_date_item + ": " + feed_item.pub_date.default_format_string)
				end
				if feed_item.author /= void then
					disp.show_temporary_text (Info_item_author_item + ": " + feed_item.author)
				end
				io.put_new_line
			end
			
		end
		
end -- class CL_FEED_INFO_COMMAND
