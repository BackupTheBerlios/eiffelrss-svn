indexing

	description:

		"Test features of class CONCAT2"

	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date: 2003/02/07 12:47:04 $"
	revision: "$Revision: 1.6 $"

deferred class TEST_PROPERTIES

inherit
	TS_TEST_CASE

feature -- Test

	test_creation is
			-- Test creation features
		local
			properties: PROPERTIES
			default_properties: PROPERTIES
		do
			create default_properties.make (10)
			assert ("make", default_properties /= Void)
			
			default_properties.put ("Value", "Key")
			create properties.make_defaults (10, default_properties)
			assert ("make_default", properties /= Void)
		end

end
