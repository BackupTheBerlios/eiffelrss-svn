indexing
	description: "Tester class for formats."
	author: "Thomas Weibel"
	date: "$Date$"
	revision: "$Rev$"

deferred class TEST_FORMATS

inherit
	TS_TEST_CASE

feature -- Test

	test_make is
			-- Test feature `make'.
		local
			string: STRING
		do
			string := "Test"
			assert ("make [1]", string /= Void)
		end

end -- class TEST_FORMATS
