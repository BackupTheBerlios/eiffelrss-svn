indexing
	description: "Class which represents a log file"
	author: "Michael Käser"
	date: "$Date$"
	revision: "$Revision$"

class
	LOGFILE

inherit
	PLAIN_TEXT_FILE

create
	make_filename_threshold

feature -- Initialization
	make_filename_threshold (a_filename: STRING; a_threshold: INTEGER) is
			-- Create logfile object with a_filename as file name and a_threshold as output threshold
		require else
			valid_threshold: a_threshold >= 0
			valid_filename: a_filename /= Void
			filename_not_empty: not a_filename.is_empty
		do
			make_open_read_append (a_filename)
			set_threshold (a_threshold)
		ensure then
			threshold_set: output_threshold = a_threshold
			file_is_open: is_open_append
		end
	
	set_threshold (a_threshold: INTEGER) is
			-- Set the output threshold to a_threshold
		require
			valid_threshold: a_threshold >= 0
		do
			output_threshold := a_threshold
		ensure
			threshold_set: output_threshold = a_threshold
		end
		
	log_message (a_message: STRING; a_priority: INTEGER) is
			-- Log the message to the logfile if a_priority is equal or greater than the threshold
		require
			valid_priority: a_priority >= 0
		local
			time_now: DATE_TIME				
			timestamp: STRING
			lines: LIST [STRING]
			i: INTEGER
		do
			if (a_priority >= output_threshold) then	
				create time_now.make_now				
				timestamp := "[" + time_now.formatted_out ("[0]hh:[0]mi:[0]ss [0]dd mmm yyyy") + "]: "
				
				lines := a_message.split ('%N')				
				
				from
					i := 1
				until
					i > lines.count
				loop
					if (i = 1) then
						put_string (timestamp)
					else
						put_string ("                        ")
					end
					put_string (lines.i_th(i))
					put_new_line
					
					i := i + 1
				end
			
				flush ()
				messages_logged := messages_logged + 1
			end
		ensure
			(a_priority <= output_threshold) implies (messages_logged = old messages_logged + 1)
		end
		
feature -- Access
	output_threshold: INTEGER
	messages_logged: INTEGER
	
end -- class LOGFILE
