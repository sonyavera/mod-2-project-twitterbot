require 'httparty'
require 'pp'
require 'json'

class FactsApi
    def self.get(category)
        response = HTTParty.get("https://api.fungenerators.com/fact/random?category=#{category}", headers: {"X-FunGenerators-Api-Secret" => "O755v78j41MyGnyzcJKuRQeF"})
        test = JSON.parse(response.body)
        if test["contents"]["fact"] == nil
           "Sorry there wasn't a fact for this topic, try again!"
        else
        category_title = test["contents"]["subcategory"].strip
        fact = test["contents"]["fact"]
        "#{category_title}: #{fact}"
        end
    end

    def self.get_all_categories
        response = HTTParty.get("https://api.fungenerators.com/fact/categories", headers: {"X-FunGenerators-Api-Secret" => "O755v78j41MyGnyzcJKuRQeF"})
        catagory_list = JSON.parse(response.body)
        catagory_list["contents"]["categories"].map do |facts|
            facts["category"]
        end
    end

    def self.create_category
      cats = self.get_all_categories
        cats.each do |cat|
            new_word = cat.strip
            Topic.create(name: new_word)
        end
    end

end