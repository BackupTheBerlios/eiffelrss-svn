indexing
	description	: "System's root class"
	note		: "Initial version automatically generated"

class
	TEST

create
	make

feature -- Initialization
	
	make is
			-- Creation procedure.
		do
			-- Item
			test_item
			
			-- Channel
			test_channel
		end
		
feature -- Test

	test_channel is
			-- Test channel
		local
			channel: CHANNEL
		do
			
		end

	test_item is
			-- Test item
		local
			item: ITEM
			item_url: HTTP_URL
			category1: CATEGORY
			category2: CATEGORY
			category1_url: HTTP_URL
			category2_url: HTTP_URL
		do
			io.put_string ("================================================================================%N")
			io.put_string ("Test: Item%N")
			io.put_string ("================================================================================%N")

			create item_url.make ("http://beeblebrox.net/Test/Case")
			create item.make ("Just a test", item_url, "This is just a simple test case")
			io.put_string (item.to_string)
			
			io.put_string ("--------------------------------------------------------------------------------%N")
			
			create category1_url.make ("http://beeblebrox.net/Test/")
			create category1.make_title_domain ("Test", category1_url)
			item.add_category (category1)
			io.put_string (item.to_string)
			
			io.put_string ("--------------------------------------------------------------------------------%N")
			
			create category2_url.make ("http://beeblebrox.net/Main/")
			create category2.make_title_domain ("Main", category2_url)
			item.add_category (category2)
			io.put_string (item.to_string)
			
			io.put_string ("--------------------------------------------------------------------------------%N")
			
			item.sort_categories_by_title
			io.put_string (item.to_string)
			
			io.put_string ("--------------------------------------------------------------------------------%N")
			
			item.sort_categories_by_domain
			item.remove_category (category1)
			io.put_string (item.to_string)
			
			io.put_string ("--------------------------------------------------------------------------------%N")
			item.set_read (True)
			item.remove_category (category1)
			io.put_string (item.to_string)
			
			io.put_string ("================================================================================%N%N")				
		end

end -- class TEST
