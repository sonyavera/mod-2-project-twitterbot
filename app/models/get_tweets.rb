require 'net/http'
require "open-uri"
class GetTweets 

    def self.get_a_tweet(status_number)  
        uri = URI("https://publish.twitter.com/oembed?url=#{status_number}")
        res = Net::HTTP.get_response(uri)
       gimme = JSON.parse(res.body)
       gimme['html']
    end

end
