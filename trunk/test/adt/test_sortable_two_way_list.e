indexing
	description: "Tester class for ADT."
	author: "Thomas Weibel"
	date: "$Date$"
	revision: "$Rev$"

deferred class TEST_SORTABLE_TWO_WAY_LIST

inherit
	TS_TEST_CASE

feature -- Test

	test_make is
			-- Test feature `make'.
		local
			list: SORTABLE_TWO_WAY_LIST[STRING]
		do
			create list.make
			assert ("make [1]", list /= Void)
		end

end -- class TEST_SORTABLE_TWO_WAY_LIST
