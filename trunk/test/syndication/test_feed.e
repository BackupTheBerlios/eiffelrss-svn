indexing
	description: "Tester class for feed."
	author: "Thomas Weibel"
	date: "$Date$"
	revision: "$Rev$"

deferred class TEST_FEED

inherit
	TS_TEST_CASE

feature -- Test

	test_make is
			-- Test feature `make'.
		local
			feed: FEED
		do
			create feed.make ("EiffelRSS", create {HTTP_URL}.make ("http://eiffelrss.berlios.de/Main/AllRecentChanges?action=rss"), "EiffelRSS news")
			assert ("make [1]", feed /= Void)
		end

end -- class TEST_FEED
