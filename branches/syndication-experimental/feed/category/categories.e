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
		
feature -- Sort

	title_equal (first, second: CATEGORY): BOOLEAN is
			-- Checks whether two categories have the same title
		require
			first_non_void: first /= Void
			second_non_void: second /= Void
		do
			Result := first.title = second.title
		end
		
	title_before (first, second: CATEGORY): BOOLEAN is
			-- Checks whether two categories have the same title
		require
			first_non_void: first /= Void
			second_non_void: second /= Void			
		do
			Result := first.title < second.title
		end
		
	sort_categories_by_title is
			-- Sort categories by title
		do
			categories.set_custom_before (agent title_before)
			categories.set_custom_equal (agent title_equal)
			categories.sort
		end
		
feature {CATEGORIES} -- Initialize `categories'

	initialize_categories is
			-- Initialize `categories'
		do
			create categories.make_empty (agent title_equal, agent title_before)
		end
		
invariant
	non_void_categories: categories /= Void

end -- class CATEGORIES
