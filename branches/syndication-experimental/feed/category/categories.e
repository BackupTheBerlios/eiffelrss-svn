indexing
	description: "Class that can be inherited by classes which use categories, like item or channel."
	author: "Thomas Weibel"
	date: "$Date$"
	revision: "$Rev$"

deferred class
	CATEGORIES
	
feature -- Access

	categories: CATEGORY_LIST
			-- Categories list containing category items
			
feature -- Setter

	set_categories (category_list: CATEGORY_LIST) is
			-- Set categories with a new category list
		require
			non_void_categories: category_list /= Void
		do
			categories := category_list
		ensure
			categories_set: categories.is_equal (category_list)
		end
		
feature -- Basic operations

	add_category (category: CATEGORY) is
			-- Add a category item
		require
			non_void_category_item: category /= Void
		do
			categories.extend (category)
		ensure
			one_more_category: categories.count = old categories.count + 1
			category_added: categories.i_th (categories.count) = category
		end
		
	remove_category (category: CATEGORY) is
			-- Remove a category item
		require
			non_void_category_item: category /= Void
		do
			categories.prune (category)
		ensure
			-- category_removed: old categories.has (category) implies categories.count + 1 = old categories.count
		end
		
invariant
	non_void_categories: categories /= Void

end -- class CATEGORIES
