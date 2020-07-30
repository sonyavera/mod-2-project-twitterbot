class User < ApplicationRecord

    has_many :tweets
    has_many :targets, through: :tweets
    has_many :user_topics
    has_many :topics, through: :user_topics
    
    before_validation {self.username = self.username.downcase}
    validates :first_name, :last_name, :username, presence: true
    validates :username, uniqueness: true

    has_secure_password
end