require 'httparty'
require 'pp'
require 'json'



class FactsApi
    def self.get(category)
        response = HTTParty.get("https://api.fungenerators.com/fact/random?category=#{category}", headers: {"X-FunGenerators-Api-Secret" => "O755v78j41MyGnyzcJKuRQeF"})
        test = JSON.parse(response.body)
        test
    end

    def self.get_all_categories
        response = HTTParty.get("https://api.fungenerators.com/fact/categories", headers: {"X-FunGenerators-Api-Secret" => "O755v78j41MyGnyzcJKuRQeF"})
        pp cat_list = JSON.parse(response.body)
         
    end
end