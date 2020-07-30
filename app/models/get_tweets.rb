require 'net/http'
require "open-uri"
class GetTweets 

    def self.get_a_tweet(status_number)
        uri = URI("https://publish.twitter.com/oembed?url=https://twitter.com/tweet_your_fact/status/#{status_number}")
        res = Net::HTTP.get_response(uri)
        gimme = JSON.parse(res.body)
        gimme['html']
    end

end
