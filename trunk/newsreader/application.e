indexing
	description	: "Root class for this application."
	author		: "Martin Luder"
	date		: "$Date: 2005/1/13 18:10:25 $"
	revision	: "1.0.0"

class
	APPLICATION

inherit
	EV_APPLICATION
		redefine
			launch
		end
	
	APPLICATION_PROPERTIES
		undefine
			default_create,
			copy,
			is_equal
		end

create
	make_and_launch

feature {NONE} -- Initialization

	make_and_launch is
			-- Initialize and launch application
		do
			default_create
			prepare
			launch
		end

	prepare is
			-- Prepare the first window to be displayed.
			-- Perform one call to first window in order to
			-- avoid to violate the invariant of class EV_APPLICATION.
		do
			parse_command_line
			
				-- create logfile
			create_log
			logfile.log_message ("Initialization: application started and logfile created", logfile.info)
			
				-- testing
			create current_feed.make ("EiffelRSS", create {HTTP_URL}.make ("http://eiffelrss.berlios.de/Main/AllRecentChanges?action=rss"), "AllRecentChanges")
			current_feed.new_item ("Version 23 released!", create {HTTP_URL}.make ("http://eiffelrss.berlios.de/Main/News"), 
				"Version 23 of EiffelRSS got release today. Happy syndicating!")
			current_feed.last_added_item.add_category (create {CATEGORY}.make_title_domain ("News", create {HTTP_URL}.make ("http://eiffelrss.berlios.de/Main/News/")))
			current_feed.last_added_item.set_pub_date (create {DATE_TIME}.make (2005, 1, 18, 15, 23, 0))
			
			current_feed.new_item ("Microsoft uses EiffelRSS", create {HTTP_URL}.make ("http://eiffelrss.berlios.de/Main/WhoUsesEiffelRSS"), 
				"Microsoft announced in a press release today that they will use EiffelRSS to syndicate news on their website.")
			current_feed.last_added_item.set_source (create {ITEM_SOURCE}.make ("Microsoft", create {HTTP_URL}.make ("http://www.microsoft.com")))
			current_feed.last_added_item.set_enclosure (create {ITEM_ENCLOSURE}.make (create {HTTP_URL}.make ("http://eiffelrss.berlios.de/files/ms-press-release.pdf"), 1000, "application/pdf"))
			current_feed.last_added_item.set_pub_date (create {DATE_TIME}.make (2005, 1, 19, 01, 58, 0))
				
			current_feed.new_item ("EiffelRSS wins award", create {HTTP_URL}.make ("http://eiffelrss.berlios.de/Main/Awards"),
				"EiffelRSS has been awarded by ISE as best syndication software written in Eiffel. For more info see award-winning pages: http://eiffelrss.berlios.de")
			current_feed.last_added_item.set_guid (create {ITEM_GUID}.make_perma_link ("http://eiffelrss.berlios.de/newsItem42"))
			current_feed.last_added_item.set_pub_date (create {DATE_TIME}.make (2005, 1, 21, 17, 34, 0))
			logfile.log_message ("Initialization: added test feed which will HAVE TO BE REMOVED", feature{LOGFILE}.Warning)
			
				-- Open properties files
			load_properties

			create_application_displayer
			
				-- create debug window and hide
		end
	
	launch is
			-- launch application
		local
			clm: CL_MAIN
		do
			if is_cl then
				logfile.log_message ("Loading command line interface...", feature{LOGFILE}.Info)
				clm ?= application_displayer
				if clm /= void then
					is_launched := True
					clm.start
				end
			else
				logfile.log_message ("Loading GUI...", feature{LOGFILE}.Info)
				Precursor
			end
		end
		

feature -- Events

	on_debug_window is
		local
			dw: DEBUG_WINDOW
		do
			dw ?= logfile
			if dw /= void then
				if dw.is_show_requested then
					logfile.log_message ("Hiding debug window", feature{LOGFILE}.Info)
					dw.hide
				else
					logfile.log_message ("Showing debug window", feature{LOGFILE}.Info)
					dw.show
				end
			end
		end

feature -- Access

	application_displayer: APPLICATION_DISPLAYER
	
	current_feed: FEED
	
feature {NONE} -- Implementation

	is_no_debug_window: BOOLEAN
			-- if true, no debug window will be created, just plain logfile
	
	is_cl: BOOLEAN
			-- run in command line
			
	application_displayer_initialized: BOOLEAN
		
	create_log is
			-- 
		local
			dw: DEBUG_WINDOW
		do
			if is_no_debug_window then
				create logfile.make_filename ("newsreader.log")
				logfile.set_threshold (logfile.Developer)
			else
				create {DEBUG_WINDOW}logfile.make_filename_threshold ("newsreader.log", feature {LOGFILE}.Developer)
				
				dw ?= logfile
				if dw /= void then
					dw.hide
				end
			end
		end
		
	create_application_displayer is
			-- create displayer for application
		local
			mw: MAIN_WINDOW
		do
			if is_cl then
				create {CL_MAIN}application_displayer.make
			else
				create {MAIN_WINDOW}application_displayer.make
				
				mw ?= application_displayer
				if mw /= void then
					mw.show
				end
			end
			
			application_displayer_initialized := true
		end

	parse_command_line is
			-- parse command line options
		local
			env: EXECUTION_ENVIRONMENT
		do
			create env
			if env.command_line.index_of_word_option ("no_debug_window") /= 0 then
				is_no_debug_window := true
			end
			if env.command_line.index_of_word_option ("cl") /= 0 then
				is_cl := true
			end
		end
		
invariant
	application_displayer_not_void_after_initialization: (application_displayer = void) implies not application_displayer_initialized
end -- class APPLICATION
