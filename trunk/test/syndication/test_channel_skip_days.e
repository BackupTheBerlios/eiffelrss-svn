indexing
	description: "Tester class for channel skip days."
	author: "Thomas Weibel"
	date: "$Date: 2005-01-24 14:46:28 +0100 (Mon, 24 Jan 2005) $"
	revision: "$Rev: 148 $"

deferred class TEST_CHANNEL_SKIP_DAYS

inherit
	TS_TEST_CASE

feature -- Test

	test_make is
			-- Test feature `make'.
		local
			skip_days: CHANNEL_SKIP_DAYS
		do
			create skip_days.make
			assert ("make [1]", skip_days /= Void)
		end
		
	test_element_change is
			-- Test features `put' and `extend'.
		local
			skip_days: CHANNEL_SKIP_DAYS
		do
			create skip_days.make
			skip_days.extend ("MoNdAy")
			assert_equal ("element_change [1]", "Monday", skip_days.last)
			
			skip_days.extend ("FrIDAY")
			assert_equal ("element_change [2]", "Monday", skip_days.last)
			assert_equal ("element_change [3]", "Friday", skip_days.first)
		end

end -- class TEST_CHANNEL_SKIP_DAYS
