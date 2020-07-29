class Tweet < ApplicationRecord
    belongs_to :user 
    belongs_to :target
    has_one :topic
    
    # accepts_nested_attributes_for :topic
end
