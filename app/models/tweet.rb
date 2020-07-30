class Tweet < ApplicationRecord
    belongs_to :user 
    belongs_to :target
    has_one :topic
    
    # accepts_nested_attributes_for :topic
    def all_tweets_by_user(user_id)
        Tweet.all.select do |tweet|
            Tweet.user_id == user_id
        end
    end
end
