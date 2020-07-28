require 'httparty'
require 'pp'
require 'json'



class FactsApi
    def self.get(category)
        response = HTTParty.get("https://api.fungenerators.com/fact/random?category=#{category}", headers: {"X-FunGenerators-Api-Secret" => "O755v78j41MyGnyzcJKuRQeF"})
        test = JSON.parse(response.body)
        pp test
    end
end