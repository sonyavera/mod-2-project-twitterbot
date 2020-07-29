class Topic < ApplicationRecord
    has_many :user_topics
    has_many :tweets
end
