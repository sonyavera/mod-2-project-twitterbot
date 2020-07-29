class Bot

    def self.search_words(words)
        CLIENT.search(words, lang: "en").first.text 
    end

    def self.update(content)
        #1. set the value for content, which is whats generated from the fun fact API
              #get target handle from database, get the topic ID from facts_api.rb 
        #2. pass it to the client to write the tweet
        #3. create a new instance of tweet with the status number thats returned by the client
        #and update the instance of the tweet with the user ID and the topic ID
        CLIENT.update(content)
        
    end



end