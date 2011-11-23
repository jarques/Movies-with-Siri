#
#   Movies with Siri
#   by @jarques
#
#   An easy way to check Rotten Tomatoes score via Siri, by asking "what is the rating of twister"
#   v0.3
#

require 'tweakSiri'
require 'siriObjectGenerator'
require 'json' 
require 'open-uri'

class Movies < SiriPlugin

  def initialize()
    @api_key = "ROTTEN TOMATOES API KEY"
  end

  def object_from_guzzoni(object, connection)     
    object
  end

  def object_from_client(object, connection)  
    object
  end

  def speech_recognized(object, connection, phrase)
    if(phrase.match(/what is the rating of (.+)/i))
      self.plugin_manager.block_rest_of_session_from_server

      search_term = $1.strip

      url = "http://api.rottentomatoes.com/api/public/v1.0/movies.json?q=#{search_term}&page_limit=1&page=1&apikey=#{@api_key}"
      results = JSON.parse(open(url).read)
      
      reply = self.construct_reply(results)

      return generate_siri_utterance(connection.lastRefId, reply)
    end

    object
  end
  
  def construct_reply(results)
    user_rating = results["movies"][0]["ratings"]["audience_score"]
    title       = results["movies"][0]["title"]
    
    if user_rating < 50
      "It looks like #{title} didn't do so well, #{user_rating}%"
    elsif user_rating < 70
      "#{title} looks okay, a score of #{user_rating}%"
    elsif user_rating < 80
      "Not bad, #{title} received #{user_rating}%"
    else
      "Great, #{title} got #{user_rating}%. I'll get the popcorn."
    end
    
  end

end