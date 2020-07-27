class User < ApplicationRecord
    has_many :tweets
    has_many :user_topics
    has_many :targets, through: :tweets
    has_many :topics, through: :user_topics
end
