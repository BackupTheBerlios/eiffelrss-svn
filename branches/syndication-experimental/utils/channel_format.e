indexing
	description: "Class to represent different channel formats."
	author: "Thomas Weibel"
	date: "$Date$"
	revision: "$Rev$"

class
	CHANNEL_FORMAT
	
create
	make
	
feature -- Initialization

	make (a_format: STRING) is
			-- Create a channel format
		require
			non_empty_format: a_format /= Void and then not a_format.is_empty
		do
			format := a_format
		ensure
			format_set: format = a_format
		end
		
feature -- Constants

		Unknown: CHANNEL_FORMAT is
				-- Unknown channel format
			once
				create Result.make ("Unknown")
			end
			
		Rss_0_90: CHANNEL_FORMAT is
				-- RSS 0.90
			once
				create Result.make ("RSS 0.90")
			end
			
		Rss_0_91: CHANNEL_FORMAT is
				-- RSS 0.91
			once
				create Result.make ("RSS 0.91")
			end
			
		Rss_0_92: CHANNEL_FORMAT is
				-- RSS 0.92
			once
				create Result.make ("RSS 0.92")
			end

		Rss_0_93: CHANNEL_FORMAT is
				-- RSS 0.93
			once
				create Result.make ("RSS 0.93")
			end

		Rss_0_94: CHANNEL_FORMAT is
				-- RSS 0.94
			once
				create Result.make ("RSS 0.94")
			end

		Rss_1_0: CHANNEL_FORMAT is
				-- RSS 1.0
			once
				create Result.make ("RSS 1.0")
			end

		Rss_2_0: CHANNEL_FORMAT is
				-- RSS 2.0
			once
				create Result.make ("RSS 2.0")
			end

feature -- Access

	format: STRING
			-- Channel format

invariant
	non_empty_format: format /= Void and then not format.is_empty

end -- class CHANNEL_FORMAT
