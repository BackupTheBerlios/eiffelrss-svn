indexing
	description	: "Root class for this application."
	author		: "Martin Luder"
	date		: "$Date$"
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
			if is_debug then
				logfile.set_threshold (feature{LOGFILE}.Developer)
			end
			logfile.log_message ("Initialization: application started and logfile created", logfile.info)
			
				-- Open properties files
			load_properties
			
				-- load saved URIs from disk
			load_feed_uris

			create feed_manager.make
			
			create_application_displayer
			
			post_launch_actions.extend (agent application_displayer.load_and_initialize_feeds)
		end
	
	launch is
			-- launch application
		local
			clm: CL_MAIN
		do
			if is_cl then
				logfile.log_message ("Launching command line interface...", feature{LOGFILE}.Info)
				clm ?= application_displayer
				if clm /= void then
					is_launched := True
					clm.start
				end
			else
				logfile.log_message ("Launching GUI...", feature{LOGFILE}.Info)
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
	
	current_feed: FEED is
			-- current feed
		do
			Result := feed_manager.item (current_feed_url)
		end
		
	
	current_feed_url: STRING
	
	feed_manager: FEED_MANAGER

feature -- Basic Operations

	load_feed (link: STRING) is
			-- load feed into feed manager
		require
			link_not_void: link /= void
		do
			logfile.log_message ("loading feed from '" + link + "'...", feature{LOGFILE}.Info)
			feed_manager.add_from_url (link)
			current_feed_url := link
			logfile.log_message ("done.", feature{LOGFILE}.Info)
		end
	
	load_feeds is
			-- load all feeds
		do
			if feeds.count > 0 then
				logfile.log_message ("Loading all feeds...", feature{LOGFILE}.Info)
				application_displayer.information_displayer.show_progress (feeds.count)
				from
					feeds.start
				until
					feeds.after
				loop
					load_feed (feeds.item)
					feeds.forth
					application_displayer.information_displayer.progress_forward
				end
				application_displayer.information_displayer.progress_done
				logfile.log_message (feed_manager.count.out + " feeds loaded", feature{LOGFILE}.Info)
			else
				logfile.log_message ("No feeds to load!", feature{LOGFILE}.Info)
			end
		end
		
	set_current_feed_url (a_feed_url: STRING) is
			-- set current_feed to a_feed
		require
			a_feed_url_not_void: a_feed_url /= void
		do
			current_feed_url := a_feed_url
		end
		
		
feature {NONE} -- Implementation

	is_no_debug_window: BOOLEAN
			-- if true, no debug window will be created, just plain logfile
	
	is_debug: BOOLEAN
			-- if true, output developer information
	
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
			if env.Command_line.index_of_word_option ("debug") /= 0 then
				is_debug := true
			end
		end

invariant
	application_displayer_not_void_after_initialization: (application_displayer = void) implies not application_displayer_initialized
	feed_selected_if_feeds_loaded: (feed_manager.count > 0) implies (current_feed_url /= void)
end -- class APPLICATION
