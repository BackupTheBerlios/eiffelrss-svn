indexing
	description: "Tester class for logfile."
	author: "Thomas Weibel"
	date: "$Date$"
	revision: "$Rev$"

deferred class TEST_LOGFILE

inherit
	TS_TEST_CASE

feature -- Test

	test_make is
			-- Test feature `make'.
		local
			logfile: LOGFILE
		do
			create logfile.make_filename ("logfile.log")
			assert ("make [1]", logfile /= Void)
		end

end -- class TEST_LOGFILE
