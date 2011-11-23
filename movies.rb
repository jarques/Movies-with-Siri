require 'tweakSiri'
require 'siriObjectGenerator'
require 'json' 
require 'open-uri'

class Movies < SiriPlugin
  
  def initialize()
		@api_key = "ROTTEN TOMATOES API KEY"		
	end

	# This gets called every time an object is received from the Guzzoni server
	def object_from_guzzoni(object, connection) 		
		object
	end
		
	# This gets called every time an object is received from an iPhone
	def object_from_client(object, connection)	
		object
	end
	
	def speech_recognized(object, connection, phrase)
		if(phrase.match(/what is the rating of (.+)/i))
			self.plugin_manager.block_rest_of_session_from_server
			
			term = $1.strip
			
			url = "http://api.rottentomatoes.com/api/public/v1.0/movies.json?q=#{term}&page_limit=1&page=1&apikey=#{@api_key}"
  	  results = JSON.parse(open(url).read)
  	  
  	  audience_score = results["movies"][0]["ratings"]["audience_score"]
			
			return generate_siri_utterance(connection.lastRefId, "Overall audience score is #{audience_score}")
		end
		
		object
	end
	
end