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
			test_category_item
			test_item_source
			test_item_guid
			test_item_enclosure
			test_item
			
			-- Channel
			test_cloud
			test_image
			test_text_input
			test_channel
		end
		
feature -- Test

	test_channel is
			-- Test the channel class
		local
			channel: CHANNEL
		do
			
		end

	test_text_input is
			-- Test the cloud class
		local
			text_input: TEXT_INPUT
			link: HTTP_URL
		do
			io.put_string ("================================================================================%N")
			io.put_string ("Test: Text input%N")
			io.put_string ("================================================================================%N")
			
			create link.make ("http://beeblebrox.net/Blabla")
			create text_input.make ("Test", "A description", "Just a test", link)
			io.put_string (text_input.to_string)
			
			io.put_string ("--------------------------------------------------------------------------------%N")
			
			text_input.set_description ("Another description")
			text_input.set_link (link)
			text_input.set_name ("Hmmm")
			text_input.set_title ("Lalala")
			io.put_string (text_input.to_string)
			
			io.put_string ("================================================================================%N%N")			
		end

	test_image is
			-- Test the cloud class
		local
			image: IMAGE
			url: HTTP_URL
			link: HTTP_URL
		do
			io.put_string ("================================================================================%N")
			io.put_string ("Test: Image%N")
			io.put_string ("================================================================================%N")
			
			create url.make ("http://beeblebrox.net/Blabla/test.png")
			create link.make ("http://beeblebrox.net/Blabla")
			create image.make (url, "Just a test", link)
			io.put_string (image.to_string)
			
			io.put_string ("--------------------------------------------------------------------------------%N")
			
			image.set_height (100)
			image.set_width (100)
			image.set_description ("Just a little test image")
			io.put_string (image.to_string)
			
			io.put_string ("================================================================================%N%N")			
		end

	test_cloud is
			-- Test the cloud class
		local
			cloud: CLOUD
		do
			io.put_string ("================================================================================%N")
			io.put_string ("Test: Cloud%N")
			io.put_string ("================================================================================%N")
			
			create cloud.make ("radio.xmlstoragesystem.com", 80, "/RPC2", "xmlStorageSystem.rssPleaseNotify", "xml-rpc")
			io.put_string (cloud.to_string)
			
			io.put_string ("--------------------------------------------------------------------------------%N")
			
			cloud.set_domain ("radio.xmlstoragesystem.net")
			cloud.set_port (65444)
			cloud.set_path ("/RPC")
			cloud.set_register_procedure ("xmlStorageSystem.rssPleaseNotifyNew")
			cloud.set_protocol ("xml-rpc2")
			io.put_string (cloud.to_string)
			
			io.put_string ("================================================================================%N%N")			
		end
		

	test_item is
			-- Test the item class
		local
			item: ITEM
			enclosure: ITEM_ENCLOSURE
			guid: ITEM_GUID
			source: ITEM_SOURCE
			category: CATEGORY
			url: HTTP_URL
		do
			io.put_string ("================================================================================%N")
			io.put_string ("Test: Item%N")
			io.put_string ("================================================================================%N")

			create url.make ("http://beeblebrox.net/Blabla")
			create item.make ("Test", url, "This is a simple item%NJust to test")
			
			create url.make ("http://beeblebrox.net/Blabla")
			create source.make ("Just a test", url)
			item.set_source (source)
			
			create url.make ("http://beeblebrox.net/Blabla")
			create enclosure.make (url, 10, "Test")
			item.set_enclosure (enclosure)
			
			create guid.make_perma_link ("http://www.symlink.ch")
			item.set_guid (guid)
			
			create category.make_title_domain ("Blabla", url)
			item.add_category (category)
			
			create category.make_title_domain ("AnotherBlabla", url)
			item.add_category (category)
			
			io.put_string (item.to_string)
			
			io.put_string ("--------------------------------------------------------------------------------%N")
			
			item.remove_category (category)
			io.put_string (item.to_string)
			
			io.put_string ("--------------------------------------------------------------------------------%N")
			
			item.categories.wipe_out
			io.put_string (item.to_string)
			
			io.put_string ("================================================================================%N%N")
		end

	test_item_enclosure is
			-- Test the item_enclosure class
		local
			enclosure: ITEM_ENCLOSURE
			url: HTTP_URL
		do
			io.put_string ("================================================================================%N")
			io.put_string ("Test: Item enclosure%N")
			io.put_string ("================================================================================%N")
			
			create url.make ("http://beeblebrox.net/Blabla")
			create enclosure.make (url, 10, "Test")

			io.put_string (enclosure.to_string)
			
			io.put_string ("--------------------------------------------------------------------------------%N")
			
			create url.make ("http://slashdot.org/Asdf")
			enclosure.set_url (url)
			enclosure.set_length (20)
			enclosure.set_type ("Another/Type")
			
			io.put_string (enclosure.to_string)
			
			io.put_string ("================================================================================%N%N")
		end

	test_item_guid is
			-- Test the item_guid class
		local
			guid: ITEM_GUID
		do
			io.put_string ("================================================================================%N")
			io.put_string ("Test: Item guid%N")
			io.put_string ("================================================================================%N")
			
			create guid.make ("Test")
			guid.set_guid ("Another Test")
			
			io.put_string (guid.to_string)
			
			io.put_string ("--------------------------------------------------------------------------------%N")
			
			create guid.make_perma_link ("http://www.symlink.ch")
			
			io.put_string (guid.to_string)
			
			io.put_string ("================================================================================%N%N")
		end

	test_item_source is
			-- Test the item_source class
		local
			source: ITEM_SOURCE
			url: HTTP_URL
		do
			io.put_string ("================================================================================%N")
			io.put_string ("Test: Item Source%N")
			io.put_string ("================================================================================%N")

			create url.make ("http://beeblebrox.net/Blabla")
			create source.make ("Just a test", url)
			
			io.put_string (source.to_string)
			
			io.put_string ("--------------------------------------------------------------------------------%N")
			
			source.set_name ("Hmm")
			create url.make ("http://www.symlink.ch")
			source.set_url (url)
			
			io.put_string (source.to_string)
			
			io.put_string ("================================================================================%N%N")
		end

	test_category_item is
			-- Test the category class
		local
			category: CATEGORY
			url: HTTP_URL
		do
			io.put_string ("================================================================================%N")
			io.put_string ("Test: Category item%N")
			io.put_string ("================================================================================%N")
			
			create category.make
			create url.make ("http://beeblebrox.net/Blabla")
			
			category.set_title ("Blabla")
			category.set_domain (url)
			
			io.put_string (category.to_string)
			
			io.put_string ("--------------------------------------------------------------------------------%N")
			
			create category.make_title ("AnotherBlabla")
			
			io.put_string (category.to_string)
			
			io.put_string ("--------------------------------------------------------------------------------%N")
			
			create category.make_title_domain ("AnotherBlabla", url)
			create url.make ("http://www.osnews.com")
			category.set_domain (url)
			category.set_title ("JustATest")
			
			io.put_string (category.to_string)	
			
			io.put_string ("================================================================================%N%N")
		end

end -- class TEST
