indexing
	description: "Example class for feeds."
	author: "Thomas Weibel"
	date: "$Date: 2005-01-04 09:56:13 +0100 (Tue, 04 Jan 2005) $"
	revision: "$Rev: 14 $"

class
	FEED_EXAMPLE

create
	make

feature -- Initialization

	make is
			-- Creation procedure.
		do
			-- Create a simple feed with some categories
			create feed.make ("EiffelRSS", create {HTTP_URL}.make ("http://eiffelrss.berlios.de/Main/AllRecentChanges?action=rss"), "EiffelRSS news")
			feed.add_category (create {CATEGORY}.make_title ("RSS"))
			feed.add_category (create {CATEGORY}.make_title ("Programming"))
			feed.add_category (create {CATEGORY}.make_title ("Eiffel"))
			
			-- Add some simple items, use `feed.last_added_item' or directly create an item for finer control
			feed.new_item ("Version 23 released!", create {HTTP_URL}.make ("http://eiffelrss.berlios.de/Main/News"), 
				"Version 23 of EiffelRSS got release today. Happy syndicating!")
			feed.new_item ("Microsoft uses EiffelRSS", create {HTTP_URL}.make ("http://eiffelrss.berlios.de/Main/WhoUsesEiffelRSS"), 
				"Microsoft confirmed in a press release today that they use EiffelRSS to syndicate news on their website.")
			feed.new_item ("EiffelRSS wins award", create {HTTP_URL}.make ("http://eiffelrss.berlios.de/Main/Awards"),
				"EiffelRSS has been awarded by ISE as best syndication software written in Eiffel. For more info see award-winning pages: http://eiffelrss.berlios.de")
				
			-- Print feed
			io.put_string ("Sample feed:%N")
			io.put_string ("============%N")
			io.put_string (feed.to_string)
		end
		
feature -- Arguments

	feed: FEED
			-- Example feed

end -- class FEED_EXAMPLE
